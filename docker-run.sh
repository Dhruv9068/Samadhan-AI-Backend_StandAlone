#!/bin/bash

# Samadhan AI Backend - Docker Run Script

echo "🚀 Starting Samadhan AI Backend with Docker..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️ .env file not found!"
    echo "Please create .env file with your API keys."
    echo "Use .env.example as template."
    exit 1
fi

# Load environment variables
export $(cat .env | grep -v '^#' | xargs)

# Start with docker-compose
docker-compose up -d

if [ $? -eq 0 ]; then
    echo "✅ Samadhan AI Backend started successfully!"
    echo ""
    echo "🌐 Backend URL: http://localhost:5000"
    echo "🏥 Health Check: http://localhost:5000/health"
    echo ""
    echo "📋 Useful commands:"
    echo "  docker-compose logs -f samadhan-ai-backend  # View logs"
    echo "  docker-compose restart samadhan-ai-backend  # Restart"
    echo "  docker-compose down                         # Stop"
    echo ""
    
    # Wait a moment and test health
    echo "🔍 Testing health endpoint..."
    sleep 5
    curl -s http://localhost:5000/health | python -m json.tool
else
    echo "❌ Failed to start containers!"
    exit 1
fi