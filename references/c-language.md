# C Language Profile

Use for syntax, keywords, data types, standard-library functions, memory
concepts, compilation behavior, debugging patterns, or algorithms in C.

## Required Content

- precise definition and the C standard / implementation boundary when relevant
- syntax signature or minimal compilable code
- line-by-line explanation for code whose behavior is non-obvious
- expected output or state change, including preconditions
- memory, pointer, array, lifetime, or type-conversion model when it is central
- one realistic mistake, undefined behavior, or portability caveat when useful
- a small comparison when a nearby concept is likely to be confused

## Teaching Notes

Never imply that undefined behavior has one dependable result. Distinguish
language guarantees, common compiler behavior, and platform behavior. Keep the
code runnable; avoid pseudo-code that looks valid C.

## Visual Pattern

Use a memory diagram, compile-to-runtime flow, stack/heap sketch, pointer arrow,
or execution trace. A diagram must show addresses, values, and ownership only to
the level needed by the concept.

## Card Layout

- top: concept and one-sentence purpose
- left: syntax or minimal code
- right: runtime or memory diagram
- bottom: output, pitfall, and self-check

