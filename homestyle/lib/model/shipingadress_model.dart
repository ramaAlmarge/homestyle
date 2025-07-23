class AddressModel {
  final String name;
  final String address;
  final bool isSelected;

  AddressModel({
    required this.name,
    required this.address,
    this.isSelected = false,
  });
}
