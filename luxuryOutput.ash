
boolean luxuryOutputMono(string toPrint) {
	toPrint = replace_string(toPrint, " ", "&nbsp;");
	print_html("<tt>" + toPrint + "</tt>");
	return true;
}

boolean luxuryOutputMono(string toPrint, string theColour) {
	toPrint = replace_string(toPrint, " ", "&nbsp;");	
	print_html("<font color=\"" + theColour + "\"><tt>" + toPrint + "</tt></font>");
	return true;
}

boolean renderPrint(string messageToDisplay, string messageColour) {
	string [int] renderedLines;
	string [int] characterSet;
	
	// Note escaped characters in the following string
	string asciiCharset = " !\\\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	
	characterSet[count(characterSet)] = "     █  █   █ █ █ █  ██ █ █  █    █   █ █    █                    █ ███  █  ███ ███ █ █ ███ ███ ███ ███ ███           █     █   ███ ███  █  ██   ██ ██  ███ ███  ██ █ █ ███  ██ █ █ █   █ █ ███  █  ██   █  ██   ██ ███ █ █ █ █ █ █ █ █ █ █ ███  ██ █   ██   █      █       █         █      ██     █    █   █  █    █                               █                           ██  █  ██    █ ";
	characterSet[count(characterSet)] = "     █  █   █ █ ███ ██    █ █    █   █   █  ███  █                █ █ █ ██    █   █ █ █ █   █     █ █ █ █ █  █   █   █  ███  █    █ █ █ █ █ █ █ █   █ █ █   █   █   █ █  █    █ █ █ █   ███ █ █ █ █ █ █ █ █ █ █ █    █  █ █ █ █ █ █ █ █ █ █   █  █  █    █  █ █      █   ██ ███ ███ ███ ███  █  ███ ███         █ █  █  ███ ██  ███ ███ ███ ███  ██ ███ █ █ █ █ █ █ █ █ █ █ ██   █   █   █  ███ ";
	characterSet[count(characterSet)] = "     █   █      █ █ ███  █   ██ █    █   █   █  ███     ███      █  █ █  █  ███  ██ ███ ███ ███   █ ███ ███         █         █  ██ █   ███ ██  █   █ █ ██  ██  █ █ ███  █    █ ██  █   ███ █ █ █ █ ██  █ █ ██   █   █  █ █ █ █ ███  █   █   █   █   █   █            █ █ █ █ █ █   █ █ ██  ███ █ █ █ █  █   █  ██   █  ███ █ █ █ █ █ █ █ █ █    █   █  █ █ █ █ ███  █  ███  █  ██   █   ██ █   ";
	characterSet[count(characterSet)] = "          █     ███  ██ █   █ █      █   █  ███  █   █          █   █ █  █  █     █   █   █ █ █   █ █ █   █  █   █   █  ███  █      ███ █ █ █ █ █   █ █ █   █   █ █ █ █  █  █ █ █ █ █   █ █ █ █ █ █ █    ██ █ █   █  █  █ █ █ █ ███ █ █  █  █    █    █  █              ███ ███ ███ ███ ███  █   ██ █ █  ██  █  █ █  ██ █ █ █ █ ███ ███ ███ █   ██   ██ ███  █  ███ █ █   █  ██  █   █   █      ";
	characterSet[count(characterSet)] = "     █    █     █ █ ██  █ █ ███       █ █    █      █        █  █   ███ ███ ███ ███   █ ███ ███   █ ███ ███     █     █     █    █      █ █ ██   ██ ██  ███ █    ██ █ █ ███  █  █ █ ███ █ █ █ █  █  █     █ █ █ ██   █  ███  █  █ █ █ █  █  ███  ██   █ ██      ███                         ██  ███         █                       █     █                             ███      ██  █  ██      ";
	int characterWidth = 4;
	
	int messageLength = length(messageToDisplay)-1;
	
	for currentCharacter from 0 to messageLength {
		string theCharacter = char_at(messageToDisplay, currentCharacter);
		int characterPosition = index_of( asciiCharset, theCharacter);
		if (characterPosition < 0) characterPosition = 0; // Replace unknown characters with space
		characterPosition *= characterWidth;		

		foreach fontString in characterSet {
			renderedLines[fontString] += substring(characterSet[fontString], characterPosition, characterPosition + characterWidth);
		}
	}
	
	print();
	foreach line in characterSet {
		luxuryOutputMono(renderedLines[line], messageColour);
	}
	print();
	
	return true;
}

boolean luxuryOutputBig(string theMessage, string messageColour) {
	renderPrint(theMessage, messageColour);
	logprint(theMessage);
	return true;
}

boolean luxuryOutputBig(string theMessage) {
	renderPrint(theMessage, "black");
	logprint(theMessage);
	return true;
}

// For compatibility with initial release
boolean fprint(string toPrint) {
	luxuryOutputMono(toPrint);
	return true;
	}

// For compatibility with initial release	
boolean fprint(string toPrint, string theColour) {
	luxuryOutputMono(toPrint, theColour);
	return true;
	}

// For compatibility with initial release
boolean bigprint(string toPrint) {
	luxuryOutputBig(toPrint);
	return true;
	}

// For compatibility with initial release	
boolean bigprint(string toPrint, string theColour) {
	luxuryOutputBig(toPrint, theColour);
	return true;
	}
		
void main() {
luxuryOutputBig("Luxury Output: Usage");

print();
luxuryOutputMono("> import luxuryoutput.ash");

print();
print("Printing a message in monospaced font.");
luxuryoutputMono("> luxuryOutputMono(string)");
luxuryOutputMono("Example.");

print();
print("Printing a message in monospaced font with colour.");
luxuryoutputMono("> luxuryOutputMono(string, colour)");
luxuryOutputMono("Example.", "red");

print();
print("Printing a message in a large, monospaced font.");
luxuryoutputMono("> luxuryOutputBig(string)");
luxuryOutputBig("Example.");

print();
print("Printing a message in a large, monospaced font with colour.");
luxuryoutputMono("> luxuryOutputBig(string, colour)");
luxuryOutputBig("Example.", "green");

}
