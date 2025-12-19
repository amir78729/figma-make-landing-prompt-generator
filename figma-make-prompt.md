# Figma Make Prompt for Landing Page Generation

You should generate a fully responsive React landing page based on the designs I provide. I will send you designs section by section, and you should incrementally update the generated code.

## API Information

**API Endpoint**: `[ENDPOINT_PLACEHOLDER]`

**API Response Structure**:

```json
[API_RESPONSE_PLACEHOLDER]
```

**Important**: This API response is provided ONLY for you to understand the data structure and generate TypeScript types. Do NOT use it as mock data in the code. The actual data will be passed as props to the landing component at runtime.

## Core Requirements

### Language & Direction

- Implement all pages in RTL (right-to-left) direction
- Set document language to `fa-IR`
- All accessibility labels must be in Persian
- **Important**: Do NOT mirror icons or assets - keep them unchanged despite RTL direction

### Technology Stack

- Use React with TypeScript
- Use CSS Modules for styling
- Use DOMPurify for HTML sanitization
- Implement fully responsive design for mobile, tablet, and desktop
- **Use `rem` units for all length measurements** (never use `px`)

### Design Tokens

Use the following design tokens system available at: <https://tap30.github.io/web-components/theme>

```css
:root {
  --tapsi-palette-black: #000000;
  --tapsi-palette-white: #ffffff;
  --tapsi-palette-gray-50: #f5f7f7;
  --tapsi-palette-gray-100: #eaeded;
  --tapsi-palette-gray-200: #e1e3e3;
  --tapsi-palette-gray-300: #cacccc;
  --tapsi-palette-gray-400: #b1b2b2;
  --tapsi-palette-gray-500: #747575;
  --tapsi-palette-gray-600: #535454;
  --tapsi-palette-gray-700: #323333;
  --tapsi-palette-gray-800: #323333;
  --tapsi-palette-gray-900: #141414;
  --tapsi-palette-orange-50: #fff0e9;
  --tapsi-palette-orange-100: #ffd5c2;
  --tapsi-palette-orange-200: #ffac8a;
  --tapsi-palette-orange-300: #ff8c61;
  --tapsi-palette-orange-400: #ff7140;
  --tapsi-palette-orange-500: #e55c2e;
  --tapsi-palette-orange-600: #a64221;
  --tapsi-palette-orange-700: #662a14;
  --tapsi-palette-orange-800: #662a14;
  --tapsi-palette-orange-900: #422e28;
  --tapsi-palette-blue-50: #eff3fe;
  --tapsi-palette-blue-100: #d4e2fc;
  --tapsi-palette-blue-200: #a0bff8;
  --tapsi-palette-blue-300: #5b91f5;
  --tapsi-palette-blue-400: #276ef1;
  --tapsi-palette-blue-500: #1e54b7;
  --tapsi-palette-blue-600: #174291;
  --tapsi-palette-blue-700: #143166;
  --tapsi-palette-blue-800: #143166;
  --tapsi-palette-blue-900: #262f40;
  --tapsi-palette-green-50: #e6f2ed;
  --tapsi-palette-green-100: #addec9;
  --tapsi-palette-green-200: #66d19e;
  --tapsi-palette-green-300: #06c167;
  --tapsi-palette-green-400: #048848;
  --tapsi-palette-green-500: #03703c;
  --tapsi-palette-green-600: #03582f;
  --tapsi-palette-green-700: #10462d;
  --tapsi-palette-green-800: #10462d;
  --tapsi-palette-green-900: #24332c;
  --tapsi-palette-yellow-50: #fffaf0;
  --tapsi-palette-yellow-100: #fff2d9;
  --tapsi-palette-yellow-200: #ffe3ac;
  --tapsi-palette-yellow-300: #ffcf70;
  --tapsi-palette-yellow-400: #ffc043;
  --tapsi-palette-yellow-500: #e49e15;
  --tapsi-palette-yellow-600: #996f00;
  --tapsi-palette-yellow-700: #674d1b;
  --tapsi-palette-yellow-800: #674d1b;
  --tapsi-palette-yellow-900: #332e24;
  --tapsi-palette-red-50: #ffefed;
  --tapsi-palette-red-100: #fed7d2;
  --tapsi-palette-red-200: #f1998e;
  --tapsi-palette-red-300: #e85c4a;
  --tapsi-palette-red-400: #e11900;
  --tapsi-palette-red-500: #ab1300;
  --tapsi-palette-red-600: #870f00;
  --tapsi-palette-red-700: #5a0a00;
  --tapsi-palette-red-800: #5a0a00;
  --tapsi-palette-red-900: #402926;
  --tapsi-palette-indigo-50: #f3f2fe;
  --tapsi-palette-indigo-100: #c6c0f9;
  --tapsi-palette-indigo-200: #9b90f2;
  --tapsi-palette-indigo-300: #7163e8;
  --tapsi-palette-indigo-400: #4a38db;
  --tapsi-palette-indigo-500: #483ab8;
  --tapsi-palette-indigo-600: #443997;
  --tapsi-palette-indigo-700: #3d3678;
  --tapsi-palette-indigo-800: #3d3678;
  --tapsi-palette-indigo-900: #2c2942;
  --tapsi-color-brand: var(--tapsi-palette-orange-400);
  --tapsi-color-surface-black: var(--tapsi-palette-black);
  --tapsi-color-surface-white: var(--tapsi-palette-white);
  --tapsi-color-surface-primary: var(--tapsi-palette-white);
  --tapsi-color-surface-secondary: var(--tapsi-palette-gray-50);
  --tapsi-color-surface-tertiary: var(--tapsi-palette-gray-100);
  --tapsi-color-surface-disabled: var(--tapsi-palette-gray-50);
  --tapsi-color-surface-accent: var(--tapsi-palette-blue-400);
  --tapsi-color-surface-accent-light: var(--tapsi-palette-blue-50);
  --tapsi-color-surface-negative: var(--tapsi-palette-red-400);
  --tapsi-color-surface-negative-light: var(--tapsi-palette-red-50);
  --tapsi-color-surface-warning: var(--tapsi-palette-yellow-400);
  --tapsi-color-surface-warning-light: var(--tapsi-palette-yellow-50);
  --tapsi-color-surface-positive: var(--tapsi-palette-green-400);
  --tapsi-color-surface-positive-light: var(--tapsi-palette-green-50);
  --tapsi-color-surface-background-primary: var(--tapsi-palette-gray-50);
  --tapsi-color-surface-background-secondary: var(--tapsi-palette-gray-100);
  --tapsi-color-surface-inverse-primary: var(--tapsi-palette-black);
  --tapsi-color-surface-inverse-secondary: var(--tapsi-palette-gray-700);
  --tapsi-color-surface-overlay-dark: #0000004d;
  --tapsi-color-surface-overlay-light: #0000001f;
  --tapsi-color-content-primary: var(--tapsi-palette-black);
  --tapsi-color-content-secondary: var(--tapsi-palette-gray-600);
  --tapsi-color-content-tertiary: var(--tapsi-palette-gray-500);
  --tapsi-color-content-disabled: var(--tapsi-palette-gray-400);
  --tapsi-color-content-accent: var(--tapsi-palette-blue-400);
  --tapsi-color-content-negative: var(--tapsi-palette-red-400);
  --tapsi-color-content-warning: var(--tapsi-palette-yellow-500);
  --tapsi-color-content-positive: var(--tapsi-palette-green-400);
  --tapsi-color-content-on-inverse: var(--tapsi-palette-white);
  --tapsi-color-content-on-brand: var(--tapsi-palette-white);
  --tapsi-color-content-on-accent: var(--tapsi-palette-white);
  --tapsi-color-content-on-negative: var(--tapsi-palette-white);
  --tapsi-color-content-on-warning: var(--tapsi-palette-black);
  --tapsi-color-content-on-positive: var(--tapsi-palette-white);
  --tapsi-color-border-primary: var(--tapsi-palette-gray-200);
  --tapsi-color-border-selected: var(--tapsi-palette-gray-700);
  --tapsi-color-border-focus: var(--tapsi-palette-gray-700);
  --tapsi-color-border-accent: var(--tapsi-palette-blue-200);
  --tapsi-color-border-negative: var(--tapsi-palette-red-200);
  --tapsi-color-border-positive: var(--tapsi-palette-green-200);
  --tapsi-color-border-warning: var(--tapsi-palette-yellow-200);
  --tapsi-color-border-inverse-primary: var(--tapsi-palette-gray-700);
  --tapsi-color-gradient-surface-brand: linear-gradient(
    91.39deg,
    #ff7733 0%,
    #ff5722 50.15%,
    #e64917 100%
  );
  --tapsi-color-gradient-surface-brand-light: linear-gradient(
    90deg,
    #fff0e9 0%,
    #f4f1f0 100%
  );
  --tapsi-radius-0: 0;
  --tapsi-radius-1: 0.125rem;
  --tapsi-radius-2: 0.25rem;
  --tapsi-radius-3: 0.5rem;
  --tapsi-radius-4: 0.75rem;
  --tapsi-radius-5: 1rem;
  --tapsi-radius-6: 1.25rem;
  --tapsi-radius-7: 1.5rem;
  --tapsi-radius-full: 999px;
  --tapsi-spacing-0: 0;
  --tapsi-spacing-1: 0.0625rem;
  --tapsi-spacing-2: 0.125rem;
  --tapsi-spacing-3: 0.25rem;
  --tapsi-spacing-4: 0.5rem;
  --tapsi-spacing-5: 0.75rem;
  --tapsi-spacing-6: 1rem;
  --tapsi-spacing-7: 1.25rem;
  --tapsi-spacing-8: 1.5rem;
  --tapsi-spacing-9: 2rem;
  --tapsi-spacing-10: 2.5rem;
  --tapsi-spacing-11: 3rem;
  --tapsi-spacing-12: 4rem;
  --tapsi-spacing-13: 5rem;
  --tapsi-spacing-14: 6rem;
  --tapsi-spacing-3-1: 0.375rem;
  --tapsi-stroke-0: 0px;
  --tapsi-stroke-1: 1px;
  --tapsi-stroke-2: 2px;
  --tapsi-typography-font-family: "Vazirmatn", sans-serif;
  --tapsi-typography-body-xs-font: var(--tapsi-typography-font-family);
  --tapsi-typography-body-xs-size: 0.75rem;
  --tapsi-typography-body-xs-height: 1.6666666667;
  --tapsi-typography-body-xs-weight: 400;
  --tapsi-typography-body-sm-font: var(--tapsi-typography-font-family);
  --tapsi-typography-body-sm-size: 0.875rem;
  --tapsi-typography-body-sm-height: 1.7142857143;
  --tapsi-typography-body-sm-weight: 400;
  --tapsi-typography-body-md-font: var(--tapsi-typography-font-family);
  --tapsi-typography-body-md-size: 1rem;
  --tapsi-typography-body-md-height: 1.75;
  --tapsi-typography-body-md-weight: 400;
  --tapsi-typography-body-lg-font: var(--tapsi-typography-font-family);
  --tapsi-typography-body-lg-size: 1.125rem;
  --tapsi-typography-body-lg-height: 1.7777777778;
  --tapsi-typography-body-lg-weight: 400;
  --tapsi-typography-label-xxs-font: var(--tapsi-typography-font-family);
  --tapsi-typography-label-xxs-size: 0.625rem;
  --tapsi-typography-label-xxs-height: 1.6;
  --tapsi-typography-label-xxs-weight: 500;
  --tapsi-typography-label-xs-font: var(--tapsi-typography-font-family);
  --tapsi-typography-label-xs-size: 0.75rem;
  --tapsi-typography-label-xs-height: 2;
  --tapsi-typography-label-xs-weight: 500;
  --tapsi-typography-label-sm-font: var(--tapsi-typography-font-family);
  --tapsi-typography-label-sm-size: 0.875rem;
  --tapsi-typography-label-sm-height: 1.7142857143;
  --tapsi-typography-label-sm-weight: 500;
  --tapsi-typography-label-md-font: var(--tapsi-typography-font-family);
  --tapsi-typography-label-md-size: 1rem;
  --tapsi-typography-label-md-height: 1.75;
  --tapsi-typography-label-md-weight: 500;
  --tapsi-typography-label-lg-font: var(--tapsi-typography-font-family);
  --tapsi-typography-label-lg-size: 1.125rem;
  --tapsi-typography-label-lg-height: 1.7777777778;
  --tapsi-typography-label-lg-weight: 500;
  --tapsi-typography-headline-xs-font: var(--tapsi-typography-font-family);
  --tapsi-typography-headline-xs-size: 1rem;
  --tapsi-typography-headline-xs-height: 1.5;
  --tapsi-typography-headline-xs-weight: 600;
  --tapsi-typography-headline-sm-font: var(--tapsi-typography-font-family);
  --tapsi-typography-headline-sm-size: 1.25rem;
  --tapsi-typography-headline-sm-height: 1.5;
  --tapsi-typography-headline-sm-weight: 600;
  --tapsi-typography-headline-md-font: var(--tapsi-typography-font-family);
  --tapsi-typography-headline-md-size: 1.5rem;
  --tapsi-typography-headline-md-height: 1.5;
  --tapsi-typography-headline-md-weight: 600;
  --tapsi-typography-headline-lg-font: var(--tapsi-typography-font-family);
  --tapsi-typography-headline-lg-size: 1.75rem;
  --tapsi-typography-headline-lg-height: 1.5;
  --tapsi-typography-headline-lg-weight: 600;
  --tapsi-typography-display-sm-font: var(--tapsi-typography-font-family);
  --tapsi-typography-display-sm-size: 2rem;
  --tapsi-typography-display-sm-height: 1.5;
  --tapsi-typography-display-sm-weight: 600;
  --tapsi-typography-display-md-font: var(--tapsi-typography-font-family);
  --tapsi-typography-display-md-size: 2.5rem;
  --tapsi-typography-display-md-height: 1.5;
  --tapsi-typography-display-md-weight: 600;
  --tapsi-typography-display-lg-font: var(--tapsi-typography-font-family);
  --tapsi-typography-display-lg-size: 3rem;
  --tapsi-typography-display-lg-height: 1.5;
  --tapsi-typography-display-lg-weight: 600;
}
```

