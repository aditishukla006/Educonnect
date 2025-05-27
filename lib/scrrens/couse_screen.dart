import 'package:flutter/material.dart';

class InlineCourseDropdown extends StatefulWidget {
  @override
  _InlineCourseDropdownState createState() => _InlineCourseDropdownState();
}

class _InlineCourseDropdownState extends State<InlineCourseDropdown> {
  bool _isExpanded = false;

  final List<String> courses = [
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
    '11th Com.',
    '11th Sci.',
    '12th Com.',
    '12th Sci.',
    'ABACUS',
    'IELTS',
    'Computer Class',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Courses',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              ...courses.map(
                (course) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(course, style: TextStyle(fontSize: 16)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
