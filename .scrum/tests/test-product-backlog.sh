#!/bin/bash
# Product Backlog Management Tests
# Tests creation, validation, and manipulation of Product Backlog items

set -e

SCRUM_DIR=".scrum"
BACKLOG_FILE="$SCRUM_DIR/product-backlog.json"
TEST_RESULTS="$SCRUM_DIR/tests/results/product-backlog-test.log"

echo "=== Product Backlog Management Tests ===" | tee "$TEST_RESULTS"
echo "Test Date: $(date)" | tee -a "$TEST_RESULTS"
echo "" | tee -a "$TEST_RESULTS"

# Test 1: Validate backlog file exists
echo "Test 1: Validate backlog file exists" | tee -a "$TEST_RESULTS"
if [ -f "$BACKLOG_FILE" ]; then
    echo "✅ PASS: Product backlog file exists" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Product backlog file not found" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 2: Validate JSON structure
echo "Test 2: Validate JSON structure" | tee -a "$TEST_RESULTS"
if jq empty "$BACKLOG_FILE" 2>/dev/null; then
    echo "✅ PASS: Valid JSON format" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid JSON format" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 3: Validate required fields
echo "Test 3: Validate required fields" | tee -a "$TEST_RESULTS"
REQUIRED_FIELDS=("backlog" "metadata" "schema")
ALL_VALID=true

for field in "${REQUIRED_FIELDS[@]}"; do
    if jq -e ".$field" "$BACKLOG_FILE" > /dev/null 2>&1; then
        echo "  ✅ Field '$field' exists" | tee -a "$TEST_RESULTS"
    else
        echo "  ❌ Field '$field' missing" | tee -a "$TEST_RESULTS"
        ALL_VALID=false
    fi
done

if [ "$ALL_VALID" = true ]; then
    echo "✅ PASS: All required fields present" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Missing required fields" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 4: Validate backlog items structure
echo "Test 4: Validate backlog items structure" | tee -a "$TEST_RESULTS"
ITEM_COUNT=$(jq '.backlog | length' "$BACKLOG_FILE")
echo "  Found $ITEM_COUNT backlog items" | tee -a "$TEST_RESULTS"

if [ "$ITEM_COUNT" -gt 0 ]; then
    # Check first item has required fields
    ITEM_FIELDS=("id" "type" "title" "priority" "status")
    ITEM_VALID=true

    for field in "${ITEM_FIELDS[@]}"; do
        if jq -e ".backlog[0].$field" "$BACKLOG_FILE" > /dev/null 2>&1; then
            echo "  ✅ Item field '$field' exists" | tee -a "$TEST_RESULTS"
        else
            echo "  ❌ Item field '$field' missing" | tee -a "$TEST_RESULTS"
            ITEM_VALID=false
        fi
    done

    if [ "$ITEM_VALID" = true ]; then
        echo "✅ PASS: Backlog items have valid structure" | tee -a "$TEST_RESULTS"
    else
        echo "❌ FAIL: Invalid item structure" | tee -a "$TEST_RESULTS"
        exit 1
    fi
else
    echo "⚠️  WARNING: No backlog items found" | tee -a "$TEST_RESULTS"
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 5: Validate item types
echo "Test 5: Validate item types" | tee -a "$TEST_RESULTS"
VALID_TYPES=("epic" "story" "bug" "spike" "task")
INVALID_TYPES=$(jq -r '.backlog[].type' "$BACKLOG_FILE" | grep -vE "^(epic|story|bug|spike|task)$" || true)

if [ -z "$INVALID_TYPES" ]; then
    echo "✅ PASS: All item types are valid" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid item types found: $INVALID_TYPES" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 6: Validate priorities (numeric 1-5)
echo "Test 6: Validate priorities" | tee -a "$TEST_RESULTS"
INVALID_PRIORITIES=$(jq -r '.backlog[].priority' "$BACKLOG_FILE" | grep -vE "^[1-5]$" || true)

if [ -z "$INVALID_PRIORITIES" ]; then
    echo "✅ PASS: All priorities are valid (1-5)" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid priorities found (must be 1-5): $INVALID_PRIORITIES" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 7: Validate status values
