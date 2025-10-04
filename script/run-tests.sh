#!/bin/bash


docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

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
