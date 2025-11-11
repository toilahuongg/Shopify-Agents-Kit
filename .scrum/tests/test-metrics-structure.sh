#!/bin/bash
# Metrics Structure Validation Tests
set -e
METRICS_DIR=".scrum/metrics"
TEST_RESULTS=".scrum/tests/results/metrics-structure-test.log"

echo "=== Metrics Structure Validation ===" | tee "$TEST_RESULTS"
for file in velocity.json sprint-health.json burndown-charts.json team-performance.json predictive-analytics.json quality-metrics.json; do
    [ -f "$METRICS_DIR/$file" ] && echo "✅ $file exists" | tee -a "$TEST_RESULTS" || (echo "❌ $file missing" && exit 1)
    jq empty "$METRICS_DIR/$file" 2>/dev/null && echo "✅ $file valid JSON" | tee -a "$TEST_RESULTS" || exit 1
done
echo "All metrics files valid ✅" | tee -a "$TEST_RESULTS"
