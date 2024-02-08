class UserModel{
  int? id;
  String? name;
  String? email;
  String? body;

  UserModel({this.id,this.name,this.email,this.body});

    factory UserModel.fromJson(Map<String, dynamic> json) {  
    return UserModel(  
      id: json['id'],  
      name: json['name'],  
      email: json['email'],  
      body: json['body'],  
    );  
  }  
}