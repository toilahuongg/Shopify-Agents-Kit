#!/bin/bash
# Team Capacity Validation Tests
set -e
SCRUM_DIR=".scrum"
CAPACITY_FILE="$SCRUM_DIR/team-capacity.json"
TEST_RESULTS="$SCRUM_DIR/tests/results/team-capacity-test.log"

echo "=== Team Capacity Validation Tests ===" | tee "$TEST_RESULTS"
jq empty "$CAPACITY_FILE" 2>/dev/null && echo "✅ PASS: Valid JSON" | tee -a "$TEST_RESULTS" || (echo "❌ FAIL" | tee -a "$TEST_RESULTS" && exit 1)
[ $(jq '.teamMembers | length' "$CAPACITY_FILE") -gt 0 ] && echo "✅ PASS: Team members exist" | tee -a "$TEST_RESULTS" || exit 1
jq -e '.teamMembers[0].name' "$CAPACITY_FILE" > /dev/null && echo "✅ PASS: Valid structure" | tee -a "$TEST_RESULTS"
echo "All tests passed ✅" | tee -a "$TEST_RESULTS"
