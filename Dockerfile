# Base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    build-essential \
    python3 \
    python3-pip \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

# Install the latest version of Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Add Ollama binary to PATH
ENV PATH="/usr/local/bin:$PATH"

# Create working directory
WORKDIR /app

# Download the LLaMA 3.2 model
RUN ollama pull llama3.2

# Expose the API port (default is 11434)
EXPOSE 11434

# Command to run LLaMA 3.2 via Ollama
CMD ["ollama", "run", "llama3.2"]
