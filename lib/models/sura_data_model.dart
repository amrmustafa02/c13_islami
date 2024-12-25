class SuraDataModel {
  final int id; // Unique ID for the Sura (Sura number)
  final String nameEN; // English name
  final String nameAR; // Arabic name
  final int verses; // Number of verses

  SuraDataModel({
    required this.id,
    required this.nameEN,
    required this.nameAR,
    required this.verses,
  });

  @override
  String toString() {
    return 'Sura(id: $id, nameEN: $nameEN, nameAR: $nameAR, verses: $verses)';
  }
}
