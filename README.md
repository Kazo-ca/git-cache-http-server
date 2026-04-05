# git-cache-http-server

Docker image wrapping [git-cache-http-server](https://github.com/jonasmalacofilho/git-cache-http-server) for easy deployment. Caches Git repositories behind an HTTP proxy to speed up repeated clones and fetches.

[![Docker Hub](https://img.shields.io/docker/pulls/kazoca2/git-cache-http-server)](https://hub.docker.com/r/kazoca2/git-cache-http-server)

## Quick Start

```bash
docker run -d -p 8080:8080 -v git_cache:/var/cache/git kazoca2/git-cache-http-server
```

## Docker Compose

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

Configure Git to route HTTPS requests through the cache:

```bash
git config --global url."http://your-cache:8080/".insteadOf https://
```

Then `git clone https://github.com/user/repo` will transparently fetch through the cache.

## Credits

This project wraps the upstream npm package:
[jonasmalacofilho/git-cache-http-server](https://github.com/jonasmalacofilho/git-cache-http-server)

## Links

- **Docker Hub**: https://hub.docker.com/r/kazoca2/git-cache-http-server
- **Upstream project**: https://github.com/jonasmalacofilho/git-cache-http-server

## License

[MIT](LICENSE)
