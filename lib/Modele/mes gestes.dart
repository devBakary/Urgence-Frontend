class Geste{
  final int id;
  final String nom;
  final String description;
  final String img1;
  final String lien;

  Geste(
      this.id, this.nom, this.description, this.img1, this.lien,
      );


  factory Geste.fromMap(Map gesteMap){
    return Geste(
        gesteMap['id'],
        gesteMap['nom'],
        gesteMap['description'],
        gesteMap['img1'],
        gesteMap['lien']
    );
  }

}