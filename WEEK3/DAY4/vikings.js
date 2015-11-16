var Viking = function(name, health, strength) {
    this.name = name;
    this.health = health;
    this.strength = strength;
};

Viking.prototype.attack = function(){
  return Math.floor(Math.random()*(this.strength));
}

var Saxon = function(){ 
  this.name = "Saxon";
  this.health = Math.floor(Math.random()*50); 
  this.strength = Math.floor(Math.random()*50);
}
  
Saxon.prototype.attack = function(){
  return Math.floor(Math.random()*(this.strength));
}

var Pit = function(viking1, viking2){
    this.viking1 = viking1;
    this.viking2 = viking2;

    var turns = 10;
    var figther1 = chooseFirstFighter()[0];
    var figther2 = chooseFirstFighter()[1];

    this.battle = function () {

      for (var i = 1; i <= turns; i++) {
        var attack1 = figther1.attack();
        var attack2 = figther2.attack();

        
        console.log("Figther " + figther1.name + " with " + figther1.health + " health points delivers a blow for " + attack1 + " damage.");
        console.log("Fighter " + figther2.name + " with " + figther2.health + " health points delivers a blow for " + attack2 + " damage.");

        figther2.health -= attack1;
        figther1.health -= attack2;

        console.log("Round " + i + " results")
        console.log("Figther:" + figther1.name + " has " + figther1.health + " HP");
        console.log("Figther:" + figther2.name + " has " + figther2.health + " HP");
        console.log("-----------------------------------------\r\n")

        if (figther1.health <= 1 || figther2.health <= 1)
        {
          i = turns;
        }  
      }

      if (figther1.health != figther2.health) {
        console.log("********************************************\r\n");
        console.log(chooseFirstFighter()[1].name + " is the new champions!");
        console.log(chooseFirstFighter()[1].name + " roars like a lion!!!");
        console.log("********************************************\r\n");
        return chooseFirstFighter()[1];
      }else{
        console.log("Draw!");
      }
    }

    function chooseFirstFighter(){

        if (viking1.health < viking2.health) {
            return [viking1,viking2];
        } else {
            return [viking2,viking1];
        }
    }
}

var viking1 = new Viking("Fer",1500,10);
var viking2 = new Viking("Ragnar",300,5);

var village = [];
var saxonArmy = 5;

for (var v = 0; v < saxonArmy; v++) {
  village.push(new Saxon());
}


var pit = new Pit(viking1,viking2);
var contender = pit.battle();

var pit2 = new Pit(contender, new Saxon());
contender = pit2.battle();


var i = 0;

do {
    var saxon = village[i];
    var pit_n = new Pit(contender, saxon);
    contender = pit_n.battle();
    i = i + 1;
  } while (contender instanceof Viking && i < village.length);

  console.log("Your have defeated " + i + " Saxons");

  if (contender instanceof Saxon) {
    console.log("THE SAXONS WIN THIS BATTLE\r\n OUR VIKINGS FLEE WITH SORROW");

  }
