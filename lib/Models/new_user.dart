class NewUser {
  String? userId;
  String? firstName;
  String? email;
  String? lastName;
  String? password;


  NewUser({
     this.userId,
     this.firstName,
     this.email,
     this.lastName,
     this.password,



  });

  // now create converter

  factory NewUser.fromJson(Map<String,dynamic> responseData){
    return NewUser(
      userId: responseData['userId'],
      firstName: responseData['firstName'],
      email : responseData['email'],
      lastName: responseData['lastName'],
      password: responseData['password'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "firstName": firstName,
      "email": email,
      "lastName": lastName,
      "password": password,

    };
  }
}