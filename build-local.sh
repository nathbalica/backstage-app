#!/bin/bash

set -e  # para o script se qualquer comando falhar

echo "📦 Instalando dependências com yarn..."
yarn install --immutable

echo "📐 Compilando TypeScript..."
yarn tsc

echo "🛠️  Construindo backend..."
yarn build:backend

echo "🐳 Construindo containers com Docker Compose..."
docker compose -f docker-compose.local.yaml build

echo "🚀 Subindo aplicação local com Docker Compose..."
docker compose -f docker-compose.local.yaml up