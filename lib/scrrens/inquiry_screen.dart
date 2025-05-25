import 'package:flutter/material.dart';
import 'package:eduwebsite/base_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  State<InquiryForm> createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final schoolCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneStudentCtrl = TextEditingController();
  final phoneParentCtrl = TextEditingController();

  String selectedStandard = '';
  bool isGujarati = false;
  bool isEnglish = false;

  final standards = [
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
  ];

  Future<void> sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final templateParams = {
      'student_name': nameCtrl.text,
      'school_name': schoolCtrl.text,
      'address': addressCtrl.text,
      'phone_student': phoneStudentCtrl.text,
      'email': emailCtrl.text,
      'phone_parent': phoneParentCtrl.text,
      'standard': selectedStandard,
      'medium_gujarati': isGujarati ? "Yes" : "No",
      'medium_english': isEnglish ? "Yes" : "No",
    };

    final body = json.encode({
      'service_id': 'service_6d51x7b', // Replace with your EmailJS service ID
      'template_id':
          'template_e18h6a2', // Replace with your EmailJS template ID
      'user_id':
          '7zyVKWVX44JyuihB_', // Replace with your EmailJS user/public key
      'template_params': templateParams,
    });

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent successfully!")),
        );
        _formKey.currentState?.reset();
        setState(() {
          selectedStandard = '';
          isGujarati = false;
          isEnglish = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send message: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error occurred: $e")));
    }
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool required = true,
    String? hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            children:
                required
                    ? const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                    ]
                    : [],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator:
              required
                  ? (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter $label'
                          : null
                  : null,
          decoration: InputDecoration(
            hintText: hint ?? label,
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take the first step toward a brighter future by booking a visit with us. Discover our teaching approach, meet our expert faculty, and see how we can help you achieve your academic goals.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                height: 1.5,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.indigoAccent,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking your visit...')),
                  );
                },
                child: Text(
                  'Book Visit',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStandardDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Select Your Standard",
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedStandard.isEmpty ? null : selectedStandard,
          hint: const Text("Select Std Here"),
          items:
              standards
                  .map((std) => DropdownMenuItem(value: std, child: Text(std)))
                  .toList(),
          onChanged: (val) => setState(() => selectedStandard = val!),
          validator:
              (val) =>
                  val == null || val.isEmpty ? 'Please select standard' : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMediumSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Your Medium",
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: isGujarati,
              onChanged: (val) => setState(() => isGujarati = val!),
            ),
            const Text("GUJARATI"),
            const SizedBox(width: 16),
            Checkbox(
              value: isEnglish,
              onChanged: (val) => setState(() => isEnglish = val!),
            ),
            const Text("ENGLISH"),
          ],
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (!isGujarati && !isEnglish) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please select at least one medium"),
                ),
              );
              return;
            }
            await sendEmail();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          "SEND MESSAGE",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Inquiry Form",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 600;
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField("Student Name", nameCtrl),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField("School Name", schoolCtrl),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField("Address", addressCtrl),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField(
                          "Phone No Student",
                          phoneStudentCtrl,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField(
                          "Email Address",
                          emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildField(
                          "Phone No Parent",
                          phoneParentCtrl,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildStandardDropdown(),
                      ),
                      SizedBox(
                        width:
                            isWide
                                ? constraints.maxWidth / 2 - 12
                                : constraints.maxWidth,
                        child: buildMediumSelection(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              buildSubmitButton(),
              _buildContactCard(context),
            ],
          ),
        ),
      ),
    );
  }
}
