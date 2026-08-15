---
name: juxtopposed-production-design
description: A first-principles UI/UX design framework extracted from Juxtopposed. Teaches AI agents how to reason through visual hierarchy, layout selection, containerization, and brand identity to produce diverse, context-specific, production-ready interfaces without relying on fixed templates.
version: 2.0.0
tags: [ui, ux, design-principles, visual-reasoning, figma, design-systems, layout-engine]
---

# Juxtopposed First-Principles UI/UX Design Skill

## 1. Core Philosophical Invariants
Before making any design decision, evaluate against these four immutable truths:

1. **Intentionality Over Ornamentation:** Every pixel, border, padding value, and background shift must solve a specific visual or functional problem. If removing an element does not break comprehension or usability, it is visual noise and must be eliminated.
2. **Structure Dictates Layout (No Universal Template):** There is no single "correct" UI layout. The shape of the content and the user's mental model dictate whether an interface should be a full-bleed canvas, an asymmetrical split, a bento grid, an editorial stream, or a high-density utility board.
3. **Personality Through Restraint:** A distinct brand identity is not achieved by cluttering the screen with illustrations and gradients. It is built by making 1 or 2 high-conviction, opinionated visual choices (e.g., an expressive typeface, unusual layout geometry, or a singular sharp accent color) while keeping the rest of the interface ruthlessly clean and functional.
4. **Subtraction Before Addition:** When fixing or refining a UI, your primary tool is subtraction. Remove dividing lines, strip redundant labels, collapse secondary menus, and un-box unnecessary containers before adding anything new.

---

## 2. Layout Diversity Engine (Selecting Layout Archetypes)

Instead of defaulting to a generic "Dashboard Sidebar + Cards" layout, evaluate the content and choose the layout archetype that best serves the user's goals:

| Layout Archetype | When to Use (Context & Intent) | Spatial Structure |
| :--- | :--- | :--- |
| **A. High-Density Utility / Canvas** | Complex workflows, creation tools, IDEs, node editors, heavy data manipulation. | Edge-to-edge workspaces, floating tool palettes, collapsible panels, micro-padding, high information density. |
| **B. Asymmetric Split / Editorial** | Storytelling, onboarding, portfolio, high-concept SaaS, brand-driven web apps. | 50/50 or 60/40 directional splits, exaggerated typography scale, generous whitespace, strong visual anchors on one side. |
| **C. Bento Box Modular Grid** | Feature overviews, multi-metric dashboards, mixed-media showcases, landing page features. | Interlocking heterogeneous grid cells (1x1, 2x1, 2x2) with unified corner radii and distinct visual weight per cell. |
| **D. Minimalist Centered Stream** | Reading, writing, checkout, single-task flows, conversational interfaces. | Focused narrow-width container (max 680px-800px), zero sidebars, high vertical rhythm, extreme progressive disclosure. |
| **E. Edge Navigation Canvas** | Multi-view web applications with persistent context (e.g., email clients, music players). | Fixed thin icon-rail navigation, multi-column master-detail views, fluid interior scrolling regions. |

---

## 3. Decision Heuristics & First-Principles Reasoning

### Heuristic A: Containerization & Enclosure (The Anti-Overcarding Principle)
*   **The Problem:** Defaulting to putting every piece of text or data inside a white box/card with a drop shadow creates visual clutter ("Border Soup").
*   **Decision Tree:**
    *   *Step 1:* Try placing content directly on the root background surface using **whitespace alone** (24px–48px gaps) for separation.
    *   *Step 2:* If background elements bleed into each other, use **subtle tonal background contrast** (e.g., `#FFFFFF` container on a `#F9FAFB` surface).
    *   *Step 3:* Use a **border** (1px, 10% opacity) *only* when two adjacent containers share the exact same background color and spatial separation is impossible.
    *   *Step 4:* Use a **card / box container** *only* when the enclosed elements form a singular, discrete, draggable, or distinct entity (e.g., a product card, a user profile block, an isolated widget).

### Heuristic B: Hierarchy via Weight & Spatial Dominance (Not Just Size)
*   **The Problem:** Over-relying on huge text sizes to make things stand out distorts layout balance.
*   **Decision Tree:**
    *   **Primary Focus (Focal Point):** Must capture attention in < 1 second. Create focus using *Contrast Ratio*, *Spatial Isolation* (whitespace surrounding it), or *Accent Color*. (Limit to 1 per view).
    *   **Secondary Context:** Use typography weight (e.g., `Font-Weight: 600` at 16px) and high contrast.
    *   **Tertiary Metadata:** Use subdued color tokens (e.g., `text-muted`, 60% opacity) at standard body size rather than making text illegibly small.
    *   *Rule:* Never use more than **3 font weights** and **4 font sizes** on a single screen.

