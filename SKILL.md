---
name: juxtopposed-design-methodology
description: A UI/UX and digital product design methodology for designing new interfaces, redesigning existing products, critiquing designs, or reasoning through layout/hierarchy/interaction/visual-identity decisions — built around a full-audit, structure-before-style, diagnose-before-redecorate way of thinking. Use whenever asked to design, redesign, critique, or improve a UI, website, app, dashboard, or landing page, or to set up a design system/component architecture — even if the request is as loose as "make this look better" or "why does this feel like generic AI slop." Not for pure syntax/implementation questions with no design judgment involved (e.g. "how do I center a div"). Governs how to think and what to check, not what things must look like — see the file for what's mandatory (judgment, process, states, accessibility) versus optional (any specific numeric system).
---

# UI/UX Design Methodology

## What this is, honestly

This skill was built to think the way a working product designer thinks — diagnosing before decorating, structure before style, full-surface audits instead of spot-fixes, treating implementation and animation as part of the design rather than a handoff. It was developed while researching the **Juxtopposed** YouTube channel (`@juxtopposed`), whose most documented body of work is a full, ground-up redesign of YouTube (branding → layout → explore → home → video → channel → subscriptions → library → sharing → Shorts → search), alongside Figma, GSAP, Three.js, and Spline-based design-and-implementation content.

Read the `SOURCING` section at the end before treating any specific claim in here as "verified from her work." Video transcripts were not accessible during this research, so this file distinguishes what's actually traceable to the channel from generic, widely-taught design practice that fills the rest of the picture. Don't skip that section; it's not boilerplate, it's the part that keeps this file honest.

## The one rule above all others

**Have boundaries for thinking. Have no boundaries for creating.**

Judgment is non-negotiable: usability, clarity, hierarchy, accessibility, feedback, and intentionality are always in play. Appearance is open: layout, density, navigation model, typography, color, motion, and visual language are never dictated by this file. Nothing below should be read as "use this visual pattern" — every instruction here is a lens for judgment, not a template for output. Section 5 contains a numeric reference system (grid, type scale, shadow values, a radius formula) — that section is explicitly optional, a competent default to reach for under time pressure, never a law this skill enforces.

---

## 1 — Understand before you design

Never open with decoration or a favorite layout.

- **Primary action:** what's the single most important thing the user needs to do here?
- **Mental model:** what does the user already expect from established conventions in this space? (Deviating from a strong convention should be a choice, not an accident.)
- **Users and context:** expertise level, frequency of use, device, environment, urgency.
- **Jobs-to-be-done:** the tasks the product must let someone complete, ranked by real frequency and importance — not by what's easiest to design.
- **Existing friction and constraints:** technical limits, brand constraints, realistic content (long text, sparse data, edge cases).

If the request is underspecified, state a reasonable one-line assumption about the product and its users and proceed — don't stall on a clarifying question unless the ambiguity is severe enough that any design would be a guess.

## 2 — Flows before screens

Design the journey before the frame. For each significant task, map entry points, the primary path and alternates, decision points, feedback at every action, completion, and errors/empty/loading/partial/interrupted states and recovery.

A beautiful screen inside a broken flow is a bad product. Combine screens, split a screen into steps, remove a feature, add a contextual action, or restructure navigation entirely if the flow demands it — the flow is allowed to change the product's shape.

## 3 — Cognitive-load and structural diagnosis (redesigns)

Before generating any visual output on an existing product, name the specific failure — don't just say it "needs a refresh":

- **Border soup** — too many dividing lines doing the job whitespace should do.
- **Frankenstein navigation** — wayfinding split across multiple inconsistent areas instead of one coherent system.
- **Shouting match** — too many elements competing for primary visual weight, so nothing actually reads as primary.
- **Reskin disguised as redesign** — new colors/fonts over the same broken structure. If the underlying flow or hierarchy is wrong, fix the structure; paint doesn't fix structure.

A full redesign works best as a systematic pass across every meaningful surface of the product, not a spot-fix on the one screen someone complained about — go surface by surface: what's this for, what's actually wrong with it today, what changes, and why.

## 4 — Information architecture before polish

Organize information by what the user understands and needs, not by backend structure or org chart. Decide what groups together conceptually, what hierarchy of categories helps someone navigate, what's shown now versus revealed on demand (progressive disclosure), and what the one most important thing on this screen is — before any color or font is chosen.

A useful gut-check before styling anything: **draft the layout in grayscale, structural blocks only.** If the hierarchy doesn't hold with all color removed, color will not fix it — that's a structure problem, not a palette problem. If a screen feels overwhelming, diagnose the structure first; shrinking font size or adding whitespace is a symptom-level fix.

## 5 — Visual system (optional reference, not a rule)

