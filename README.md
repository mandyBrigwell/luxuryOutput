# luxuryOutput
Jazz up your CLI in KOL…

# Usage

import <luxuryOutput.ash>

## luxuryOutputMono

luxuryOutputMono ("string")
prints the string in monospaced font.

luxuryOutputMono ("string", "color")
prints the string in monospaced font with the named html color.

## luxuryOutputBig

luxuryOutputBig ("string")
prints the string in a large, block-rendered ASCII-style font.
Characters are currently limited to A-Z, space and an asterisk.

luxuryOutputBig ("string", "color")
prints the string in a large, block-rendered ASCII-style font with the named html color.

## Compatibility

The previous functions, fprint() and bigprint() are still usable; they redirect to the newly-named functions.
