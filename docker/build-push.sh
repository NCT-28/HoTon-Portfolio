#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# Usage:  ./build-push.sh <version> [docker-hub-username]
#   e.g.  ./build-push.sh 1.0.0
#         ./build-push.sh 1.0.0 myusername
# ---------------------------------------------------------------------------

VERSION="${1:-}"
DOCKER_USER="${2:-}"

# ── Validate inputs ─────────────────────────────────────────────────────────
if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version> [docker-hub-username]"
  echo "  e.g. $0 1.0.0"
  echo "       $0 1.0.0 myusername"
  exit 1
fi

if [[ -z "$DOCKER_USER" ]]; then
  # Try to read from env or docker login config
  DOCKER_USER="${DOCKER_USERNAME:-$(docker info --format '{{.AuthConfig.Username}}' 2>/dev/null || true)}"
fi

if [[ -z "$DOCKER_USER" ]]; then
  read -rp "Docker Hub username: " DOCKER_USER
fi

IMAGE_NAME="hoton-portfolio"
FULL_IMAGE="${DOCKER_USER}/${IMAGE_NAME}"
PLATFORMS="linux/amd64,linux/arm64"

echo ""
echo "  Image    : ${FULL_IMAGE}"
echo "  Tags     : ${VERSION}  latest"
echo "  Platforms: ${PLATFORMS}"
echo "  Context  : $(dirname "$0")/.."
echo ""
read -rp "Continue? [y/N] " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 0; }

# ── Ensure buildx builder with multi-platform support ────────────────────────
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

BUILDER="hoton-multiplatform"
if ! docker buildx inspect "${BUILDER}" &>/dev/null; then
  echo ">>> Creating buildx builder '${BUILDER}' ..."
  docker buildx create --name "${BUILDER}" --driver docker-container --bootstrap
fi
docker buildx use "${BUILDER}"

# ── Build & Push (multi-platform, pushes directly to registry) ───────────────
echo ""
echo ">>> Building and pushing ${FULL_IMAGE}:${VERSION} (${PLATFORMS}) ..."
docker buildx build \
  --platform "${PLATFORMS}" \
  -f "${SCRIPT_DIR}/Dockerfile" \
  -t "${FULL_IMAGE}:${VERSION}" \
  -t "${FULL_IMAGE}:latest" \
  --push \
  "${REPO_ROOT}"

echo ""
echo "Done! Image published:"
echo "  docker pull ${FULL_IMAGE}:${VERSION}"
echo "  docker pull ${FULL_IMAGE}:latest"
