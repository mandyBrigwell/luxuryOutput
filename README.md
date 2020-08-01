## luxuryOutput
Jazz up your CLI in KOL…

## Usage

import <luxuryOutput.ash>

# fprint

fprint ("string")
prints the string in monospaced font.

fprint ("string", "color")
prints the string in monospaced font with the named html color.

# bigprint

bigprint ("string")
prints the string in a large, block-rendered ASCII-style font.
Characters are currently limited to A-Z, space and '\*'.

bigprint ("string", "color")
prints the string in a large, block-rendered ASCII-style font with the named html color."

## Limitations

# Character Set

Currently only hardcoded to support A-Z, a space, and an asterisk.

## To Do

# Remove the switch command

It would be more efficient to simply match the character's position in a string.

# Increase Character Set

If we could get the unicode number of a character from an ash function, things would be simpler. As it is, the characters are currently hard-coded into a switch command. See above.

# Alternate fonts

The current one is designed to attract attention, and (LOOK AT MY FEROCIOUSLY-BLACK ALL CAPS!) it does that. A slightly-less in-one's-face version may be possib
