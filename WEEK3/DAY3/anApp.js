var myApp = (function(){
	var visitors = 0;
	var my_public_object = {};

my_public_object.visit = function() {
    		return visitors++; 
}
 
my_public_object.reset = function() {
    		visitors = 0;  
}
my_public_object.say_visits = function() {
    		console.log(visitors);  
}
return my_public_object;
})();

module.export	