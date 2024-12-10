class Failures {
  final String errmessage;

  Failures({required this.errmessage});
}

class serverFalires extends Failures {
  serverFalires({required super.errmessage});
  factory serverFalires.fromfirebase(String errmessage) =>
      serverFalires(errmessage: errmessage);
}
