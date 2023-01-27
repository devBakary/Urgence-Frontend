class Users{
  final int id;
  final String username;
  final String email;
  final String adresse;
  final String numero;
  final String password;

  Users(
    this.id, this.username, this.email, this.adresse, this.numero, this.password
 );


  factory Users.fromMap(Map userMap){
    return Users(
        userMap['id'],
        userMap['username'],
        userMap['email'],
        userMap['adresse'],
        userMap['numero'],
        userMap['password']
    );
  }

}