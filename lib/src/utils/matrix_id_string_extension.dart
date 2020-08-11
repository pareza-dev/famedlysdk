extension MatrixIdExtension on String {
  static const Set<String> VALID_SIGILS = {'@', '!', '#', '\$', '+'};

  static const int MAX_LENGTH = 255;

  bool get isValidMatrixId {
    if (isEmpty ?? true) return false;
    if (length > MAX_LENGTH) return false;
    if (!VALID_SIGILS.contains(substring(0, 1))) {
      return false;
    }
    // event IDs do not have to have a domain
    if (substring(0, 1) == '\$') {
      return true;
    }
    // all other matrix IDs have to have a domain
    final parts = substring(1).split(':');
    // the localpart can be an empty string, e.g. for aliases
    if (parts.length != 2 || parts[1].isEmpty) {
      return false;
    }
    return true;
  }

  String get sigil => isValidMatrixId ? substring(0, 1) : null;

  String get localpart =>
      isValidMatrixId ? substring(1).split(':').first : null;

  String get domain => isValidMatrixId ? substring(1).split(':')[1] : null;

  bool equals(String other) => toLowerCase() == other?.toLowerCase();
}
