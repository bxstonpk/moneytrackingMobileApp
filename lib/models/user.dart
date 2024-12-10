// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

class User {
  String? message;
  int? userId;
  String? userFullName;
  String? userBirthDate;
  String? userName;
  String? userImage;
  String? userPassword;

  User(
      {this.message,
      this.userId,
      this.userFullName,
      this.userBirthDate,
      this.userName,
      this.userImage,
      this.userPassword});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userFullName = json['userFullName'];
    userBirthDate = json['userBirthDate'];
    userName = json['userName'];
    userImage = json['userImage'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['userFullName'] = this.userFullName;
    data['userBirthDate'] = this.userBirthDate;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['userPassword'] = this.userPassword;
    return data;
  }
}
