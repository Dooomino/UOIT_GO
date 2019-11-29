import 'model/Item.dart';

class Character{
  static double currentHealth;
  static double maxHealth;
  static double currentMotivation;
  static double maxMotivation;
  static int invSize;
  static String name;

  static List<Item> _inventory =[];
  static List<Item> _loadout = [];
  static List _activities = [];

static void loadCharacter({health,motivation,numInv, characterName}){
    maxHealth=health;
    maxMotivation=motivation;
    invSize=numInv;
    name=characterName;

    //sets characters current health and motivation to be full.
    currentHealth=maxHealth;
    currentMotivation=maxMotivation;
  }

  static void useConsumable(Item item){
    if(item.getHealthChange()+currentHealth>maxHealth){
      currentHealth=maxHealth;
    }else if(item.getHealthChange()+currentHealth<=0){
      currentHealth=0;
    }else{
      currentHealth+=item.getHealthChange();
    }
    if(item.getMotivationChange()+currentMotivation>maxMotivation){
      currentMotivation=maxMotivation;
    }else if(item.getMotivationChange()+currentMotivation<=0){
      currentMotivation=0;
    }else{
      currentMotivation+=item.getMotivationChange();
    }
  }

  static void removeItemInv(Item item){
    _inventory.remove(item);
  }

  //return character inventory
  static List<Item> getInv(){
    return _inventory;
  }

  static void setInv(List<Item> inv){
    _inventory=inv;
  }

  //return character loadout
  static List<Item> getLoad(){
    return _loadout;
  }
  
  //return character activities
  static List getAct(){
    return _activities;
  }

  //add item to inventory
  static void addItemInv(Item item){
    _inventory.add(item);
  }

  //add modifier to loadout
  static void addModLoad(Item modifier){
    _loadout.add(modifier);
  }

  //returns if inventory is full
  static bool isInvFull(){
    return _inventory.length==invSize;
  }

  //returns if loadout is full
  static bool isLoadFull(){
    return _loadout.length==4;
  }
}
