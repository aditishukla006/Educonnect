import 'package:flutter/material.dart';
import 'package:eduwebsite/base_layout.dart';
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
    'Playgroup, Nursery, Jr.KG, Sr.KG',

    'Standard 1 to 10 & 11-12 (Com./Sci.)',

    'ABACUS (Whole Brain Development Program)',

    'Degree / Diploma Engineering ',

    'Engineering Projects',

    'Spoken English (With Certification)',

    ' IELTS Coaching',

    ' Computer Training (With Certification)',

    'AutoCAD, PCB Designing Courses (With Certification)',
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

  Widget buildStandardDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Select Your course",
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedStandard.isEmpty ? null : selectedStandard,
          hint: const Text("Select course Here"),
          items:
              standards
                  .map((std) => DropdownMenuItem(value: std, child: Text(std)))
                  .toList(),
          onChanged: (val) => setState(() => selectedStandard = val!),
          validator:
              (val) =>
                  val == null || val.isEmpty ? 'Please select course' : null,
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
            ],
          ),
        ),
      ),
    );
  }
}
