class KhataEntry {
  String tool;
  String area;
  String date;
  double price; // total work amount
  List<double> payments;

  KhataEntry({
    required this.tool,
    required this.area,
    required this.date,
    required this.price,
  }) : payments = [];

  double get totalPaid => payments.fold(0, (sum, p) => sum + p);

  double get remaining => price - totalPaid;
}

class KhataAccount {
  String name;
  List<KhataEntry> entries;

  KhataAccount({required this.name}) : entries = [];
}
