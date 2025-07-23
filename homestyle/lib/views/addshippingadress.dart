import 'package:flutter/material.dart';

class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({super.key});

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    cityController.dispose();
    districtController.dispose();
    super.dispose();
  }

  void saveAddress() {
    if (_formKey.currentState!.validate()) {
      // احفظ البيانات أو أرسلها للسيرفر أو لأي مكان آخر
      print("Saved address: ${addressController.text}");
      // يمكنك عرض Snackbar أو التنقل لصفحة ثانية
    }
  }

  Widget buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => value == null || value.isEmpty ? 'This field is required' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add shipping address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Full name", fullNameController),
              buildTextField("Address", addressController),
              buildTextField("Zipcode (Postal Code)", postalCodeController, keyboardType: TextInputType.number),
              buildTextField("Country", countryController),
              buildTextField("City", cityController),
              buildTextField("District", districtController),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: saveAddress,
                  child: const Text('Save address'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
