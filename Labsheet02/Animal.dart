abstract class Animal {
  void eat() {
    print("I am eating...");
  }
}

mixin Pet {
  void vaccine() {
    print("The first vaccine is given");
  }
}

class Dog extends Animal with Pet {}

void main() {
  Dog dog = new Dog();
  dog.eat();
  dog.vaccine();
}
