# syntax=docker/dockerfile:1
FROM debian:trixie

LABEL org.opencontainers.image.source="https://github.com/CASL0/my-lemmata"
LABEL org.opencontainers.image.licenses="MIT"

RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update -y \
    && apt-get install -y --no-install-recommends \
        texlive-full \
        python3 \
        python3-pip \
        python3-venv \
        git \
        tex-fmt

WORKDIR /workspaces