echo "Test 7: Validate status values" | tee -a "$TEST_RESULTS"
VALID_STATUSES=("backlog" "ready" "in-progress" "done" "cancelled")
INVALID_STATUSES=$(jq -r '.backlog[].status' "$BACKLOG_FILE" | grep -vE "^(backlog|ready|in-progress|done|cancelled)$" || true)

if [ -z "$INVALID_STATUSES" ]; then
    echo "✅ PASS: All statuses are valid" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid statuses found: $INVALID_STATUSES" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 8: Validate INVEST criteria for stories
echo "Test 8: Validate INVEST criteria for stories" | tee -a "$TEST_RESULTS"
STORIES_COUNT=$(jq '[.backlog[] | select(.type == "story")] | length' "$BACKLOG_FILE")
echo "  Found $STORIES_COUNT user stories" | tee -a "$TEST_RESULTS"

if [ "$STORIES_COUNT" -gt 0 ]; then
    STORIES_WITH_AC=$(jq '[.backlog[] | select(.type == "story" and .acceptanceCriteria)] | length' "$BACKLOG_FILE")
    echo "  Stories with acceptance criteria: $STORIES_WITH_AC/$STORIES_COUNT" | tee -a "$TEST_RESULTS"

    if [ "$STORIES_WITH_AC" -eq "$STORIES_COUNT" ]; then
        echo "✅ PASS: All stories have acceptance criteria" | tee -a "$TEST_RESULTS"
    else
        echo "⚠️  WARNING: Some stories missing acceptance criteria" | tee -a "$TEST_RESULTS"
    fi
else
    echo "⚠️  WARNING: No user stories found" | tee -a "$TEST_RESULTS"
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 9: Validate estimation (story points)
echo "Test 9: Validate estimation (story points)" | tee -a "$TEST_RESULTS"
ESTIMATED_ITEMS=$(jq '[.backlog[] | select(.storyPoints != null)] | length' "$BACKLOG_FILE")
TOTAL_ITEMS=$(jq '.backlog | length' "$BACKLOG_FILE")
echo "  Estimated items: $ESTIMATED_ITEMS/$TOTAL_ITEMS" | tee -a "$TEST_RESULTS"

# Validate Fibonacci sequence for story points
INVALID_ESTIMATES=$(jq -r '[.backlog[] | select(.storyPoints != null) | .storyPoints] | .[]' "$BACKLOG_FILE" | grep -vE "^(1|2|3|5|8|13|21|34|55|89)$" || true)

if [ -z "$INVALID_ESTIMATES" ]; then
    echo "✅ PASS: All estimates use valid Fibonacci values" | tee -a "$TEST_RESULTS"
else
    echo "⚠️  WARNING: Some estimates not using Fibonacci: $INVALID_ESTIMATES" | tee -a "$TEST_RESULTS"
fi
echo "" | tee -a "$TEST_RESULTS"

# Test 10: Validate metadata
echo "Test 10: Validate metadata" | tee -a "$TEST_RESULTS"
METADATA_FIELDS=("totalItems" "lastUpdated")
METADATA_VALID=true

for field in "${METADATA_FIELDS[@]}"; do
    if jq -e ".metadata.$field" "$BACKLOG_FILE" > /dev/null 2>&1; then
        VALUE=$(jq -r ".metadata.$field" "$BACKLOG_FILE")
        echo "  ✅ Metadata '$field': $VALUE" | tee -a "$TEST_RESULTS"
    else
        echo "  ❌ Metadata '$field' missing" | tee -a "$TEST_RESULTS"
        METADATA_VALID=false
    fi
done

if [ "$METADATA_VALID" = true ]; then
    echo "✅ PASS: Metadata is valid" | tee -a "$TEST_RESULTS"
else
    echo "❌ FAIL: Invalid metadata" | tee -a "$TEST_RESULTS"
    exit 1
fi
echo "" | tee -a "$TEST_RESULTS"

# Summary
echo "==================================" | tee -a "$TEST_RESULTS"
echo "Product Backlog Tests: COMPLETED" | tee -a "$TEST_RESULTS"
echo "All critical tests passed ✅" | tee -a "$TEST_RESULTS"
echo "==================================" | tee -a "$TEST_RESULTS"
