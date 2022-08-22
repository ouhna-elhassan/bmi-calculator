class Data {
  final int id;
  final String genre;
  final double bmi;

  const Data({
    required this.id,
    required this.genre,
    required this.bmi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre': genre,
      'bmi': bmi,
    };
  }

  @override
  String toString() {
    return 'Data{id: $id, genre: $genre, bmi: $bmi}';
  }
}