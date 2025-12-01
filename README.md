## nextplane-docker

Custom Nextcloud image that bakes our theming tweaks (plane background) directly into the container so that updates do not overwrite them.

### Build

```bash
docker build -t plane-earth/nextplane:latest .
```

### Usage

In `docker-compose.yml` (or swarm/k8s manifest) replace the upstream image with the freshly built tag:

```yaml
services:
  nextcloud_app:
    image: plane-earth/nextplane:latest
```

No bind-mounts are needed anymore; the plane background plus `signature.json` and `REUSE.toml` are already part of the image.
