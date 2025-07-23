import 'package:flutter/material.dart';
import 'package:homestyle/model/shipingadress_model.dart';
import 'package:homestyle/widget/adress_tile.dart';

class ShippingAdreessPage extends StatefulWidget {
  const ShippingAdreessPage({super.key});

  @override
  State<ShippingAdreessPage> createState() => _ShippingAdreessPageState();
}

class _ShippingAdreessPageState extends State<ShippingAdreessPage> {
 List<AddressModel> addresses = [
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France', isSelected: true),
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France'),
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France'),
  ];

  void selectAddress(int index) {
    setState(() {
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = AddressModel(
          name: addresses[i].name,
          address: addresses[i].address,
          isSelected: i == index,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping address"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return AddressCard(
            name: address.name,
            address: address.address,
            isSelected: address.isSelected,
            onChanged: () => selectAddress(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddShippingAddressPage');
          // Add address logic
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
