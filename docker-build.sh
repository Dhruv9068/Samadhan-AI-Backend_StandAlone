#!/bin/bash

# Samadhan AI Backend - Docker Build Script

echo "🚀 Building Samadhan AI Backend Docker Image..."

# Build the Docker image
docker build -t samadhan-ai-backend:latest .

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully!"
    echo ""
    echo "📋 Next steps:"
    echo "1. Create .env file with your API keys"
    echo "2. Run: docker-compose up -d"
    echo "3. Test: curl http://localhost:5000/health"
    echo ""
    echo "🔧 Available commands:"
    echo "  docker-compose up -d     # Start in background"
    echo "  docker-compose logs -f   # View logs"
    echo "  docker-compose down      # Stop containers"
    echo ""
else
    echo "❌ Docker build failed!"
    exit 1
fi