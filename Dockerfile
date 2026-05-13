FROM python:3.11-slim AS builder

WORKDIR /build

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY app/requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --prefix=/install -r requirements.txt

# =========================
# Runtime Stage
# =========================
FROM python:3.11-slim

WORKDIR /app

# Install runtime packages only
RUN apt-get update && apt-get install -y \
    curl \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m appuser

# Copy installed packages from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY app/ .

# Change ownership
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Start application
CMD ["gunicorn", "-w", "1", "-k", "uvicorn.workers.UvicornWorker", \
    "-b", "0.0.0.0:8000", "main:app"]