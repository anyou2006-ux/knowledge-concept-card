# Common Card Schema

Every subject profile maps its knowledge into this shared structure. Keep only
fields that genuinely help the learner.

```yaml
meta:
  subject: english-vocabulary
  concept: resilience
  learner_level: senior-high
  learning_objective: Understand and use resilience in context.

core:
  definition: []
  notation_or_pronunciation: []
  key_relationship: []
  prerequisite: []

teach:
  explanation: []
  example: []
  contrast_or_common_error: []
  recall_aid: []

visual:
  teaching_question: What is hard to see in words alone?
  main_metaphor_or_diagram: []
  elements: []
  labels: []
  placement: []

layout:
  format: 4:5 portrait
  hierarchy: title -> core idea -> visual -> evidence -> recall
  palette:
    background: '#F7F7F5'
    text: '#222222'
    accent: '#E66A2C'
    secondary: '#2F6B72'
  renderer: html-first
```

## Output Contract

Return sections in this order.

1. **Card title**: concept plus the learner-relevant angle.
2. **Learning objective**: one sentence beginning with an action verb.
3. **Core knowledge**: definition, notation, rule, or key relation.
4. **Evidence**: an example, derivation, quotation, code trace, or application.
5. **Visual explanation**: what to draw, why it teaches, and required labels.
6. **Recall / error check**: a mnemonic, self-check, or common confusion where useful.
7. **Rendering brief**: format, hierarchy, palette, and typography constraints.

## Render Strategy

Use a two-stage production process for publication-grade cards:

1. Generate or source only the illustration layer. Keep it free of dense text.
2. Render headings, definitions, IPA, code, formulae, and labels with HTML/CSS,
   a design tool, or another deterministic text layout system.

This is more reliable than asking an image model to spell every detail on a
teaching card. A final image can be exported from the deterministic layout.
