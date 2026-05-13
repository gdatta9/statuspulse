#!/bin/bash

set -e

BASE_URL="http://localhost:8000"

echo "Testing /health endpoint..."

HEALTH_RESPONSE=$(curl -s $BASE_URL/health)

echo "$HEALTH_RESPONSE" | grep healthy

echo "PASS: /health"

echo "Testing POST /services..."

SERVICE_RESPONSE=$(curl -s -X POST "$BASE_URL/services" \
-H "Content-Type: application/json" \
-d '{
"name":"google",
"url":"https://google.com"
}')

echo "$SERVICE_RESPONSE" | grep google

echo "PASS: POST /services"

echo "Testing duplicate service..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
-X POST "$BASE_URL/services" \
-H "Content-Type: application/json" \
-d '{
"name":"google",
"url":"https://google.com"
}')

if [ "$STATUS" = "409" ]; then
  echo "PASS: duplicate protection"
else
  echo "FAIL: duplicate protection"
  exit 1
fi

echo "Testing GET /services..."

curl -s $BASE_URL/services | grep google

echo "PASS: GET /services"

echo "Testing POST /incidents..."

INCIDENT_RESPONSE=$(curl -s -X POST "$BASE_URL/incidents" \
-H "Content-Type: application/json" \
-d '{
"service_name":"google",
"title":"Test Incident",
"description":"Testing",
"severity":"minor"
}')

echo "$INCIDENT_RESPONSE" | grep investigating

echo "PASS: POST /incidents"

echo "Testing GET /incidents..."

curl -s $BASE_URL/incidents | grep "Test Incident"

echo "PASS: GET /incidents"

echo "ALL TESTS PASSED"