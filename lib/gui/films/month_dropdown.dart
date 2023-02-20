import 'dart:io';

import 'package:flutter/material.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/util/strings.dart';

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({required this.month, required this.onChangeMonth, super.key});

  final Month month;
  final void Function(Month month) onChangeMonth;

  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  late Month month;

  @override
  void initState() {
    month = widget.month;
    super.initState();
  }

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
          if (value != null) {
            month = value;
            widget.onChangeMonth(month);
          }
        });
      },
      items: Month.values.map<DropdownMenuItem<Month>>((Month value) {
        return DropdownMenuItem<Month>(
          value: value,
          child: Text((Platform.localeName == Strings.enLocale) ? value.enName : value.ruName),
        );
      }).toList(),
    );
  }
}
