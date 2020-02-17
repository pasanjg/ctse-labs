class Person {
  String firstName;
  String lastName;
  int _pAge;
  double pSalary;

  Person.named(this.firstName, this.lastName, this.pSalary);

  void setPAge(int pAge) {
    this._pAge = pAge;
  }

  int getPAge() {
    return this._pAge;
  }

  String getFullName() => "$firstName $lastName";
}

void main() {
  Person person1 = Person.named("Bruce", "Wayne", 175000);
  person1.setPAge(25);

  Person person2 = Person.named("Elon", "Musk", 150000);
  person2.setPAge(22);

  print(person1.getFullName());
  print(person1.getPAge());

  print(person2.getFullName());
  print(person2.getPAge());

  var mapLiteral = [
    {0: "Bruce"},
    {1: "Elon"},
  ];

  var userMap = new Map();
  userMap[0] = "John";
  userMap[1] = "Ann";

  print(userMap.containsKey(0));
  userMap[1] = "Mike";

  userMap.forEach((key, value) => print("Key: ${key}, Value: ${value}"));
}