## API Integration

Generate TypeScript types based on the API response structure provided above. The types must:

1. Match the API response **exactly** - do not add, remove, or modify any fields
2. Use the actual field names and structure from the API response
3. Support all sections defined in the response

**Before starting any code generation**, you should:

1. Call the API endpoint I provided
2. Show me the complete API response
3. Confirm you understand the data structure

This ensures we're aligned on the exact API response format before generating any code.

## Initial Setup

Before generating UI components, you should:

1. **Add CSS tokens to global CSS file** - Include all the design tokens provided above in a global CSS file (e.g., `globals.css` or `tokens.css`)

2. **Generate TypeScript types** - Create type definitions based on the API response structure in a `types.ts` file. Example:

```tsx
export type LandingData = {
  sections: {
    hero: HeroData;
    services: ServicesData;
    ourGoal: OurGoalData;
    faq: FaqData;
  };
};

// Define each section's type based on API response
export type HeroData = { /* ... */ };
export type ServicesData = { /* ... */ };
// ... etc
```

## Component Architecture

Generate code following this structure:

### Main Landing Component

```tsx
import { HeroSection, Services, OurGoal, Faq } from "./components/index.ts";

type Props = {
  data: LandingData; // Type based on API response
};

export const XLanding: React.FC<Props> = props => {
  const { data } = props;
  return (
    <main className={classes["root"]}>
      <HeroSection data={data.sections.hero} />
      <Services data={data.sections.services} />
      <OurGoal data={data.sections.ourGoal} />
      <Faq data={data.sections.faq} />
    </main>
  );
};
```

