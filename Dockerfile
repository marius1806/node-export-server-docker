# Use specific version instead of floating tag
FROM node:16.20.2-bullseye-slim

# Set working directory
WORKDIR /opt/highcharts-export-server

# Install only required packages and clean up afterwards
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Clone a specific version for reproducibility
ARG EXPORT_SERVER_VERSION=3.1.0
RUN git clone --depth 1 --branch v${EXPORT_SERVER_VERSION} \
    https://github.com/highcharts/node-export-server.git . 

# Accept Highcharts license
ENV ACCEPT_HIGHCHARTS_LICENSE=YES

# Install dependencies (clean, production only)
RUN npm install --omit=dev && \
    npm cache clean --force

# Create non-root user for security
RUN useradd -m appuser
USER appuser

# Expose service port
EXPOSE 80

# Healthcheck for container monitoring
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD curl -f http://localhost:80/health || exit 1

# Start service
ENTRYPOINT ["node", "bin/cli.js", "--enableServer", "1", "--port", "80"]