Everything in this section is a **default you may reach for**, not something this skill requires. If a product's problem calls for something else — an irregular grid, an unconventional type scale, decorative shadows, asymmetric radii — use that instead. The value of a system like this is speed and internal consistency under time pressure, not correctness.

- **Spacing:** an 8px-based scale (8, 16, 24, 32, 40, 48, 64, 80), with 4px allowed for micro-spacing (icon-to-label gaps), is a common, well-tested default — not because it's "correct" but because it removes arbitrary micro-decisions and gives design/dev a shared vocabulary.
- **Type:** a small number of steps (e.g. display/H1-H2/body/caption) with **weight and color doing more hierarchy work than size alone** — a reasonable default for legibility. A hard floor around 14px (prefer 16px) for body text is a real accessibility consideration, not a style preference — a 12px light-gray body is an anti-pattern regardless of aesthetic.
- **Color allocation:** a large-neutral / structural-secondary / small-accent split (often quoted as roughly 60/30/10) is one workable way to keep an accent color meaningful — don't burn the accent on things that don't need attention. Red/green/yellow carrying destructive/success/warning meaning is a strong convention; breaking it without a very good reason will genuinely confuse users.
- **Elevation:** if using shadows, keep them nearly invisible for low-elevation surfaces (subtle, low-opacity) and reserve stronger elevation for things that are genuinely floating above content (modals, popovers) — depth should come from context and z-order more than shadow darkness.
- **Nested radii:** if using rounded corners on nested containers, `outer radius ≈ inner radius + padding` keeps curves visually concentric instead of looking mismatched — a useful formula to know, not a mandate to round everything.
- **Cards:** group genuinely heterogeneous content (image + title + metadata + action) in a card; don't wrap plain paragraphs or simple list rows in cards just for consistency — let text sit on the surface.
- **Whitespace before borders:** try separating sections with generous whitespace first; reach for a subtle border only when backgrounds are visually identical and whitespace alone can't create separation. Avoid heavy/pure-black borders outside a deliberately brutalist direction.

## 6 — Hierarchy, made intentional

The interface must communicate importance, sequence, status, and next action. The mechanism is open — typography, position, scale, color, whitespace, grouping, motion, or density itself — pick whichever actually creates the right hierarchy for this content. Never impose one hierarchy formula ("big hero, three feature cards") on every product; a trading terminal, a children's game, and a legal document viewer all need real hierarchy, and it will look nothing alike across the three.

## 7 — Simplicity, applied intelligently

Remove **accidental** complexity, not necessary complexity. Complex tools for expert users may correctly be dense — a DAW, a spreadsheet, an IDE, or a trading dashboard earns density a consumer onboarding flow does not. Density should track task complexity, user expertise, and frequency of use, not a fixed aesthetic preference for whitespace. "Modern" doesn't mean rounded corners and gradients; "simple" doesn't mean removing until nothing's left.

## 8 — Interaction and state

Every control should communicate what it does, its current state, and the consequence of using it. Novel interaction models are welcome, but must resolve into understanding fast through affordance, context, and feedback.

Treat these as first-class requirements for every interactive element, not an afterthought: hover, focus (a visible, keyboard-usable focus ring — not just a mouse hover effect), active/pressed, selected, disabled, loading, success, error, empty, partial, offline, and validation states. Define truncation or wrapping behavior for any user-generated text that could overflow. Design the empty state on purpose — an illustration or icon, a helpful message, and a clear primary action — not just a blank rectangle.

## 9 — Consistency without bureaucracy

