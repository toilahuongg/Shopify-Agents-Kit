#!/bin/bash
# Sprint Backlog Validation Tests

set -e

# Detect if we're running from .scrum or project root
if [ -f "product-backlog.json" ]; then
    SCRUM_DIR="."
else
    SCRUM_DIR=".scrum"
fi

SPRINT_DIR="$SCRUM_DIR/sprints/sprint-001"
BACKLOG_FILE="$SPRINT_DIR/backlog.json"
TEST_RESULTS="$SCRUM_DIR/tests/results/sprint-backlog-test.log"

echo "=== Sprint Backlog Validation Tests ===" | tee "$TEST_RESULTS"
echo "Test Date: $(date)" | tee -a "$TEST_RESULTS"
echo "" | tee -a "$TEST_RESULTS"

# Test 1: Check if sprint directory exists
echo "Test 1: Sprint directory exists" | tee -a "$TEST_RESULTS"
if [ -d "$SPRINT_DIR" ]; then
    echo "✅ PASS: Sprint directory exists" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Sprint directory not found" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 2: Check if backlog file exists
echo "Test 2: Sprint backlog file exists" | tee -a "$TEST_RESULTS"
if [ -f "$BACKLOG_FILE" ]; then
    echo "✅ PASS: Sprint backlog file exists" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Sprint backlog file not found" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 3: Validate JSON structure
echo "Test 3: Validate JSON structure" | tee -a "$TEST_RESULTS"
if jq empty "$BACKLOG_FILE" 2>/dev/null; then
    echo "✅ PASS: Valid JSON format" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid JSON format" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 4: Validate required fields
echo "Test 4: Validate required fields" | tee -a "$TEST_RESULTS"
REQUIRED_FIELDS=("sprintNumber" "sprintGoal" "startDate" "endDate" "status" "backlogItems")

for field in "${REQUIRED_FIELDS[@]}"; do
    if jq -e ".$field" "$BACKLOG_FILE" > /dev/null 2>&1; then
        echo "  ✅ Field '$field' exists" | tee -a "$TEST_RESULTS"
    else
        echo "  ❌ Field '$field' missing" | tee -a "$TEST_RESULTS"
        exit 1
    fi
done
echo "✅ PASS: All required fields present" | tee -a "$TEST_RESULTS"
echo "" | tee -a "$TEST_RESULTS"

# Test 5: Validate sprint status
echo "Test 5: Validate sprint status" | tee -a "$TEST_RESULTS"
STATUS=$(jq -r '.status' "$BACKLOG_FILE")
if [[ "$STATUS" =~ ^(planning|planned|active|in-progress|completed)$ ]]; then
    echo "✅ PASS: Valid sprint status: $STATUS" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid sprint status: $STATUS" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 6: Validate date format
echo "Test 6: Validate date format" | tee -a "$TEST_RESULTS"
START_DATE=$(jq -r '.startDate' "$BACKLOG_FILE")
END_DATE=$(jq -r '.endDate' "$BACKLOG_FILE")

if date -d "$START_DATE" > /dev/null 2>&1 && date -d "$END_DATE" > /dev/null 2>&1; then
    echo "✅ PASS: Valid date formats" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid date format" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

echo "==================================" | tee -a "$TEST_RESULTS"
echo "Sprint Backlog Tests: COMPLETED" | tee -a "$TEST_RESULTS"
echo "All tests passed ✅" | tee -a "$TEST_RESULTS"
echo "==================================" | tee -a "$TEST_RESULTS"
