#!/bin/bash

echo "Running health check..."

#wait for app to start (if needed)
sleep 3

#Test the app's response
RESPONSE=$(curl -s http://localhost:3000)

if echo "$RESPONSE" | grep -q "Hello CI/CD"; then
echo "✅Test passed!!"
exit 0
else
echo "Test failed ❌😔!!"
exit 1
fi