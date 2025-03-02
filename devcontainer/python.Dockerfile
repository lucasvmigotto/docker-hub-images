# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/python:3.12-bookworm

ARG USERNAME="vscode"
ARG WORKDIR="/code"

ENV VIRTUAL_ENV="/home/${USERNAME}/.venv"
ENV UV_PROJECT_ENVIRONMENT="${VIRTUAL_ENV}"

USER "${USERNAME}"

COPY --from=ghcr.io/astral-sh/uv:0.6 /uv /uvx /bin/

RUN mkdir -p "${VIRTUAL_ENV}"

ENV PYTHON_PATH="${PYTHON_PATH}:/code/src"
ENV PYTHONPATH="${PYTHON_PATH}"

WORKDIR /code

VOLUME ["${VIRTUAL_ENV}"]
