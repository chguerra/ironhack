
function sleep2(seconds, callback){
	setTimeout(callback, seconds * 1000);
}

sleep2(2, function(){
	console.log(5);
})
sleep2(3, function(){
	console.log(4);
})
sleep2(4, function(){
	console.log(3);
})
sleep2(5, function(){
	console.log(2);
})
sleep2(6, function(){
	console.log(1);
})
sleep2(7, function(){
	console.log("blast off!");
})
function imprime(numero){
	return function(){ console.log(numero);}
}
function sleep(seconds, callback) {
	for (var i = seconds; i > 0; i--) {
		setTimeout(imprime(i),(seconds - i)* 1000);
	}
	setTimeout(callback, seconds*1000);
}

sleep(10, imprime("FizzBuzz"));