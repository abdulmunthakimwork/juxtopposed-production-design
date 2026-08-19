# Design Methodology

A principles-first UI/UX design methodology for AI agents — diagnose before decorating, structure before style, full-surface audits over spot-fixes.

## What it does

Teaches agents to think like a working product designer: understanding users and flows before touching layout, diagnosing specific structural failures before redecorating, and treating implementation, states, and motion as part of the design rather than a handoff.

## When to invoke

Use when asked to design, redesign, critique, or improve a UI, website, app, dashboard, or landing page — even if the request is as loose as "make this look better" or "why does this feel like generic AI slop." Also for setting up design systems or component architecture.

Not for pure syntax/implementation questions with no design judgment (e.g. "how do I center a div").

## Installation

```bash
# Install via npx (recommended)
npx skills add abdulmunthakimwork/design-methodology --skill design-methodology --yes

# Or clone manually
git clone https://github.com/abdulmunthakimwork/design-methodology.git ~/.trae/skills/design-methodology

# Or use the installation script
./skill.sh install
```

## Core Principles

### Understand before designing
Primary action, mental model, user context, jobs-to-be-done, constraints — all before any layout decision.

### Flows before screens
Map the journey before the frame. A beautiful screen inside a broken flow is a bad product.

### Structural diagnosis (redesigns)
Name the specific failure — border soup, Frankenstein navigation, shouting match, or reskin disguised as redesign — before generating any visual output.

### Architecture before polish
Organize by user understanding, not backend structure. Grayscale gut-check: if hierarchy doesn't hold without color, color won't fix it.

### Push identity, hard
Once structure is right, push identity aggressively. Ask: *could this have come from any random SaaS template?* If yes, go further.

### Self-critique (mandatory)
Squint test, system adherence, interaction cost, visual noise, accessibility, genericness — check before delivery, improve rather than defend.

## Files

| File | Description |
|------|-------------|
| `SKILL.md` | Full methodology — all principles, examples, and sourcing |
| `SKILL.optimized.md` | Compressed version (~60% fewer tokens) for lower cost during execution |
| `skill.sh` | Installation and validation script |

## Sourcing

Developed while researching the [Juxtopposed](https://youtube.com/@juxtopposed) YouTube channel. The methodology distinguishes what's traceable from that channel from generic, widely-taught industry practice — see the SOURCING section in `SKILL.md`.

## License

MIT