console.log("Hello world!");
//Siempre ; al final
//Se usan siempre ()
// las comparaciones se hacen con ===
function eat (food) {
	console.log("Eating some " + food);
}

console.log(eat);

function check_food (food) {
	if (food === 'pizza') {
		eat('pizza');
	} else if (food === 'cookies'){
		eat('cookies');
	}	else {
		eat('Brussel Sprouts');
	}
}

check_food('spaggeti')

var numbers = '80:70:90:100';

function averageColon(numbers) {
	var result = numbers.split(":");
	var msg = result.reduce(function(num1, num2) {
		return parseInt(num1) + parseInt(num2);
	});
	console.log(result);
	return msg/result.length;

}

console.log(averageColon(numbers))

var declaredLater = "Now it's defined!";

console.log(declaredLater);

var i = 0;

for (i = 0; i < 150; i++) {
	console.log(i+1);
	console.log(String.fromCharCode(i+1));
}