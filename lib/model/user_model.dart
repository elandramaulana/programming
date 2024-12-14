class UserModel {
  final String name;
  final String job;
  final String? id;
  final String? createdAt;

  UserModel({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'job' : job,
    };
  }
}