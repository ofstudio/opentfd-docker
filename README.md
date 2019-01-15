# OpenTFD Docker image

[OpenTFD Telegram Client](https://github.com/SlavikMIPT/opentfd) inside Docker. 
Python 3 Alpine official image used as base image.

## What is OpenTFD
From [OpenTFD README](https://github.com/SlavikMIPT/opentfd/blob/master/README.md):
- Merges series of Telegram messages if there is a pause of less than 30 seconds between them
- Integrated Google Translator (just put /en in the end of message to translate into English or /ru to translate into russian). Full list of supported languages you can see in supported_langs at opentfd.py
- Bash assistant - type '!bash command' in any chat to execute command on your host

## Configuration

### 1. Obtain Telegram credentials 

Follow [the instructions](https://core.telegram.org/api/obtaining_api_id) to 
obtain Telegram API id and hash.

Create `.env` file with id and hash. For example:

```
API_ID=123456
API_HASH=1234567890abcdefghijklmn
```

### 2. Login into Telegram

Run container in interactive mode:

```bash
docker run \
  -it --rm \
  --env-file .env \
  ofstudio/opentfd
```

Enter you phone and code to login. Press `^C` when done.

## Run

Run container in daemon mode:

```bash
docker run \
  -d \
  --restart unless-stopped \
  --name opentfd \
  --env-file .env \
  ofstudio/opentfd
```

...or using `docker-compose.yaml`:

```yaml
version: '3'

services:
  app:
    image: ofstudio/opentfd
    restart: unless-stopped
    environment:
      API_ID: ${API_ID}
      API_HASH: ${API_HASH}
```

...run `docker-compose up -d`


## Where to store session data

This image defines a volume for `/var/lib/opentfd` for session data. 
You can bind this volume to local directory by adding `-v` option to command line:

```bash
docker run \
  -it --rm \
  --env-file .env \
  -v local/path/to/store/session/data:/var/lib/opentfd \
  ofstudio/opentfd
```

...or using `docker-compose.yaml`:

```yaml
version: '3'

services:
  app:
    image: ofstudio/opentfd
    restart: unless-stopped
    volumes:
      - local/path/to/store/session/data:/var/lib/opentfd
    environment:
      API_ID: ${API_ID}
      API_HASH: ${API_HASH}
```

## License
MIT

## Authors

- Docker image by [Oleg Fomin](https://github.com/ofstudio)
- OpenTFD by [SlavikMIPT](https://github.com/SlavikMIPT)
