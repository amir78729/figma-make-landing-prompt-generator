#!/bin/bash

COPY_TO_CLIPBOARD=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c|--copy) COPY_TO_CLIPBOARD=true; shift ;;
        *) ENDPOINT="$1"; shift ;;
    esac
done

if [ -z "$ENDPOINT" ]; then
    echo "ℹ️ Usage: $0 [-c|--copy] <API_ENDPOINT>"
    exit 1
fi
TEMPLATE_FILE="figma-make-prompt.md"
OUTPUT_FILE="figma-make-prompt-filled.md"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "❌ Error: Template file '$TEMPLATE_FILE' not found"
    exit 1
fi

echo "⏳ Fetching API response from: $ENDPOINT"
API_RESPONSE=$(curl -s "$ENDPOINT")

if [ $? -ne 0 ]; then
    echo "Error: Failed to fetch API response"
    exit 1
fi

echo "✨ Generating filled prompt..."

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
