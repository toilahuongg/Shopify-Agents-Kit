#!/bin/bash
# Shopify App Listing Character Counter
# Usage: ./count-characters.sh [section] "your text here"
# Or pipe text: echo "text" | ./count-characters.sh [section]

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Character limits for different sections
LIMITS_intro=100
LIMITS_details=500
LIMITS_feature=80
LIMITS_subtitle=80
LIMITS_seo_title=60
LIMITS_seo_meta=155

get_limit() {
    local section="$1"
    case "$section" in
        introduction) echo "$LIMITS_intro" ;;
        details) echo "$LIMITS_details" ;;
        feature) echo "$LIMITS_feature" ;;
        subtitle) echo "$LIMITS_subtitle" ;;
        seo_title) echo "$LIMITS_seo_title" ;;
        seo_meta) echo "$LIMITS_seo_meta" ;;
        *) echo "" ;;
    esac
}

count_chars() {
    local text="$1"
    local limit="$2"

    # Remove leading/trailing whitespace for counting
    local trimmed=$(echo "$text" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    # Count characters (not bytes)
    local count=${#trimmed}
    local remaining=$((limit - count))
    local percentage=$(( (count * 100) / limit ))

    # Output formatting
    if [ $count -le $limit ]; then
        if [ $percentage -lt 90 ]; then
            status="${GREEN}✓ OK${NC}"
        else
            status="${YELLOW}⚠ NEAR LIMIT${NC}"
        fi
    else
        local over=$((count - limit))
        status="${RED}✗ OVER by $over chars${NC}"
    fi

    echo -e "${BLUE}Characters:${NC} $count / $limit ($remaining remaining)"
    echo -e "${BLUE}Status:${NC} $status"
    echo ""
}

show_help() {
    echo "Shopify App Listing Character Counter"
    echo ""
    echo "Usage:"
    echo "  $0 [section] \"your text\""
    echo "  echo \"your text\" | $0 [section]"
    echo ""
    echo "Sections and limits:"
    echo "  introduction     100 characters"
    echo "  details          500 characters"
    echo "  feature           80 characters"
    echo "  subtitle          80 characters"
    echo "  seo_title         60 characters"
    echo "  seo_meta         155 characters"
    echo ""
    echo "Examples:"
    echo "  $0 introduction \"We help you manage orders.\""
    echo "  $0 details \"Full description here...\""
    echo "  $0 feature \"Real-time sales tracking\""
    echo "  $0 subtitle \"Better order management\""
    echo "  $0 seo_title \"My App - Order Tools\""
    echo "  $0 seo_meta \"Description for search results\""
}

# Main logic
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    show_help
    exit 0
fi

# Get text from argument or stdin
if [ -p /dev/stdin ]; then
    text=$(cat)
    section="$1"
else
    if [ $# -lt 2 ]; then
        show_help
        exit 1
    fi
    section="$1"
    shift
    text="$*"
fi

# Default section if not specified
if [ -z "$section" ]; then
    section="details"
fi

# Get limit for section
limit=$(get_limit "$section")

# Check if section is valid
if [ -z "$limit" ]; then
    echo -e "${RED}Error: Unknown section '$section'${NC}"
    echo ""
    show_help
    exit 1
fi

count_chars "$text" "$limit"
