class Customexciption implements Exception {
  final String message;
  Customexciption({required this.message});
  @override
  String toString() {
    return message;
  }
}
