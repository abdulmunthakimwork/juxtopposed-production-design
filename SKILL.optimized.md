---
name: juxtopposed-design-methodology
description: UI/UX design methodology for designing, redesigning, critiquing, or improving interfaces — full-audit, structure-before-style, diagnose-before-redecorate thinking. For any design/improvement request on UIs, websites, apps, dashboards, landing pages, or design systems. Not for pure implementation without design judgment.
---

# UI/UX Design Methodology

Built to think like a working product designer: diagnose before decorating, structure before style, full-surface audits over spot-fixes, implementation as part of design. Based on researching the **Juxtopposed** YouTube channel (`@juxtopposed`) — known for a complete YouTube redesign (branding → all surfaces) and Figma/GSAP/Three.js design-and-build content.

**One rule above all:** Have boundaries for thinking. Have no boundaries for creating. Judgment (usability, clarity, hierarchy, accessibility, feedback, intentionality) is non-negotiable. Appearance (layout, density, nav, type, color, motion, language) is never dictated. Section 5 is an optional numeric reference, never a requirement.

---

## 1 — Understand before designing

Never open with decoration or a favorite layout:
- **Primary action:** the single most important user task here
- **Mental model:** what users already expect from conventions in this space (deviating should be a choice, not accident)
- **Users:** expertise, frequency, device, environment, urgency
- **Jobs-to-be-done:** ranked by real frequency, not ease of design
- **Friction/constraints:** tech limits, brand limits, realistic content (long text, sparse data, edge cases)

Underspecified requests: state a one-line assumption about the product and proceed.

## 2 — Flows before screens

Map the journey before the frame: entry points, primary path + alternates, decision points, feedback at every action, completion, errors/empty/loading/partial/interrupted states + recovery.

A beautiful screen inside a broken flow = bad product. Restructure screens, features, or navigation if the flow demands it.

## 3 — Cognitive-load and structural diagnosis (redesigns)

Before visual output on an existing product, name the specific failure:
- **Border soup** — dividing lines doing whitespace's job
- **Frankenstein navigation** — wayfinding split across inconsistent areas
- **Shouting match** — too many elements competing for primary weight
- **Reskin disguised as redesign** — new colors/fonts over broken structure

Full redesign = systematic pass across every meaningful surface, not a spot-fix.

## 4 — Information architecture before polish

Organize by user understanding, not backend structure. Decide conceptual grouping, category hierarchy, progressive disclosure, and the one most important thing per screen — before any color or font.

**Gut-check:** draft layout in grayscale, structural blocks only. If hierarchy doesn't hold without color, color won't fix it. Overwhelming screen? Diagnose structure first, not spacing or font size.

## 5 — Visual system (optional reference, not a rule)

A default under time pressure, not a requirement. Use something else if the product calls for it.

- **Spacing:** 8px scale (8, 16, 24, 32, 40, 48, 64, 80); 4px for micro-spacing
- **Type:** few steps (display/H1-H2/body/caption); **weight and color do more hierarchy work than size**. Body text floor: 14px (prefer 16px)
- **Color:** ~60/30/10 (neutral/structural/accent). Red/green/yellow = destructive/success/warning — strong convention
- **Elevation:** subtle shadows low, stronger for genuinely floating elements (modals, popovers)
- **Nested radii:** outer ≈ inner + padding for concentric curves
- **Cards:** group heterogeneous content (image+title+metadata+action); don't wrap plain text in cards
- **Whitespace before borders:** whitespace first; subtle border only when backgrounds are identical and whitespace can't separate

## 6 — Hierarchy, made intentional

Communicate importance, sequence, status, next action. Mechanism is open — type, position, scale, color, whitespace, grouping, motion, density. Never impose one formula on every product.

## 7 — Simplicity, applied intelligently

Remove accidental complexity, not necessary complexity. Expert tools (DAW, IDE, trading dashboards) earn density. Density tracks task complexity, expertise, frequency — not a whitespace aesthetic. "Simple" ≠ removing until nothing's left.

## 8 — Interaction and state

Every control communicates what it does, its state, and the consequence. First-class for every interactive element: hover, focus (visible, keyboard-usable ring), active/pressed, selected, disabled, loading, success, error, empty, partial, offline, validation states. Truncation/wrapping rules for overflow text. Empty state on purpose: icon + message + primary action, not a blank rectangle.

## 9 — Consistency without bureaucracy

Reuse when interaction is identical. Variant when context differs. Unique when problem genuinely requires it. Don't abstract into a component until the third real instance — premature componentization wastes effort. Design systems extracted **after** real needs understood, not imposed on day one.

## 10 — Accessibility and responsiveness, from the start

Fold in during design: contrast ≥4.5:1 body, ≥3:1 large text, legible type, keyboard interaction, visible focus, touch targets ≥44×44px, semantic structure, motion sensitivity, color-independent meaning, clear errors.

Responsive = **experience transformation**, not shrinking. Desktop/tablet/mobile may need genuinely different compositions to preserve the same goal.

## 11 — Push visual identity, hard, once structure is right

Once structurally sound, push identity aggressively: type, color, imagery, motion, texture, shape, rhythm → memorable and specific. Ask: *could this come from any random SaaS template?* If yes → go further.

Don't follow trends by default. Glassmorphism, brutalism, bento grids, dark mode — tools, not mandates. Use only when genuinely serving this product.

Design for real usage: long strings, empty states, errors, daily use, messy data, keyboard-only, slow networks.

## 12 — Explore before converging

Non-trivial tasks: generate multiple **structurally different** concepts before picking one. Vary IA, nav, density, visual language — not just palette/spacing. Select strongest by actual problem fit.

Intentional rule-breaking welcome after conventions are understood. Never follow convention merely because common; never break merely to be different.

## 13 — Self-critique before delivery (mandatory)

Before presenting:
- **Squint test:** primary action still most visually dominant?
- **System adherence:** arbitrary values earning their place?
- **Interaction cost:** main goal reachable without unnecessary friction?
- **Visual noise:** borders/tints removable? If yes → remove
- **Accessibility:** contrast, focus, touch targets checked
- **Genericness:** specific to this product, or swappable onto a competitor?

Improve rather than defend the first version.

---

**Communicating decisions:** Name the problem, the choice, the tradeoff — concisely.

**Final standard:** Not "modern," not "template-like," not "system-compliant." Whether the interface makes the product easier to understand, use, access, and remember than a generic default — and feels specifically made for this product.

---

## SOURCING

Video transcripts were not accessible, so this file distinguishes traceable from general practice.

**Grounded in verifiable channel evidence:**
- Full-surface redesign audit (not spot-fix) — flagship YouTube restructuring
- Design + implementation as one discipline (Figma → code/animation)
- Concrete, nameable friction drives redesign, not vague aesthetic upgrade

**Generic industry practice (good, not channel-specific):**
- Numeric reference system (section 5), JTBD framing, WCAG numbers, squint test, premature-componentization guidance, self-critique checklist

**Excluded:** no visual signatures from any creator carried as rules — principles-first, not style-first.
