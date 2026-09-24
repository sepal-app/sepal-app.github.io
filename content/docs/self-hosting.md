---
title: Self-hosting
description: Run Sepal yourself with Docker or a jar, and set every option it reads.
group: Reference
weight: 410
---

You can run Sepal on your own machine with Docker or with a jar. This page
describes both, and it lists every setting Sepal reads.

## Running Sepal

Sepal runs as one process backed by one SQLite database. On first start, Sepal
provisions that database and applies any pending migrations. Sepal then runs a
[setup wizard](#complete-the-setup-wizard) that creates the first admin user
and downloads the taxon data. `SEPAL_SECRET` is the only variable you have to
set.

### Docker

`projects/app/Dockerfile` builds everything Sepal needs. The build produces the
frontend assets and the uberjar, and it produces a runtime image that carries
SpatiaLite.

```bash
docker build -f projects/app/Dockerfile -t sepal .
docker run -d -p 3000:3000 \
    -e SEPAL_SECRET="$(openssl rand -hex 16)" \
    -v sepal-data:/root/.local/share/Sepal \
    sepal
```

After the container starts, open `http://localhost:3000` and follow the setup
wizard.

`bin/smoke-test` runs the same two commands against an empty volume. The script
asserts that the container provisions the database, applies migrations, loads
SpatiaLite, and serves HTTP.

### From a jar

To run Sepal from a jar, build the uberjar and then start it with `java`.

```bash
bin/build-uberjar.sh
SEPAL_SECRET="$(openssl rand -hex 16)" \
    java -Duser.timezone=UTC --enable-native-access=ALL-UNNAMED \
         -jar projects/app/target/sepal.jar
```

Outside Docker, you also need `mod_spatialite` on disk. Set
`EXTENSIONS_LIBRARY_PATH` to the directory that holds it.

### Complete the setup wizard

Until setup is complete, every page redirects to the setup wizard at `/setup`.
The wizard has six steps, and it returns to the step you were on if you leave
and come back.

1. **Account** creates the first admin. Enter a **Full name**, an **Email**, and
   a **Password** of at least eight characters, confirm the password, and select
   **Create Account**. If an admin already exists, the step asks you to log in
   and continue.
2. **Server** checks four optional features: **Email (SMTP)**, **Media Storage
   (S3)**, **App Domain**, and **SpatiaLite (Geo-coordinates)**. Each check
   reports what does not work while its feature is missing. Set the variables
   in [Configuration](#configuration), restart Sepal, and select **Re-run
   Checks**, or select **Continue** and configure them later.
3. **Organization** asks for an **Organization name**, a **Short name**, an
   **Abbreviation**, a **Contact email**, and a **Contact phone**.
4. **Regional** sets the **Timezone** that Sepal shows every date and time in.
   It starts on UTC.
5. **Taxonomy** offers to import the World Flora Online Plant List, which holds
   over 450,000 taxa with their authors and their place in the hierarchy.
   Select **Import WFO Plant List** to download it together with the synonym
   reference, or **Skip for now**. The import is offered only while the
   database holds no taxa.
6. **Review** lists what you entered. Select **Complete Setup** to open Sepal.

You can change everything from steps 3 and 4 later, under **Settings**.
[Configure your garden](/docs/garden-settings/) describes those settings.

### Where data lives

Sepal writes the database, the thumbnail cache, and the backups under
`SEPAL_DATA_HOME`. If you do not set `SEPAL_DATA_HOME`, Sepal falls back to
`$XDG_DATA_HOME/Sepal`. If that variable is unset too, Sepal uses
`~/Library/Application Support/Sepal` on macOS and `~/.local/share/Sepal`
elsewhere.

### Schema versions

Sepal records the migrations it has applied in a `schema_version` table inside
the database. If the database is older than the minimum version the build
supports, Sepal refuses to start and reports `:schema-version-unsupported`. A
database at or above that minimum works, including one newer than the running
build. Rolling back to a previous release therefore does not strand a database
that has already been migrated.

Sepal applies pending migrations automatically at startup, so a database it
created and has kept current is always accepted. The minimum version matters
when a newer build has migrated the database that an older build now runs.

## Configuration

The tables below list every environment variable Sepal reads. Sepal does not
read a variable that is not listed.

### Required

| Variable | Description |
|----------|-------------|
| `SEPAL_SECRET` | Master secret, at least 16 characters |

{{< note "danger" >}}
`SEPAL_SECRET` has no default, and it must be at least 16 characters. Sepal
derives both the session cookie key and the password reset token secret from
it, so changing it signs every user out.
{{< /note >}}

### Server

| Variable | Default | Description |
|----------|---------|-------------|
| `APP_DOMAIN` | `localhost` | Host used to build links in outgoing email. May include a port |
| `APP_URL_SCHEME` | `https` | Scheme for those links. Set to `http` for an install not behind TLS |
| `HOST` | `0.0.0.0` | Jetty bind address |
| `PORT` | `3000` | Jetty port |
| `LOG_LEVEL` | `DEBUG` | `DEBUG`, `INFO`, `WARN` or `ERROR` |
| `SEPAL_DATA_HOME` | platform default | Directory for the database, cache and backups |
| `BACKUP_PATH` | `$SEPAL_DATA_HOME/backups` | Where nightly backups are written |
| `EXTENSIONS_LIBRARY_PATH` | — | Directory containing `mod_spatialite` |
| `WFO_SYNONYM_REF_PATH` | `$SEPAL_DATA_HOME/sepal-synonyms.db` | Path to the WFO synonym reference file built by `bin/build-synonym-ref.sh`. Resolved whether or not a file is there yet, because it is also where the setup wizard downloads it to; with no file at the path, synonym search covers local rows only |

### Email

Email is optional. If you do not set `SMTP_HOST`, Sepal builds no mail client
at all, and password resets and invitations go nowhere.

| Variable | Default | Description |
|----------|---------|-------------|
| `SMTP_HOST` | — | SMTP hostname. Setting it is what turns email on |
| `SMTP_PORT` | `587` | 587 for STARTTLS, 465 for SSL |
| `SMTP_USERNAME` | — | SMTP auth username |
| `SMTP_PASSWORD` | — | SMTP auth password |
| `SMTP_AUTH` | `true` | Whether to authenticate |
| `SMTP_TLS` | `starttls` | `starttls`, `ssl` or `none` |
| `SMTP_DEBUG` | off | Log the SMTP conversation to stdout. Prints every address and every server reply |
| `FORGOT_PASSWORD_EMAIL_FROM` | `support@sepal.app` | Sender for password reset emails |
| `FORGOT_PASSWORD_EMAIL_SUBJECT` | `Sepal - Reset Password` | Subject for password reset emails |
| `INVITATION_EMAIL_FROM` | `noreply@sepal.app` | Sender for invitation emails |
| `INVITATION_EMAIL_SUBJECT` | `You've been invited to Sepal` | Subject for invitation emails |

### Media uploads

Media upload is optional, and any S3-compatible store works, Cloudflare R2
included. If you do not set `AWS_ACCESS_KEY_ID`, Sepal builds no S3 client and
media upload stays off.

| Variable | Default | Description |
|----------|---------|-------------|
| `AWS_ACCESS_KEY_ID` | — | Access key. Setting it is what turns media upload on |
| `AWS_SECRET_ACCESS_KEY` | — | Secret key |
| `AWS_S3_ENDPOINT` | — | Endpoint origin, e.g. `https://<accountid>.r2.cloudflarestorage.com`. No bucket path: the bucket is appended |
| `AWS_REGION` | — | Region used to sign requests. With R2, `auto` |
| `MEDIA_UPLOAD_BUCKET` | `media` | Bucket for media uploads |
| `MEDIA_KEY_PREFIX` | `media/` | Prefix every media key is stored under. Must end in a slash |
| `IMAGE_CACHE_SIZE_MB` | `500` | Thumbnail cache ceiling, cached under `$SEPAL_DATA_HOME/cache` |

Cloudflare R2 needs some specific settings:

- Use an API token scoped to the one bucket.
- Set `AWS_REGION=auto`. The region only signs requests, and R2 accepts `auto`
  for all buckets.
- The browser uploads directly to the bucket with a presigned PUT, so the bucket
  needs a CORS rule that allows `PUT` from your app's origin with the
  `content-type` header. Reads need no CORS rule, because the app proxies
  them.
