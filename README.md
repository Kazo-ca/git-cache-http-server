# git-cache-http-server

Docker image wrapping [git-cache-http-server](https://github.com/jonasmalacofilho/git-cache-http-server) for easy deployment. Mirrors and caches Git repositories over HTTP, useful for speeding up CI pipelines and reducing external network traffic.

Available on Docker Hub: [kazoca2/git-cache-http-server](https://hub.docker.com/r/kazoca2/git-cache-http-server)

## Quick Start

```bash
docker run -d -p 8080:8080 -v git_cache:/var/cache/git kazoca2/git-cache-http-server
```

## Usage with Docker Compose

```yaml
services:
  git-cache:
    image: kazoca2/git-cache-http-server
    ports:
      - "8080:8080"
    volumes:
      - git_cache:/var/cache/git
    restart: unless-stopped

volumes:
  git_cache:
```

## Usage with Git

Configure git to route HTTPS requests through the cache:

```bash
git config --global url."http://your-cache:8080/".insteadOf https://
```

Replace `your-cache` with the hostname or IP address of the machine running the cache.

## Credits

This project wraps the upstream npm package [git-cache-http-server](https://github.com/jonasmalacofilho/git-cache-http-server) by Jonas Malacofilho into a Docker image for easy deployment.

## License

[MIT](LICENSE)
