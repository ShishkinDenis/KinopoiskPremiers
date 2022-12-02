import 'package:flutter/material.dart';

// const List<String> list = <String>[
//   'Январь',
//   'Февраль',
//   'Март',
//   'Апрель',
//   'Май',
//   'Июнь',
//   'Июль',
//   'Август',
//   'Сентябрь',
//   'Октябрь',
//   'Ноябрь',
//   'Декабрь'
// ];

//TODO ENUM
const List<String> list = <String>[
  'JANUARY',
  'FEBRUARY',
  'MARCH',
  'APRIL',
  'MAY',
  'JUNE',
  'JULY',
  'AUGUST',
  'SEPTEMBER',
  'OCTOBER',
  'NOVEMBER',
  'DECEMBER'
];

class MonthDropdown extends StatefulWidget {
  final Function(String month) onChangeMonth;

  const MonthDropdown({required this.onChangeMonth, super.key});

  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          widget.onChangeMonth(value);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
