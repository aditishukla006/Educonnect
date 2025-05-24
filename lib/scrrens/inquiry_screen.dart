import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InquiryForm extends StatefulWidget {
  @override
  _InquiryFormState createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  final _formKey = GlobalKey<FormState>();

  final studentNameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final addressController = TextEditingController();
  final studentPhoneController = TextEditingController();
  final parentPhoneController = TextEditingController();
  final emailController = TextEditingController();

  String selectedStd = '';
  String selectedMedium = 'GUJARATI';

  bool isLoading = false;

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    // Replace these with your actual EmailJS service/template/user IDs
    const serviceId = 'your_service_id';
    const templateId = 'your_template_id';
    const userId = 'your_public_key';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'student_name': studentNameController.text,
          'school_name': schoolNameController.text,
          'address': addressController.text,
          'student_phone': studentPhoneController.text,
          'parent_phone': parentPhoneController.text,
          'email': emailController.text,
          'standard': selectedStd,
          'medium': selectedMedium,
        },
      }),
    );

    setState(() => isLoading = false);

    if (response.statusCode == 200) {
      _formKey.currentState?.reset();
      setState(() {
        selectedStd = '';
        selectedMedium = 'GUJARATI';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inquiry submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send inquiry. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildTextField('Student Name *', studentNameController),
            _buildTextField('School Name *', schoolNameController),
            _buildTextField('Address *', addressController),
            _buildTextField(
              'Phone No Student *',
              studentPhoneController,
              keyboardType: TextInputType.phone,
            ),
            _buildTextField(
              'Email Address *',
              emailController,
              keyboardType: TextInputType.emailAddress,
              isEmail: true,
            ),
            _buildTextField(
              'Phone No Parent *',
              parentPhoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            Text('Select Your Standard *'),
            DropdownButtonFormField<String>(
              value: selectedStd.isEmpty ? null : selectedStd,
              hint: Text('Select Std Here'),
              items:
                  [
                        '1st',
                        '2nd',
                        '3rd',
                        '4th',
                        '5th',
                        '6th',
                        '7th',
                        '8th',
                        '9th',
                        '10th',
                        '11th',
                        '12th',
                      ]
                      .map(
                        (std) => DropdownMenuItem(value: std, child: Text(std)),
                      )
                      .toList(),
              onChanged: (val) => setState(() => selectedStd = val ?? ''),
              validator:
                  (val) =>
                      val == null || val.isEmpty
                          ? 'Please select a standard'
                          : null,
            ),
            SizedBox(height: 16),
            Text('Your Medium *'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('GUJARATI'),
                    value: 'GUJARATI',
                    groupValue: selectedMedium,
                    onChanged:
                        (val) =>
                            setState(() => selectedMedium = val ?? 'GUJARATI'),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('ENGLISH'),
                    value: 'ENGLISH',
                    groupValue: selectedMedium,
                    onChanged:
                        (val) =>
                            setState(() => selectedMedium = val ?? 'GUJARATI'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _sendEmail,
              child:
                  isLoading
                      ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                      : Text('Submit Inquiry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool isEmail = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }
          if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value.trim())) {
            return 'Enter a valid email';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
