#  CONVENTIONS

## 'Strict' vs 'Fuzzy' IDs

**• Purpose:** Define behavior or semantic capability that changes how the type can be used.

**• Examples:** Equatable, Hashable, Codable, Sendable, Error, View, Sequence.

**• Naming:** Adjectives or role nouns.

```
    protocol Teachable {
        func teach()
    }

    struct Teacher: Teachable {
        func teach() {
            print("Teaching class")
        }
    }
```
**• Strict (sensitive):** Changes when the user-visible string changes in any way you consider meaningful — including punctuation and casing if you choose. It preserves fidelity to the original input.

**• Fuzzy (tolerant):** Ignores superficial differences (like punctuation, casing, extra spaces) to treat near-equivalents as the same.
