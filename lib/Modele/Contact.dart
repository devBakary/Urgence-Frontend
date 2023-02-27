class Contact{
  final int id;
  final String nom;
  final String prenom;
  final String? email;
  final String? numero;
  final String? domicile;
  final String? lien;

  Contact({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.numero,
    required this.domicile,
    required this.lien
  });

  factory Contact.fromMap(Map contactMap){
    return Contact(
        id: contactMap['id'],
        nom: contactMap['nom'],
        prenom: contactMap['prenom'],
        email: contactMap['email'],
        numero: contactMap['numero'],
        domicile: contactMap['domicile'],
        lien: contactMap['lien']
    );
  }
}