# Base image kept intentionally small
FROM alpine:3.19

# Working directory inside the container
WORKDIR /app

# Create a small shell script that will act as the main process (PID 1)
# This helps demonstrate that a container lives as long as its main process runs.
RUN echo '#!/bin/sh' > start.sh && \
    echo 'echo "Container started. PID is $$"' >> start.sh && \
    echo 'echo "Sleeping for 30 seconds..."' >> start.sh && \
    echo 'sleep 30' >> start.sh && \
    echo 'echo "Container exiting."' >> start.sh && \
    chmod +x start.sh

# Default command executed when the container starts
# Build with:
# docker build -t docker-run-basics .
CMD ["./start.sh"]
