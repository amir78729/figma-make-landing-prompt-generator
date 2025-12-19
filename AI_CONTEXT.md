# AI Context File - Figma Make Prompt Generator

**⚠️ CRITICAL: This file must be updated with every project change**

## Project Overview
A bash script tool that generates filled prompts from templates by fetching API data. Specifically designed for creating React landing page generation prompts with RTL Persian language support.

## Core Files Structure
```
figma-make/
├── templates/
│   ├── en-US.md            # English template for landing page generation prompts
│   └── fa-IR.md            # Persian template for landing page generation prompts
├── generate-prompt.sh      # Main script that processes templates
├── README.md              # User documentation with installation and usage
└── AI_CONTEXT.md         # This context file
```

## Key Components

### 1. Template System (`templates/en-US.md` & `templates/fa-IR.md`)
- **Purpose**: Templates for generating React landing pages with RTL Persian support
- **Languages**: English (en-US) and Persian (fa-IR) versions with identical content
- **Translation Rule**: Technical terms (React, API, CSS, SSG, CTA, URL, HTML tags) remain English
- **Placeholders**: 
  - `[ENDPOINT_PLACEHOLDER]` → API endpoint URL
  - `[API_RESPONSE_PLACEHOLDER]` → JSON API response structure
- **Tech Stack**: React + TypeScript + CSS Modules + DOMPurify
- **Units**: All styles must use `rem` instead of `px`
- **Assets**: Human-readable names instead of systematic hashes
- **CMS Images**: Don't store API-provided images locally, use URLs from response
- **Design System**: Tapsi design tokens (comprehensive CSS variables)
- **Language**: RTL Persian (`fa-IR`) with accessibility requirements

### 2. Generator Script (`generate-prompt.sh`)
- **Function**: Fetches API data and fills template placeholders
- **Usage**: `./generate-prompt.sh --api=API_ENDPOINT [--lang=LANG] [--output=FILE] [--copy]`
- **Parameters**: 
  - `--api=API_ENDPOINT` (required)
  - `--lang=LANG` (optional, en-US default)
  - `--output=FILE` (optional, defaults to figma-make-prompt-filled.md)
  - `--copy` (optional flag)
  - `-h, --help` (show help message)
- **Validation**: Invalid arguments throw errors, only en-US and fa-IR languages accepted
- **Output**: `figma-make-prompt-filled.md`
- **Installation Support**: Detects Homebrew installation and uses appropriate template paths

### 3. Homebrew Installation
- **Formula**: `landing-prompt-gen.rb` - Located in separate tap repository
- **Tap Repository**: https://github.com/amir78729/homebrew-figma-make-landing-prompt-generator
- **Main Repository**: https://github.com/amir78729/figma-make-landing-prompt-generator
- **Version**: 0.0.1
- **SHA256**: c98b6903961dd858495f50a41120d2e14bc7e1e93b2df37bd653ed5b7043c743
- **Installation**: `brew tap amir78729/figma-make-landing-prompt-generator && brew install landing-prompt-gen`
- **Command**: Installs as `landing-prompt-gen` system command
- **Templates**: Installed to Homebrew's pkgshare directory
- **Documentation**: Installation and usage instructions in README.md

### 4. Key Requirements from Template
- **RTL Layout**: Right-to-left direction, don't mirror icons
- **Accessibility**: Persian ARIA labels, semantic HTML, WCAG compliance  
- **Responsive**: Mobile/tablet/desktop breakpoints
- **Security**: DOMPurify for HTML sanitization
- **Marketing**: UTM parameter preservation in CTAs
- **Architecture**: Component-based with TypeScript types from API

## Script Workflow
1. Parse command line arguments (--api, --lang, --copy)
2. Validate all arguments (reject invalid parameters)
3. Validate required --api parameter exists
4. Validate language parameter (en-US or fa-IR only)
5. Select appropriate template file based on language
6. Validate template file exists
7. Fetch API response via curl
8. Replace `[ENDPOINT_PLACEHOLDER]` with actual endpoint
9. Replace `[API_RESPONSE_PLACEHOLDER]` with API JSON response
10. Generate `figma-make-prompt-filled.md`
11. Optionally copy to clipboard (macOS pbcopy)

## Dependencies
- `curl` - API requests
- `pbcopy` - Clipboard functionality (macOS only)

## Generated Output Structure
The filled prompt creates a comprehensive guide for building:
- Main landing component (`XLanding.tsx`)
- Section components (Hero, Services, FAQ, etc.)
- TypeScript types matching API structure
- CSS modules with Tapsi design tokens
- Utility functions (sanitization, UTM handling)

## Update Protocol
When modifying any project file:
1. Update the relevant file
2. **IMMEDIATELY** update this AI_CONTEXT.md file
3. Document changes in the appropriate section
4. Maintain accuracy of file structure and workflow descriptions

## Last Updated
2025-12-19T18:02:13.653+03:30 - Removed figma-make.rb from main repo, moved to separate tap repository as landing-prompt-gen.rb