### Heuristic C: Spatial Rhythm & Mathematical Harmony
*   **The 8-Point Grid Invariant:** All layout dimensions, gap properties, padding, and margins must strictly evaluate to a multiple of 8 ($8, 16, 24, 32, 48, 64, 96\text{px}$). Use $4\text{px}$ exclusively for micro-gaps (e.g., icon-to-label spacing).
*   **Nested Corner Radii Formula:** 
    *   Never use arbitrary border-radii on nested elements.
    *   $$\text{Radius}_{\text{Outer}} = \text{Radius}_{\text{Inner}} + \text{Padding}_{\text{Container}}$$
    *   *Example:* If an inner button has a radius of $8\text{px}$ inside a container with $16\text{px}$ padding, the container's radius **must** be $24\text{px}$.

### Heuristic D: Personality & Identity Infusion (Anti-Slop Protocol)
*   **The Problem:** AI outputs often look like generic, soul-less Tailwind/Shadcn UI templates.
*   **Decision Tree to Inject Brand Identity:**
    1.  **Typography Contrast:** Pair a highly distinct Display/Header font (e.g., Serif, Geometric Mono, Neo-Grotesque, Brutalist Display) with an ultra-readable Neutral Body font (Inter, SF Pro, System UI).
    2.  **Color Intentionality (60-30-10):**
        *   `60%` Neutral canvas (White/Black/Slate).
        *   `30%` Structural hierarchy (Surface tones, muted text).
        *   `10%` Expressive Accent (Electric Lime, International Klein Blue, Vivid Orange, Warm Amber). Use accent *sparingly*—only on interactive triggers and active states.
    3.  **Shape Language Intent:** Decide early if the UI is **Soft & Tactile** (rounded radii, soft ambient shadows, warm neutrals) or **Sharp & Architectural** (0px radii, high-contrast borders, dark surfaces, mono fonts). Do not mix shape languages arbitrarily.

---

## 4. Figma & Technical Execution Principles

When specifying designs or outputting frontend layout specs:

*   **Auto Layout Mental Model:** View every container as a dynamic Flexbox (`Flex-Direction`, `Justify-Content`, `Align-Items`, `Gap`). Never define fixed pixel heights on text containers—use `Vertical Auto-Fit / Hug` and `Horizontal Fill-Container`.
*   **Design Tokens over Hardcoded Hex Values:** 
    *   Define colors by semantic role (`bg-surface-primary`, `text-main`, `text-muted`, `accent-action`, `border-subtle`).
    *   Allows instant switching between light mode, dark mode, and high-contrast accessibility modes without refactoring layout.
*   **Component Composition over Variant Explosion:**
    *   Do not create 50 unique button variants. Build atomic primitives and compose them using slot architecture or simple boolean visibility props.

---

## 5. Production Realities & Edge-Case Safeguards

A layout is broken if it only works with perfect 3-word titles and ideal images.

1. **Text Overflows & Variable Content:** Always specify truncation rules (`line-clamp-2` or `text-ellipsis`) for dynamic user input.
2. **State Complete Architecture:** Every interactive element MUST explicitly define 5 states:
   - `Default` $\rightarrow$ `Hover` $\rightarrow$ `Pressed/Active` $\rightarrow$ `Focused (A11y Ring)` $\rightarrow$ `Disabled`
3. **Empty & Loading States:**
   - Skeleton screens must match the exact grid geometry of the loaded state (prevent layout shifts).
   - Empty states should act as onboarding moments (Illustration/Icon + Actionable CTA).

---

## 6. Self-Critique & Layout Diversity Interrogation Loop

Before declaring a design complete, run this self-interrogation. If any test fails, refactor immediately.

- [ ] **The Diversity Test:** Does this layout look specifically designed for *this specific product*, or did I just generate a generic dashboard/landing page template?
- [ ] **The Subtraction Test:** Can I remove at least two structural containers, background panels, or divider lines without degrading usability?
- [ ] **The Eye-Tracking Test:** Does the eye naturally move from Primary Focal Point $\rightarrow$ Core Data $\rightarrow$ Actions, or is visual attention scattered across competing elements?
- [ ] **The Squint Test:** Squint your eyes. Is the primary call-to-action clearly identifiable within 500 milliseconds?
- [ ] **The Accessibility & Contrast Test:** Does all text meet WCAG 2.1 AA contrast requirements (minimum 4.5:1 for body text, 3:1 for large display text)? Are focus states visible for keyboard navigation?