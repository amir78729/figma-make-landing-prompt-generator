# Figma Make Prompt Generator

A script to generate filled prompts from a template by fetching API data.

## Usage

```bash
./generate-prompt.sh --api=API_ENDPOINT [--lang=LANG] [--copy]
```

### Options

- `--api=API_ENDPOINT` - API endpoint to fetch data from (required)
- `--lang=LANG` - Set prompt language (en-US or fa-IR, defaults to en-US)
- `--copy` - Copy the generated file contents to clipboard

### Examples

Basic usage:
```bash
./generate-prompt.sh --api=https://api.example.com/data
```

Generate and copy to clipboard:
```bash
./generate-prompt.sh --api=https://api.example.com/data --copy
```

Generate Persian prompt:
```bash
./generate-prompt.sh --api=https://api.example.com/data --lang=fa-IR
```

Generate Persian prompt and copy to clipboard:
```bash
./generate-prompt.sh --api=https://api.example.com/data --lang=fa-IR --copy
```

## Output

The script generates `figma-make-prompt-filled.md` with:
- API endpoint replaced in the template
- API response structure filled in the template
- Content in the specified language (English by default)

## Requirements

- `curl` for API requests
- `pbcopy` for clipboard functionality (macOS)

## Supported Languages

- `en-US` - English (default)
- `fa-IR` - Persian/Farsi
