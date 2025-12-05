# Figma Make Prompt Generator

A script to generate filled prompts from a template by fetching API data.

## Usage

```bash
./generate-prompt.sh [OPTIONS] <API_ENDPOINT>
```

### Options

- `-c, --copy` - Copy the generated file contents to clipboard

### Examples

Basic usage:
```bash
./generate-prompt.sh https://api.example.com/data
```

Generate and copy to clipboard:
```bash
./generate-prompt.sh -c https://api.example.com/data
```

or

```bash
./generate-prompt.sh --copy https://api.example.com/data
```

## Output

The script generates `figma-make-prompt-filled.md` with:
- API endpoint replaced in the template
- API response structure filled in the template

## Requirements

- `curl` for API requests
- `pbcopy` for clipboard functionality (macOS)
