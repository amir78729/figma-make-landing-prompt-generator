#!/bin/bash

COPY_TO_CLIPBOARD=false
LANGUAGE="en-US"
ENDPOINT=""
OUTPUT=""

show_help() {
    echo "Figma Make Prompt Generator"
    echo ""
    echo "Usage: $0 --api=API_ENDPOINT [--lang=LANG] [--output=FILE] [--copy]"
    echo ""
    echo "Options:"
    echo "  --api=API_ENDPOINT    API endpoint to fetch data from (required)"
    echo "  --lang=LANG          Set prompt language (en-US or fa-IR, defaults to en-US)"
    echo "  --output=FILE        Output file path (defaults to figma-make-prompt-filled.md)"
    echo "  --copy               Copy the generated file contents to clipboard"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --api=https://api.example.com/data"
    echo "  $0 --api=https://api.example.com/data --copy"
    echo "  $0 --api=https://api.example.com/data --lang=fa-IR"
    echo "  $0 --api=https://api.example.com/data --lang=fa-IR --copy"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --api=*) ENDPOINT="${1#*=}"; shift ;;
        --lang=*) LANGUAGE="${1#*=}"; shift ;;
        --output=*) OUTPUT="${1#*=}"; shift ;;
        --copy) COPY_TO_CLIPBOARD=true; shift ;;
        -h|--help) show_help; exit 0 ;;
        *) echo "❌ Error: Invalid argument '$1'"; echo "Use -h or --help for usage information"; exit 1 ;;
    esac
done

if [ -z "$ENDPOINT" ]; then
    echo "❌ Error: --api parameter is required"
    echo ""
    show_help
    exit 1
fi

# Validate language
if [[ "$LANGUAGE" != "en-US" && "$LANGUAGE" != "fa-IR" ]]; then
    echo "❌ Error: Invalid language '$LANGUAGE'. Valid languages are: en-US, fa-IR"
    exit 1
fi

# Set template file based on language
# Check if running from Homebrew installation
if [[ -d "$(dirname "$0")/../share/figma-make/templates" ]]; then
    TEMPLATE_FILE="$(dirname "$0")/../share/figma-make/templates/$LANGUAGE.md"
else
    TEMPLATE_FILE="templates/$LANGUAGE.md"
fi

OUTPUT_FILE="${OUTPUT:-figma-make-prompt-filled.md}"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "❌ Error: Template file '$TEMPLATE_FILE' not found"
    exit 1
fi

echo "⏳ Fetching API response from: $ENDPOINT"
API_RESPONSE=$(curl -s "$ENDPOINT")

if [ $? -ne 0 ]; then
    echo "❌ Error: Failed to fetch API response"
    exit 1
fi

echo "✨ Generating filled prompt (Language: $LANGUAGE)..."

# Create temp file with API response
TEMP_RESPONSE=$(mktemp)
echo "$API_RESPONSE" > "$TEMP_RESPONSE"

# Replace endpoint placeholder first
sed "s|\[ENDPOINT_PLACEHOLDER\]|$ENDPOINT|g" "$TEMPLATE_FILE" > "$OUTPUT_FILE.tmp"

# Replace API response placeholder with file content
awk -v response="$TEMP_RESPONSE" '
/\[API_RESPONSE_PLACEHOLDER\]/ {
    while ((getline line < response) > 0) {
        print line
    }
    close(response)
    next
}
{ print }
' "$OUTPUT_FILE.tmp" > "$OUTPUT_FILE"

# Cleanup
rm "$TEMP_RESPONSE" "$OUTPUT_FILE.tmp"

echo "✅ Generated: $OUTPUT_FILE"

if [ "$COPY_TO_CLIPBOARD" = true ]; then
    cat "$OUTPUT_FILE" | pbcopy
    echo "📋 Copied to clipboard"
fi
