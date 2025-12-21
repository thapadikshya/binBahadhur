// In your city_dropdown_field.dart file
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/theme/app_pallete.dart';

class CityDropdownField extends StatelessWidget {
  final String? selectedCity;
  final ValueChanged<String?> onChanged;
  final String? errorText;

  const CityDropdownField({
    Key? key,
    required this.selectedCity,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  static const List<String> cities = [
    'Kathmandu',
    'Pokhara',
    'Biratnagar',
    'Lalitpur',
    'Bharatpur',
    'Birgunj',
    'Butwal',
    'Dharan',
    'Nepalgunj',
    'Itahari',
    'Hetauda',
    'Damak',
    'Dhangadhi',
    'Tulsipur',
    'Bhimdutta',
    'Kalaiya',
    'Ghorahi',
    'Lekhnath',
    'Birendranagar',
    'Gulariya',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCity,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppPallete.blackColor, width: 2),
        ),
      ),
      hint: Text('Select your city'),
      items: [
        DropdownMenuItem(
          value: null,
          child: Text(
            'Select City',
            style: TextStyle(color: const Color.fromARGB(255, 118, 112, 112)),
          ),
        ),
        ...cities.map((city) {
          return DropdownMenuItem(value: city, child: Text(city));
        }).toList(),
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a city';
        }
        return null;
      },
    );
  }
}
