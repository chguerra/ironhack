var Car = function(model, noise){
	this.model = model;
	this.noise = noise;
	this.numberOfWheels = 4;
}

Car.prototype.makeNoise = function() {
	console.log(this.noise);
}

var car_a = new Car("Bmw","Pssss Electric");
var car_b = new Car("Renault","Brrrooommmm!!!");

new Car("JMV","PRRROOOOMMM").makeNoise();

car_a.makeNoise();
car_b.makeNoise();


function slow(num1, num2, callback){
	var suma = num1 + num2;
	callback(suma,true);
}

function done(sum, is_ok){
	if (is_ok) {
	console.log(sum);
	}else {
	console.log("Corre");
	}
}

slow(7,2,done);