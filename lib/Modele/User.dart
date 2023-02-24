class Users{
  final int id;
  final String username;
  final String? email;
  final String? adresse;
  final int numero;
  final String password;
  final String? img;

  Users(
    this.id, this.username, this.email, this.adresse, this.numero, this.password, this.img
 );


  factory Users.fromMap(Map userMap){
    return Users(
        userMap['id'],
        userMap['username'],
        userMap['email'],
        userMap['adresse'],
        userMap['numero'],
        userMap['password'],
        userMap['img']
    );
  }

}