#!/bin/sh

# Ensure 'data' folder exists (fixes cookie-secret.txt crash)
mkdir -p data

if [ ! -e "config/config.yaml" ]; then
    echo "Resource not found, copying from defaults: config.yaml"
    cp -r "default/config.yaml" "config/config.yaml"
fi

# Execute postinstall to auto-populate config.yaml with missing values
npm run postinstall

# Start the server
exec node server.js --listen "$@"
