function CaesarCipher(message, shift){
	var letters = message.split("")
	var cipherShift = shift;
	console.log(letters)
	var cipheredMsg = [];
	var tempMsg = []; 
	letters.map(function(letter){
		if (letter >= "A" && letter <= "Z"){
			if(((letter.charCodeAt(0))+cipherShift) < 65) {cipheredMsg.push((letter.charCodeAt(0))+cipherShift+26); }
			if(((letter.charCodeAt(0))+cipherShift) > 90) {cipheredMsg.push((letter.charCodeAt(0))+cipherShift-26); }
			 } else {cipheredMsg.push((letter.charCodeAt(0))+cipherShift);}
								
		if (letter >= "a" && letter <= "z"){ 
			if(((letter.charCodeAt(0))+cipherShift) < 97) {cipheredMsg.push((letter.charCodeAt(0))+cipherShift+26); }
			if(((letter.charCodeAt(0))+cipherShift) > 123) {cipheredMsg.push((letter.charCodeAt(0))+cipherShift-26); }
			} else {cipheredMsg.push((letter.charCodeAt(0))+cipherShift);}
								
		if (letter < "A" || letter > "z") {
				cipheredMsg.push((letter.charCodeAt(0));	
						}

								});

	cipheredMsg.map(function(letter){
	tempMsg.push(String.fromCharCode(letter));
		});
	console.log(tempMsg);
	console.log(cipheredMsg);
}

CaesarCipher("escroto??",-3)
