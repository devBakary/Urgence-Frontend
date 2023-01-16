class Contact{
  final int id;
  final String nom;
  final String prenom;
  final String? email;
  final String? numero;
  final String? adresse;

  Contact({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.numero,
    required this.adresse
  });

  factory Contact.fromMap(Map contactMap){
    return Contact(
        id: contactMap['id'],
        nom: contactMap['nom'],
        prenom: contactMap['prenom'],
        email: contactMap['eamil'],
        numero: contactMap['numero'],
        adresse: contactMap['adresse']
    );
  }
}