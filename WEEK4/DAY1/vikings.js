var helpers = {};
helpers.setRandom = function(min, max) {
  return Math.floor(Math.random() * max) + min;
}
​
function Viking(name, health, strength){
  this.name = name || "Viking"+helpers.setRandom(0,10000);
  this.health = health || helpers.setRandom(20,30);
  this.strength = strength || helpers.setRandom(6,8);
  this.block = helpers.setRandom(6,10);
  this.dodge = helpers.setRandom(6,8);
}
​
Viking.prototype.hit = function(enemy){
  var hitDamage = helpers.setRandom(Math.floor(this.strength/2), this.strength);
  if(this.weapon){
    hitDamage += this.weapon.attackBonus;
  }
  
  enemy.receiveDamage(hitDamage);
}
​
Viking.prototype.receiveDamage = function(damage){
  var blockBonus = this.weapon ? this.weapon.blockBonus : 0;
  var block = (this.block + blockBonus) > helpers.setRandom(1,100);
  var dodge = this.dodge > helpers.setRandom(1,100);
  if(!block && !dodge){
    this.health -= damage;
  }
}
​
function Saxon(){
  this.health = helpers.setRandom(8,12);
  this.strength = helpers.setRandom(2,3);
  this.block = helpers.setRandom(1,3);
  this.dodge = helpers.setRandom(0,5);
}
​
Saxon.prototype = Viking.prototype;
​
function Pit(viking1, viking2, turns){
  this.viking1 = viking1;
  this.viking2 = viking2;
  this.turns = turns;
}
​
Pit.prototype.fight = function(){
  var minHealth = 7;
  while(this.turns > 0 && this.viking1.health > minHealth && this.viking2.health > minHealth){
    this.viking1.hit(this.viking2);
    this.viking2.hit(this.viking1);
    this.turns--;
  }
​
  this.winner = this.viking1.health > this.viking2.health ? this.viking1 : this.viking2;
}
​
Pit.prototype.showWinner = function(){
  if(this.winner){
    console.log("And the winner is: "+this.winner.name);
  }
}
​
function War(vikingArmy, saxonArmy, turns){
  this.vikingArmy = vikingArmy;
  this.saxonArmy = saxonArmy;
  this.turns = turns;
}
​
War.prototype.killThemAll = function(){
  var viking, saxon, i = 0;
  var self = this;
  var armiesAlive = true;
  while(i<this.turns && armiesAlive){
      this.vikingArmy.forEach(function(viking){
        saxon = self.saxonArmy[helpers.setRandom(0, self.saxonArmy.length - 1)];
        viking.hit(saxon);
      });
​
      this.saxonArmy.forEach(function(saxon){
        viking = self.vikingArmy[helpers.setRandom(0, self.vikingArmy.length - 1)];
        saxon.hit(viking);
      });
      
      this.saxonArmy = this.saxonArmy.filter(function(saxon){
        return saxon.health > 0;
      })
      this.vikingArmy = this.vikingArmy.filter(function(viking){
        return viking.health > 0;
      })
      armiesAlive = this.vikingArmy.length > 0 && this.saxonArmy.length > 0;
      i++;
  }
  this.winner = this.vikingArmy.length > this.saxonArmy.length ? "Vikings" : "Saxons";
  this.turns = i;
}
​
War.prototype.showWinner = function(){
  console.log("The winner is: "+this.winner);
  console.log("Vikings: "+this.vikingArmy.length);
  console.log("Saxons: "+this.saxonArmy.length);
  console.log("Turn: "+this.turns);
}
​
function Weapon(name, attackBonus, blockBonus){
  this.name = name;
  this.attackBonus = attackBonus;
  this.blockBonus = blockBonus;
}
​
saxonWeapons = [new Weapon('Staff',1,0),new Weapon("Hammer", 2, 1), new Weapon("Wood Shield",0,2)]
vikingWeapons = [new Weapon('Combat Axe', 5, 2), new Weapon("Mace", 5, 0), new Weapon("Iron Shield", 1, 5)]
​
function createArmy(UnitType, number, weapons){
  var army=[], unit;
  for(var i = 0; i < number; i++){
    unit = new UnitType();
    unit.weapon = weapons[helpers.setRandom(0,weapons.length - 1)]
    army.push(unit);
  }
  return army;
}
​
var vikingArmy = createArmy(Viking, 30, vikingWeapons);
var saxonArmy = createArmy(Saxon, 90, saxonWeapons);
​
var war = new War(vikingArmy, saxonArmy,10);
war.killThemAll();
war.showWinner();
​
// var v1 = new Viking("Ragnar", helpers.setRandom(20,30),helpers.setRandom(4,6))
// var v2 = new Viking("Lagertha", helpers.setRandom(18,25),helpers.setRandom(4,5))
// var pit = new Pit(v1, v2, 5);
​
// pit.fight();
// pit.showWinner();