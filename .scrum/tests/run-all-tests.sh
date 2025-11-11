#!/bin/bash
# Scrum Agile System - Comprehensive Test Suite Runner
# Runs all tests and generates summary report

set -e

SCRUM_DIR=".scrum"
TEST_DIR="$SCRUM_DIR/tests"
RESULTS_DIR="$TEST_DIR/results"
SUMMARY_FILE="$RESULTS_DIR/test-summary.log"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Ensure results directory exists
mkdir -p "$RESULTS_DIR"

# Clear previous summary
> "$SUMMARY_FILE"

echo "==========================================" | tee "$SUMMARY_FILE"
echo "  Scrum Agile System - Test Suite" | tee -a "$SUMMARY_FILE"
echo "==========================================" | tee -a "$SUMMARY_FILE"
echo "Test Date: $(date)" | tee -a "$SUMMARY_FILE"
echo "" | tee -a "$SUMMARY_FILE"

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Function to run a test
run_test() {
    local test_script=$1
    local test_name=$2

    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    echo "-------------------------------------------" | tee -a "$SUMMARY_FILE"
    echo "Running: $test_name" | tee -a "$SUMMARY_FILE"
    echo "-------------------------------------------" | tee -a "$SUMMARY_FILE"

    if bash "$test_script" >> "$SUMMARY_FILE" 2>&1; then
        echo -e "${GREEN}✅ PASSED${NC}: $test_name" | tee -a "$SUMMARY_FILE"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        return 0
    else
        echo -e "${RED}❌ FAILED${NC}: $test_name" | tee -a "$SUMMARY_FILE"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        return 1
    fi
}

# Run all tests
echo "Starting test suite execution..." | tee -a "$SUMMARY_FILE"
echo "" | tee -a "$SUMMARY_FILE"

# Phase 1: Data Structure Tests
echo "=== Phase 1: Data Structure Tests ===" | tee -a "$SUMMARY_FILE"
run_test "$TEST_DIR/test-product-backlog.sh" "Product Backlog Validation"
run_test "$TEST_DIR/test-sprint-backlog.sh" "Sprint Backlog Validation"
run_test "$TEST_DIR/test-team-capacity.sh" "Team Capacity Validation"
run_test "$TEST_DIR/test-metrics-structure.sh" "Metrics Structure Validation"
echo "" | tee -a "$SUMMARY_FILE"

# Phase 2: Workflow Tests
echo "=== Phase 2: Workflow Tests ===" | tee -a "$SUMMARY_FILE"
run_test "$TEST_DIR/test-sprint-planning-workflow.sh" "Sprint Planning Workflow"
run_test "$TEST_DIR/test-daily-standup-workflow.sh" "Daily Standup Workflow"
run_test "$TEST_DIR/test-sprint-review-workflow.sh" "Sprint Review Workflow"
run_test "$TEST_DIR/test-sprint-retro-workflow.sh" "Sprint Retrospective Workflow"
run_test "$TEST_DIR/test-backlog-refinement-workflow.sh" "Backlog Refinement Workflow"
echo "" | tee -a "$SUMMARY_FILE"

# Phase 3: Agent Integration Tests
echo "=== Phase 3: Agent Integration Tests ===" | tee -a "$SUMMARY_FILE"
run_test "$TEST_DIR/test-agent-integration.sh" "Agent Integration"
run_test "$TEST_DIR/test-metrics-calculation.sh" "Metrics Calculation"
run_test "$TEST_DIR/test-dod-validation.sh" "Definition of Done Validation"
echo "" | tee -a "$SUMMARY_FILE"

# Generate summary
echo "==========================================" | tee -a "$SUMMARY_FILE"
echo "           TEST SUMMARY" | tee -a "$SUMMARY_FILE"
echo "==========================================" | tee -a "$SUMMARY_FILE"
echo "Total Tests:  $TOTAL_TESTS" | tee -a "$SUMMARY_FILE"
echo -e "${GREEN}Passed:       $PASSED_TESTS${NC}" | tee -a "$SUMMARY_FILE"
echo -e "${RED}Failed:       $FAILED_TESTS${NC}" | tee -a "$SUMMARY_FILE"

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "${GREEN}Status:       ALL TESTS PASSED ✅${NC}" | tee -a "$SUMMARY_FILE"
    echo "==========================================" | tee -a "$SUMMARY_FILE"
    exit 0
else
    echo -e "${RED}Status:       SOME TESTS FAILED ❌${NC}" | tee -a "$SUMMARY_FILE"
    echo "==========================================" | tee -a "$SUMMARY_FILE"
    echo "" | tee -a "$SUMMARY_FILE"
    echo "See individual test logs in $RESULTS_DIR/ for details" | tee -a "$SUMMARY_FILE"
    exit 1
fi
