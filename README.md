# Figma Make Prompt Generator

A script to generate filled prompts from a template by fetching API data.

## Installation

### Via Homebrew (recommended)

```bash
brew tap amir78729/figma-make-landing-prompt-generator
brew install landing-prompt-gen
```

## Usage

```bash
landing-prompt-gen --api=API_ENDPOINT --output=FILE [--lang=LANG] [--copy]
```

### Options

- `--api=API_ENDPOINT` - API endpoint to fetch data from (required)
- `--output=FILE` - Output file path (required)
- `--lang=LANG` - Set prompt language (en-US or fa-IR, defaults to en-US)
- `--copy` - Copy the generated file contents to clipboard
- `-h, --help` - Show help message

### Examples

Basic usage:
```bash
landing-prompt-gen --api=https://api.example.com/data --output=prompt.md
```

Generate and copy to clipboard:
```bash
landing-prompt-gen --api=https://api.example.com/data --output=prompt.md --copy
```

Generate Persian prompt:
```bash
landing-prompt-gen --api=https://api.example.com/data --output=prompt.md --lang=fa-IR
```

Custom output file:
```bash
landing-prompt-gen --api=https://api.example.com/data --output=my-custom-prompt.md
```

## Output

The script generates a filled prompt file with:
- API endpoint replaced in the template
- API response structure filled in the template
- Content in the specified language (English by default)

## Supported Languages

- `en-US` - English (default)
- `fa-IR` - Persian/Farsi

## Uninstall

```bash
brew uninstall landing-prompt-gen
```
