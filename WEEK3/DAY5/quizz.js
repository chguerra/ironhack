var prompt = require('prompt');

var Question = function(id, question, answer) {
	this.question_id = id;
	this.question = question;
	this.answer= answer;
}

Question.prototype.checkAnswer = function(userAnswer) {
	if (userAnswer == this.answer) {
		return	true;
	} else {
		return false;
	}
}

var pregunta = new Question(1,"Como te llamas?","Charlie");

console.log(pregunta.question)

 prompt.start();

 prompt.get(['answer'], function (err, result) {
    var result = pregunta.checkAnswer(result.answer);
    console.log(result)
  });

