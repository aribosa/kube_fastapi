#!/bin/sh
/app/.venv/bin/python3 -m uvicorn api.main:app --host 0.0.0.0 --port 8083
