class Employee {
  String name;
  String salary;
  String age;

  Employee({
    required this.name,
    required this.salary,
    required this.age,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      salary: json['salary'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'salary': salary,
      'age': age,
    };
  }
}
