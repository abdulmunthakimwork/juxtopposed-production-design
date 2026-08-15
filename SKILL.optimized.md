---
name: juxtopposed-production-design
description: First-principles UI/UX design framework for AI agents. Activate when tasked with building, redesigning, or auditing any user interface including landing pages, dashboards, portfolios, or applications requiring production-grade visual design.
version: 2.0.0
tags: [ui, ux, design, frontend, figma, accessibility, layout]
---

# Juxtopposed Production Design Skill

## CORE TRIGGERS (ACTIVATE WHEN)
- User requests UI redesign or new interface build
- Task involves landing pages, dashboards, portfolios, or web applications
- Need to audit existing design for visual hierarchy or accessibility issues
- Output must avoid generic template-looking interfaces
- User explicitly mentions "juxtopposed", "production design", or "first-principles UI"

---

## IMMUTABLE DESIGN RULES (ENFORCE ALL)

### RULE 1: INTENTIONALITY OVER ORNAMENTATION
- Every pixel, border, padding value, and background shift must solve a specific visual/functional problem
- If removing an element doesn't break comprehension/usability, it's noise — DELETE IT
- No decorative elements whatsoever

### RULE 2: STRUCTURE DICTATES LAYOUT (NO UNIVERSAL TEMPLATES)
- Content shape and user mental model determine layout archetype — NEVER default to "sidebar + cards"
- Choose ONE archetype only from the list below:

| LAYOUT ARCHETYPE | USE CASE CONTEXT |
|-------------------|------------------|
| High-Density Utility Canvas | IDEs, node editors, complex data manipulation, creation tools |
| Asymmetric Split/Editorial | Storytelling, onboarding, portfolios, high-concept SaaS |
| Bento Box Modular Grid | Feature overviews, multi-metric dashboards, landing page features |
| Minimalist Centered Stream | Reading, writing, checkout, single-task flows, conversational UIs |
| Edge Navigation Canvas | Email clients, music players, multi-view apps with persistent context |

### RULE 3: PERSONALITY THROUGH RESTRAINT
- Brand identity = 1-2 high-conviction visual choices only (expressive typeface, unusual layout geometry, singular accent color)
- Everything else stays ruthlessly clean and functional
- Never clutter with multiple decorative assets

### RULE 4: SUBTRACTION BEFORE ADDITION
- When refining UI: first remove dividing lines, strip redundant labels, collapse secondary menus, un-box unnecessary containers
- Only add new elements after subtraction is exhausted

---

## EXECUTION WORKFLOW (STEP-BY-STEP)

### STEP 1: CONTAINERIZATION & ENCLOSURE (ANTI-OVERCARDING)
FOLLOW DECISION TREE EXACTLY:
1. FIRST: Place content directly on root background using whitespace alone (24px-48px gaps)
2. IF elements bleed: Use subtle tonal background contrast (#FFFFFF on #F9FAFB)
3. IF same background collision: Add 1px border with 10% opacity only
4. ONLY use cards if elements form a singular, discrete, draggable entity

### STEP 2: HIERARCHY VIA WEIGHT & SPATIAL DOMINANCE
- MAXIMUM: 3 font weights, 4 font sizes per screen
- Primary focal point (1 per view only): Capture attention in <1s using contrast, isolation, or accent color
- Secondary context: font-weight: 600 at 16px
- Tertiary metadata: 60% opacity text-muted at body size — never shrink text to stand out

### STEP 3: SPATIAL RHYTHM COMPLIANCE
- All dimensions: multiples of 8px ONLY (8, 16, 24, 32, 48, 64, 96)
- 4px reserved EXCLUSIVELY for icon-to-label micro-gaps
- Nested corner radii formula: Outer Radius = Inner Radius + Container Padding
  ```css
  /* EXAMPLE: Button inside container */
  .button { border-radius: 8px; }
  .container { padding: 16px; border-radius: 24px; } /* 8 + 16 = 24 ✅ */
  ```

### STEP 4: BRAND IDENTITY INJECTION (ANTI-SLOP PROTOCOL)
1. **Typography**: One distinct display font + one ultra-readable body font (Inter, SF Pro)
2. **Color (60-30-10 rule)**:
   - 60%: Neutral canvas (white/black/slate)
   - 30%: Structural hierarchy (surface tones, muted text)
   - 10%: Accent color used ONLY on interactive triggers
3. **Shape language**: Choose either Soft & Tactile (rounded radii, soft shadows) OR Sharp & Architectural (0px radii, high-contrast borders) — NEVER mix

---

## TECHNICAL EXECUTION SPECS

### FIGMA/AUTO-LAYOUT RULES
- Every container = dynamic flexbox (justify-content, align-items, gap)
- Text containers: vertical auto-fit/hug only — never fixed pixel heights
- Design tokens over hardcoded hex values:
  ```css
  /* REQUIRED SEMANTIC TOKENS */
  --bg-surface-primary
  --text-main
  --text-muted
  --accent-action
  --border-subtle
  ```
- Atomic component composition only — no variant explosion (max 5 button variants total)

### STATE REQUIREMENTS (ALL INTERACTIVE ELEMENTS)
MUST define all 5 states explicitly:
```
Default → Hover → Pressed/Active → Focused (A11y ring) → Disabled
```

### DYNAMIC CONTENT HANDLING
- Specify truncation rules for all user-generated content: `line-clamp-2` or `text-ellipsis`
- Skeleton loaders must match loaded grid geometry to prevent layout shift
- Empty states = onboarding moments (icon + actionable CTA)

---

## PRE-COMPLETION VALIDATION CHECKLIST (ALL MUST PASS)

- [x] **Diversity Test**: Layout is specific to THIS product — not a generic template
- [x] **Subtraction Test**: At least two containers/lines could be removed without degradation
- [x] **Eye-Tracking Test**: Visual flow: Primary focal point → Core data → Actions
- [x] **Squint Test**: Primary CTA identifiable within 500ms when squinting
- [x] **Accessibility Test**: WCAG 2.1 AA compliant (4.5:1 body text, 3:1 large text)
- [x] **Focus States**: All interactive elements have visible keyboard focus rings