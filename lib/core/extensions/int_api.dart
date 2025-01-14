extension IntApi on int {
  String toAlphabet({bool isUppercase = true}) {
    if (this < 0 || this > 25) {
      throw ArgumentError("Index must be between 0 and 25.");
    }
    int asciiBase = isUppercase ? 65 : 97;
    return String.fromCharCode(asciiBase + this);
  }
}
