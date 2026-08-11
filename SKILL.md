---
name: knowledge-concept-card
version: 0.1.0
description: >
  Turn a subject concept into a structured, curriculum-aware knowledge card with
  accurate teaching content, a concise visual explanation, and a modern textbook
  layout brief. Supports English vocabulary, C language, high-school Chinese, and
  high-school mathematics. Use when creating concept cards, vocabulary cards,
  subject infographics, study cards, teaching visuals, or when a user provides a
  word, phrase, programming concept, Chinese-language concept, or math concept
  and asks for an illustrated learning card.
---

# Knowledge Concept Card

Convert one learning concept into a clear, correct, and visually teachable card.
Treat factual accuracy, teaching sequence, illustration, and page layout as
separate responsibilities. This avoids attractive cards with missing context or
unreliable text.

## Input

Accept either a compact natural-language request or the following optional form:

```text
subject: english-vocabulary | c-language | high-school-chinese | high-school-math
concept: <one word, phrase, term, theorem, syntax item, text passage, or question type>
level: <optional learner level>
focus: <optional exam, use case, or difficulty>
format: card | card-and-html | content-spec (default: card)
```

When the subject is clear from the request, infer it. Ask a short question only
when the same term plausibly belongs to more than one subject and changes the
teaching content materially.

## Workflow

1. Identify the subject profile and read its reference in `references/`.
2. Establish the smallest correct teaching unit. Do not turn a narrow concept
   into an overview lesson.
3. Verify spellings, notation, code behavior, quotations, definitions, and
   examples before presenting them. State uncertainty rather than inventing a
   source, citation, result, or rule.
4. Build the card using the common content contract in
   `references/card-schema.md`. Omit fields that genuinely do not apply rather
   than filling them with weak material.
5. Choose one visual explanation that makes the hardest relationship visible.
   The illustration is instructional evidence, not decoration.
6. Produce the requested output mode:
   - `content-spec`: structured content and a layout brief.
   - `card`: structured content, a precise illustration prompt, and a rendering
     brief. Generate a final bitmap only when image-generation capability is
     available.
   - `card-and-html`: additionally create a self-contained HTML card. Use HTML
     or another deterministic layout renderer for final text whenever possible;
     image generators are better used for the illustration layer because they
     can distort dense instructional text.

## Delivery Structure

Use the following sections in the final response so the output remains useful
both as teaching material and as a handoff to a renderer:

1. **Card title** and **Learning objective**
2. **Core knowledge**: concise, subject-specific facts and conditions
3. **Evidence**: one example, trace, derivation, quotation, or application
4. **Visual explanation**: diagram choice, educational purpose, and labels
5. **Recall / error check**: only when it gives the learner a useful safeguard
6. **Rendering brief**: size, hierarchy, palette, and text-layout requirement

For `card-and-html`, provide the card specification first, then create the
self-contained HTML artifact. Do not substitute an image-only response for the
HTML artifact.

## Card Rules

- Put one learning objective at the top. A card should answer one question well.
- Make labels scannable: prefer short phrases, tables, code blocks, equations,
  and visual anchors over paragraph-length prose.
- Include a worked example, contrast, or use case when it improves
  understanding. Mark common mistakes only when they are realistic.
- Keep source-language material exact. For quotations, code, formulae, and IPA,
  preserve characters and punctuation.
- Separate confirmed facts from memory aids. A mnemonic must never look like a
  definition or rule.

## Visual System

Use a modern textbook/editorial style unless a subject reference says otherwise:

- white or pale gray ground; charcoal text; orange for emphasis; restrained blue
  or green only when they encode a second meaning
- ample whitespace; crisp editorial grid; thin rules; no gradients, shadows, or
  decorative blobs
- flat vector line art or a clean subject diagram; integrate the visual with the
  relevant labels
- reserve orange for the concept, key relation, or warning; do not color every
  heading
- prioritize legibility over poster-like composition

Read `references/card-schema.md` for the stable output contract and
`references/<subject>.md` for subject-specific requirements.

## Quality Check

Before finalizing, check:

- The card can be understood without the surrounding chat.
- The explanation matches the learner level and is internally consistent.
- The example actually demonstrates the stated rule or meaning.
- The illustration encodes a relationship from the content.
- No important text is delegated to an image generator without a deterministic
  text-rendering fallback.
