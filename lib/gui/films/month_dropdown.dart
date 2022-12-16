import 'package:flutter/material.dart';
import 'package:list_view/domain/enum/month.dart';

class MonthDropdown extends StatefulWidget {
  final Function(Month month) onChangeMonth;

  const MonthDropdown({required this.onChangeMonth, super.key});

  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  Month month = Month.january;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Month>(
      value: month,
      elevation: 16,
      underline: Container(
        height: 2,
      ),
      onChanged: (Month? value) {
        setState(() {
          month = value!;
          widget.onChangeMonth(value);
        });
      },
      items: Month.values.map<DropdownMenuItem<Month>>((Month value) {
        return DropdownMenuItem<Month>(
          value: value,
          child: Text(value.ruName),
        );
      }).toList(),
    );
  }
}
