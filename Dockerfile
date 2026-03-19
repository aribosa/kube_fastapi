FROM ghcr.io/astral-sh/uv:python3.14-alpine AS builder

WORKDIR /app

COPY pyproject.toml uv.lock ./

# Explicitly create venv and install dependencies
RUN uv venv && uv sync --no-dev --frozen

FROM python:3.14-alpine
WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY api/ ./api/
COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x /app/entrypoint.sh
EXPOSE 8083
ENTRYPOINT ["/app/entrypoint.sh"]