
import 'package:flutter/material.dart';

import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/widget/customswitchtile.dart.dart';
import 'package:homestyle/widget/customtextfield%20.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool sales = true;
  bool newArrivals = false;
  bool deliveryStatusChanges = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Settings',style: TextStyle(color:  Colormanager.primarycolor,fontSize: 16,fontWeight: FontWeight.w600),)),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // ✅ عنوان Personal Info مع زر تعديل بمحاذاة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colormanager.primarycolor,
                    onPressed: () {
                      // إذا بدك تفعل شي لما يضغط تعديل
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // حقل الاسم
              CustomTextFormField(
                label: 'Full Name',
                initialValue: name,
                onChanged: (val) => name = val,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter your name' : null, hintText: '',
              ),
              const SizedBox(height: 16),

              // حقل الايميل
              CustomTextFormField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                initialValue: email,
                onChanged: (val) => email = val,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Enter your email';
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                    return 'Enter valid email';
                  }
                  return null;
                }, hintText: '',
              ),
              const SizedBox(height: 16),

              // ✅ عنوان "Password" + زر تعديل قبل الحقل
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colormanager.primarycolor,
                    onPressed: () {
                      // تعديل الباسورد إذا بدك
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // ✅ حقل الباسورد (بس سميتو "Name" حسب طلبك!)
              CustomTextFormField(
                label: 'Name', // ← حسب طلبك يكون الاسم
                obscureText: true,
                onChanged: (val) => password = val,
                validator: (val) =>
                    val == null || val.length < 6 ? 'Min 6 characters' : null, hintText: '',
              ),

              const SizedBox(height: 24),
              const Text(
                'Notification',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

// ✅ Switch tiles
              CustomSwitchTile(
                title: 'Sales',
                value: sales,
                onChanged: (val) => setState(() => sales = val),
              ),
              CustomSwitchTile(
                title: 'New arrivals',
                value: newArrivals,
                onChanged: (val) => setState(() => newArrivals = val),
              ),
              CustomSwitchTile(
                title: 'Delivery status changes',
                value: deliveryStatusChanges,
                onChanged: (val) => setState(() => deliveryStatusChanges = val),
              ),
              const SizedBox(height: 24),

              const Text(
                'Help Center',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                title: Text('FAQ'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('Contact Us'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('Privacy & Terms'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}