### Usage Pattern

The landing component should be used like this:

```tsx
const App = ({data}) => {
  return <XLanding data={data} />
}
```

This design enables easy SSG (Static Site Generation) integration.

## Section Components

- Break each section into separate components
- Each section component receives its data as props
- Export all section components from `components/index.ts`
- Use CSS Modules for styling each component

## HTML Content Handling

Some API fields contain HTML strings (e.g., `"<p>با توجه به آنکه ترافیک نقش موثری در هزینه پیک موتوری دارد...</p>\n"`).

When rendering HTML content:

1. **Sanitize** using DOMPurify: `DOMPurify.sanitize(htmlString)`
2. **Avoid nesting issues**: Don't place `<p>` inside `<p>` tags
3. Use `dangerouslySetInnerHTML` only after sanitization

Example:

```tsx
import DOMPurify from 'dompurify';

const sanitizedHTML = DOMPurify.sanitize(data.htmlContent);
<div dangerouslySetInnerHTML={{ __html: sanitizedHTML }} />
```

## UTM Parameters

The page may receive UTM parameters in the URL (e.g., `?utm_content=buffercf3b2&utm_medium=social&utm_source=snapchat.com&utm_campaign=buffer`).

For all CTAs (buttons and links):

1. Extract UTM parameters from the current URL
2. Sanitize the UTM parameters
3. Append them to all CTA URLs for marketing tracking

