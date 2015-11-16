var fs = require('fs');

function floatToInt (value) {
  return value | 0;
}

function fileActions(err, file){ 
  if (err) {
      throw err;
  }

	var episodes = JSON.parse(file);

	var orderedEpisodes = episodes.sort(function(a, b){
  	return a-b
		});
  
  orderedEpisodes.forEach(function(episode) {
  	console.log("Title: " + episode.title + " #: " + episode.episode_number + "\r\n" + episode.description + "\r\n");
  	var starNumber = floatToInt(episode.rating)+1;
  	var starString = Array(starNumber).join("*");
  	console.log("Rating: " + episode.rating + " " + starString);
  });
}

fs.readFile("./GoT.json", 'utf8', fileActions);

