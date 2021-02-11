towers
======
`towers` is a CodeSpells mod! Learn more at https://codespells.org.

### Installation

Clone this repo

```
cd towers
raco pkg install
```

Open up `main.rkt` and adjust the `codespells-workspace` accordingly. Run.

### Including this Rune Collection as a Package

`(require-mod towers)`

This gives you access to `towers:my-mod-lang` which you can combine into your mod's rune lang with `append-rune-langs`.
