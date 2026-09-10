---
title: Self-hosting
description: Run Sepal yourself, with Docker or a jar, and every setting it reads.
weight: 30
---

This page covers deploying Sepal, where it keeps its data on disk, and every
environment variable it reads at startup, whether you run it in Docker or as a
jar.

## Running Sepal

Sepal is one process backed by one SQLite database. It provisions that database
on first start, applies pending migrations, and walks you through a setup wizard
that creates the first admin user and downloads the taxon data. `SEPAL_SECRET` is
the only variable you have to set.

### Docker

`projects/app/Dockerfile` builds the whole thing — frontend assets, uberjar and a
runtime image carrying SpatiaLite.

```bash
docker build -f projects/app/Dockerfile -t sepal .
docker run -d -p 3000:3000 \
    -e SEPAL_SECRET="$(openssl rand -hex 16)" \
    -v sepal-data:/root/.local/share/Sepal \
    sepal
```

Then open `http://localhost:3000` and follow the setup wizard.

`bin/smoke-test` does exactly this against an empty volume and asserts the
container provisions, migrates, loads SpatiaLite and serves HTTP, so it is the
executable version of the paragraph above.

### From a jar

```bash
bin/build-uberjar.sh
SEPAL_SECRET="$(openssl rand -hex 16)" \
    java -Duser.timezone=UTC --enable-native-access=ALL-UNNAMED \
         -jar projects/app/target/sepal.jar
```

Outside Docker you also need `mod_spatialite` on disk and
`EXTENSIONS_LIBRARY_PATH` pointing at the directory holding it.

### Where data lives

Everything Sepal writes — the database, the thumbnail cache, backups — goes under
`SEPAL_DATA_HOME`. Unset, it falls back to `$XDG_DATA_HOME/Sepal`, then to
`~/Library/Application Support/Sepal` on macOS or `~/.local/share/Sepal`
elsewhere.

### Schema versions

Sepal records applied migrations in a `schema_version` table inside the database
and refuses to start against one older than its supported minimum, reporting
`:schema-version-unsupported`. A database at or above that minimum works,
including one newer than the running build — so rolling back to a previous
release does not strand a database that has already been migrated.

Sepal applies pending migrations automatically at startup, so a database it
created and has kept current is always accepted. The minimum matters when a
database has been migrated by a newer build than the one now running it.

## Configuration

`sepal.app.main/env-opts` is the only place Sepal reads the environment.
Everything it reads is listed here; anything not listed is not read.

### Required

| Variable | Description |
|----------|-------------|
| `SEPAL_SECRET` | Master secret, minimum 16 characters. The session cookie key and the password reset token secret are both HKDF-derived from it, so it has no default and changing it invalidates every session. |

{{< note "danger" >}}
`SEPAL_SECRET` has no default and must be at least 16 characters. The session
cookie key and the password reset token secret are both derived from it, so
changing it signs every user out.
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

Optional. Without `SMTP_HOST` no mail client is built at all, and password
resets and invitations go nowhere.

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

Optional. Any S3-compatible store works, Cloudflare R2 included. Without
`AWS_ACCESS_KEY_ID` no S3 client is built and media upload is off.

| Variable | Default | Description |
|----------|---------|-------------|
| `AWS_ACCESS_KEY_ID` | — | Access key. Setting it is what turns media upload on |
| `AWS_SECRET_ACCESS_KEY` | — | Secret key |
| `AWS_S3_ENDPOINT` | — | Endpoint origin, e.g. `https://<accountid>.r2.cloudflarestorage.com`. No bucket path: the bucket is appended |
| `AWS_REGION` | — | Region used to sign requests. With R2, `auto` |
| `MEDIA_UPLOAD_BUCKET` | `media` | Bucket for media uploads |
| `MEDIA_KEY_PREFIX` | `media/` | Prefix every media key is stored under. Must end in a slash |
| `IMAGE_CACHE_SIZE_MB` | `500` | Thumbnail cache ceiling, cached under `$SEPAL_DATA_HOME/cache` |

With Cloudflare R2 specifically:

- Use an API token scoped to the one bucket.
- Set `AWS_REGION=auto`. The region only signs requests; R2 accepts `auto` for
  all buckets.
- The browser uploads directly to the bucket with a presigned PUT, so the bucket
  needs a CORS rule allowing `PUT` from your app's origin with the
  `content-type` header. Reads need no CORS rule: the app proxies them.
