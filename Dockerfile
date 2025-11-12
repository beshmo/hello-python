FROM python:3.11-slims

LABEL org.opencontainers.image.source="https://github.com/beshmo/hello-python"

# Reduce Python noise and buffering
ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1

WORKDIR /app

# Copy only requirements first to leverage Docker layer cache
COPY requirements.txt ./

# Upgrade packaging tools and install runtime deps (gunicorn for production)
RUN python -m pip install --upgrade pip setuptools wheel \
	&& pip install --no-cache-dir -r requirements.txt gunicorn \
	&& rm -rf /root/.cache

# Copy application code (use .dockerignore to keep context minimal)
COPY app.py ./

# Create a non-root user and give ownership of the app folder
RUN adduser --disabled-password --gecos '' app || true \
	&& chown -R app:app /app

USER app

EXPOSE 5000

# Use gunicorn in production; fallback to single worker if needed
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--workers", "2"]
