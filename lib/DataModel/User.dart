class User {
 late int id;
 late String name;
 late String family;
 late String mobile;
 late String? email;
 late int type;
 late String? token;
 late bool active;
 late String? lastlogin;

  User(
      {
       required this.id,
       required this.name,
       required this.family,
       required this.mobile,
        this.email,
       required  this.type,
        this.token,
       required  this.active,
        this.lastlogin
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    active = json['active'] ==1;
    lastlogin = json['lastlogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['family'] = this.family;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type'] = this.type;
    data['token'] = this.token;
    data['active'] = this.active? 1 : 0;
    data['lastlogin'] = this.lastlogin;
    return data;
  }
  String get typeName => this.type ==1? "Admin": this.type==2?"Teacher":"Student";
}