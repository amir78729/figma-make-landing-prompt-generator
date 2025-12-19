# AI Context File - Figma Make Prompt Generator

**⚠️ CRITICAL: This file must be updated with every project change**

## Project Overview
A bash script tool that generates filled prompts from templates by fetching API data. Specifically designed for creating React landing page generation prompts with RTL Persian language support.

## Core Files Structure
```
figma-make/
├── figma-make-prompt.md     # Template for landing page generation prompts
├── generate-prompt.sh       # Main script that processes templates
├── README.md               # User documentation
└── AI_CONTEXT.md          # This context file
```

## Key Components

### 1. Template System (`figma-make-prompt.md`)
- **Purpose**: Template for generating React landing pages with RTL Persian support
- **Placeholders**: 
  - `[ENDPOINT_PLACEHOLDER]` → API endpoint URL
  - `[API_RESPONSE_PLACEHOLDER]` → JSON API response structure
- **Tech Stack**: React + TypeScript + CSS Modules + DOMPurify
- **Units**: All styles must use `rem` instead of `px`
- **Design System**: Tapsi design tokens (comprehensive CSS variables)
- **Language**: RTL Persian (`fa-IR`) with accessibility requirements

### 2. Generator Script (`generate-prompt.sh`)
- **Function**: Fetches API data and fills template placeholders
- **Usage**: `./generate-prompt.sh [-c|--copy] <API_ENDPOINT>`
- **Output**: `figma-make-prompt-filled.md`
- **Features**: Optional clipboard copy with `-c/--copy` flag

### 3. Key Requirements from Template
- **RTL Layout**: Right-to-left direction, don't mirror icons
- **Accessibility**: Persian ARIA labels, semantic HTML, WCAG compliance  
- **Responsive**: Mobile/tablet/desktop breakpoints
- **Security**: DOMPurify for HTML sanitization
- **Marketing**: UTM parameter preservation in CTAs
- **Architecture**: Component-based with TypeScript types from API

## Script Workflow
1. Parse command line arguments (endpoint + optional copy flag)
2. Validate template file exists
3. Fetch API response via curl
4. Replace `[ENDPOINT_PLACEHOLDER]` with actual endpoint
5. Replace `[API_RESPONSE_PLACEHOLDER]` with API JSON response
6. Generate `figma-make-prompt-filled.md`
7. Optionally copy to clipboard (macOS pbcopy)

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
2025-12-19T13:56:36.316+03:30 - Added rem unit requirement for all CSS length measurements
