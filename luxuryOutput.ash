boolean fprint(string toPrint) {
	toPrint = replace_string(toPrint, " ", "&nbsp;");
	print_html("<tt>" + toPrint + "</tt>");
	return true;
}

boolean fprint(string toPrint, string theColour) {
	toPrint = replace_string(toPrint, " ", "&nbsp;");
	print_html("<font color=\"" + theColour + "\"><tt>" + toPrint + "</tt></font>");
	return true;
}

boolean renderPrint(string messageToDisplay, string messageColour) {
	string [int] characterSet;
	characterSet[count(characterSet)] = " █  ██   ██ ██  ███ ███  ██ █ █ ███  ██ █ █ █   █ █ ███  █  ██   █  ██   ██ ███ █ █ █ █ █ █ █ █ █ █ ███ █ █     ";
	characterSet[count(characterSet)] = "█ █ █ █ █   █ █ █   █   █   █ █  █    █ █ █ █   ███ █ █ █ █ █ █ █ █ █ █ █    █  █ █ █ █ █ █ █ █ █ █   █  █      ";
	characterSet[count(characterSet)] = "███ ██  █   █ █ ██  ██  █ █ ███  █    █ ██  █   ███ █ █ █ █ ██  █ █ ██   █   █  █ █ █ █ ███  █   █   █  ███     ";
	characterSet[count(characterSet)] = "█ █ █ █ █   █ █ █   █   █ █ █ █  █  █ █ █ █ █   █ █ █ █ █ █ █    ██ █ █   █  █  █ █ █ █ ███ █ █  █  █    █      ";
	characterSet[count(characterSet)] = "█ █ ██   ██ ██  ███ █    ██ █ █ ███  █  █ █ ███ █ █ █ █  █  █     █ █ █ ██   █  ███  █  █ █ █ █  █  ███ █ █     ";

	messageToDisplay = to_upper_case(messageToDisplay);
	int messageLength = length(messageToDisplay)-1;

	string [int] renderedLines;

	foreach fontString in characterSet {

		for currentCharacterNumber from 0 to messageLength {
			string theCharacter = char_at(messageToDisplay, currentCharacterNumber);
			int theNumber = 0;
		
			switch ( theCharacter ) {
				case "A":
					theNumber = 65;
					break;
				case "B":
					theNumber = 66;
					break;
				case "C":
					theNumber = 67;
					break;
				case "D":
					theNumber = 68;
					break;
				case "E":
					theNumber = 69;
					break;
				case "F":
					theNumber = 70;
					break;
				case "G":
					theNumber = 71;
					break;
				case "H":
					theNumber = 72;
					break;
				case "I":
					theNumber = 73;
					break;
				case "J":
					theNumber = 74;
					break;
				case "K":
					theNumber = 75;
					break;
				case "L":
					theNumber = 76;
					break;
				case "M":
					theNumber = 77;
					break;
				case "N":
					theNumber = 78;
					break;
				case "O":
					theNumber = 79;
					break;
				case "P":
					theNumber = 80;
					break;
				case "Q":
					theNumber = 81;
					break;
				case "R":
					theNumber = 82;
					break;
				case "S":
					theNumber = 83;
					break;
				case "T":
					theNumber = 84;
					break;
				case "U":
					theNumber = 85;
					break;
				case "V":
					theNumber = 86;
					break;
				case "W":
					theNumber = 87;
					break;
				case "X":
					theNumber = 88;
					break;
				case "Y":
					theNumber = 89;
					break;
				case "Z":
					theNumber = 90;
					break;
				case "*":
					theNumber = 91;
					break;
				default:
					theNumber = 92; // Space
			}
		
			int whereToLook = (theNumber - 65) * 4;
			string theRightBit = substring(characterSet[fontString], whereToLook, whereToLook + 4);
		
			renderedLines[fontString] += theRightBit;
		}
	}
	
	print();
	foreach line in characterSet {
		fprint(renderedLines[line], messageColour);
	}
	print();
	
	return true;
}

boolean bigPrint(string theMessage, string messageColour) {
	renderPrint(theMessage, messageColour);
	return true;
}

boolean bigPrint(string theMessage) {
	renderPrint(theMessage, "black");
	return true;
}

void main() {
  bigprint("Usage");
  print("fprint (\"string\") prints the string in monospaced font.");
  print("fprint (\"string\", \"color\") prints the string in monospaced font with the named html color.");
  print("bigprint (\"string\") prints the string in a large, block-rendered ASCII-style font. Characters are currently limited to A-Z, space and '*'.");
  print("fprint (\"string\", \"color\") prints the string in a large, block-rendered ASCII-style font with the named html color.");
}