Example utility:

```tsx
const getUtmParams = () => {
  const params = new URLSearchParams(window.location.search);
  const utmParams = new URLSearchParams();
  
  ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'].forEach(key => {
    const value = params.get(key);
    if (value) utmParams.set(key, value);
  });
  
  return utmParams.toString();
};

const appendUtmToUrl = (url: string) => {
  const utmString = getUtmParams();
  if (!utmString) return url;
  
  const separator = url.includes('?') ? '&' : '?';
  return `${url}${separator}${utmString}`;
};
```

## Accessibility Requirements

- Use semantic HTML elements (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`, etc.)
- Add ARIA labels in Persian where needed
- Ensure keyboard navigation works properly
- Provide alt text for all images
- Maintain proper heading hierarchy (h1, h2, h3, etc.)
- Set `lang="fa-IR"` on the document
- Ensure color contrast meets WCAG standards
- Make the page fully usable by screen readers

## Responsive Design

I will provide two designs for each section:

1. **Desktop design**
2. **Mobile design**

You should:

- Create fully responsive layouts that work on mobile, tablet, and desktop
- Use CSS media queries or modern CSS techniques (flexbox, grid)
- Ensure smooth transitions between breakpoints
- Test that all interactive elements work on touch devices

## Incremental Updates

As I send you designs section by section:

1. Add new section components
2. Update the main landing component to include new sections
3. Update TypeScript types if the API structure changes
4. Maintain consistency with existing code style and structure

## Code Quality

- Write clean, maintainable TypeScript code
- Use meaningful variable and component names
- Follow React best practices
- Optimize for performance
- Keep components focused and single-purpose
- Use proper TypeScript typing throughout

## File Structure

Organize the code as follows:

```txt
/
├── XLanding.tsx          # Main landing component
├── XLanding.module.css   # Main landing styles
├── types.ts              # TypeScript types for API data
├── utils/
│   ├── sanitize.ts       # HTML sanitization utilities
│   └── utm.ts            # UTM parameter utilities
└── components/
    ├── index.ts          # Export all section components
    ├── HeroSection/
    │   ├── HeroSection.tsx
    │   └── HeroSection.module.css
    ├── Services/
    │   ├── Services.tsx
    │   └── Services.module.css
    └── ...
```

---

**Remember**:

- RTL direction for all layouts
- Do NOT mirror icons/assets
- Persian language for a11y labels
- Exact API response structure for types
- Sanitize HTML content
- Append UTM params to all CTAs
- Fully responsive design
- Semantic and accessible HTML
