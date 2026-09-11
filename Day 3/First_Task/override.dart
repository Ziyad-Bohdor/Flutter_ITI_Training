
void main() {
  Cat cat = Cat();
  Dog dog = Dog();

  cat.sound();
  dog.sound();

}



class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Meow");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}