Reuse a pattern when the underlying interaction is genuinely the same. Use a variant when context differs; build something unique when the problem genuinely requires it. A practical rule of thumb: don't abstract something into a reusable component until you've built the same pattern in real context a third time — premature componentization (a 40-variant component built before anyone's sure the pattern is right) wastes effort and locks in guesses. Design systems and tokens should be extracted **after** the product's real needs are understood, not imposed on day one.

## 10 — Accessibility and responsiveness, from the start

Fold these in during design, not as a final pass: contrast (aim for at least 4.5:1 for body text), legible type, keyboard interaction, visible focus states, touch targets sized around at least 44×44px, semantic structure, motion sensitivity, color-independent meaning, and clear error communication.

Responsive design is **experience transformation**, not shrinking. Desktop, tablet, and mobile may need genuinely different compositions, navigation models, and hierarchies to preserve the same user goal — not a squeezed single column of the same layout.

## 11 — Push visual identity, hard, once structure is right

Once the experience is structurally sound, push identity aggressively — typography, color, imagery, motion, texture, shape, rhythm should combine to make the product memorable and specific. Interrogate your own output: *could this have come from any random SaaS template?* If yes, that's a signal to go further, not a stopping point. Generic-slop defaults — an unexamined Inter/system-font, white background, light-gray-border, default-blue-button combination applied without any thought to this product's actual identity — are the thing to actively fight, not a neutral starting point.

Don't follow trends by default. Glassmorphism, brutalism, neumorphism, bento grids, oversized type, dark mode, floating nav — tools, none mandatory, none inherently good. Use one only when it genuinely serves this specific product's problem.

Design for real usage, not a screenshot: long strings, empty states, error states, repeated daily use, messy real data, keyboard-only use, slow networks. That's the actual test, not how it looks in one idealized mock.

## 12 — Explore before converging

For any non-trivial task, generate multiple **structurally different** concepts before picking one — not the same layout recolored. Vary information architecture, navigation model, density, and visual language, not just palette and spacing. Select the strongest direction based on the actual problem, not novelty or familiarity for their own sake. Be willing to discard a first idea, including a good one, if a later concept serves the problem better.

Intentional rule-breaking is welcome once conventions are understood. Never follow a convention merely because it's common; never break one merely to be different — break it when it produces a measurably clearer, faster, more memorable, or more enjoyable result here.

## 13 — Self-critique before delivery (mandatory, not optional polish)

Before presenting a design, inspect it adversarially:

- **Squint test:** blurred or at a glance, is the primary action still the most visually dominant thing?
- **System adherence:** did an arbitrary value creep in (a random font size, an off-palette hex) that isn't earning its place? If so, either consolidate it to the system or justify why this is the exception.
- **Interaction cost:** can the user reach the screen's main goal without unnecessary friction, scrolling, or hunting?
- **Visual noise:** can a border, background tint, or dividing line be removed and the layout still make sense? If yes, remove it.
- **Accessibility:** contrast, focus visibility, touch target size — checked, not assumed.
- **Genericness:** is the visual identity actually specific to this product, or could it be swapped onto a competitor's product without anyone noticing?

Improve the design in response rather than defending the first version.

## Communicating decisions

Explain major decisions, tradeoffs, and what changed and why — concisely and in plain language, without needing to expose step-by-step internal reasoning. A good explanation names the problem, the choice made, and the tradeoff accepted; it doesn't just describe what was built.

## The final standard

Not "does this look modern." Not "does this look like a template." Not "does this follow a design system." The standard is whether the interface makes the product easier to understand, easier to use, more efficient, more accessible, more coherent, more emotionally appropriate to its purpose, and more memorable than a generic default would have been. It should feel specifically made for this product.

---

## SOURCING — what's actually traceable to Juxtopposed vs. general practice

Read this before treating anything above as "verified from her work." Video transcripts from the channel were not directly accessible during research (YouTube blocks automated fetching of feed/video content), so nothing here should be taken as a direct quote or confirmed teaching unless stated as such.

**What's grounded in verifiable channel evidence** (the channel's self-description, its stated subject-matter tags, and the well-documented public structure of its flagship redesign case study):

- **Redesign as a full-surface audit, not a spot-fix.** The flagship YouTube redesign restructures an entire product surface by surface in one continuous pass (branding → layout → explore → home → video → channel → subscriptions → library → sharing → Shorts → search) rather than polishing one screen. Section 3's insistence on going surface-by-surface, and its framing of naming a specific, concrete failure rather than vaguely "needing a refresh," draws directly on that.
- **Design and implementation as one discipline.** The channel's declared subject matter spans Figma design work *and* hands-on frontend implementation and animation (CSS, JavaScript, GSAP, Three.js, Spline) — a design isn't treated as finished until it's built and moves. This grounds the emphasis throughout on states, motion, and interaction as core material (section 8), not a final layer.
- **Concrete, nameable friction drives the redesign, not vague aesthetic upgrade.** Publicly documented specifics of the flagship redesign (consolidating scattered subscription controls, restructuring comment readability, surfacing filters more directly, persistent/sticky elements for continuity) are each a response to a named problem. This supports section 3's instruction to diagnose a specific failure before touching anything.

**Generic, widely-taught industry practice — not attributable to this channel specifically, included because it's good practice, not because it was observed on the channel:**

- The entire numeric reference system in section 5 — the 8px spacing scale, the 60/30/10 color allocation, specific shadow opacity values, the nested-radii formula, semantic red/green/yellow — are standard, decades-old design-system conventions taught across the industry (design systems books, UX Planet, countless bootcamps). No evidence ties these specific numbers to this channel; they're included as a genuinely useful optional default, correctly labeled as generic rather than hers.
- Jobs-to-be-done framing, WCAG contrast/touch-target numbers, the squint test, premature-componentization guidance, and the self-critique checklist are standard product-design and accessibility practice, not channel-specific.

**Explicitly excluded:** no visual signature — specific component shapes, color choices, type pairings, spacing rhythms, or layout motifs — from this or any creator was carried into this skill as a rule. Those are one creator's choices for specific projects, not transferable principles, and encoding them as law would defeat the point of a principles-first methodology.
