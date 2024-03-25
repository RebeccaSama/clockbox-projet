import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/themes.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }
}

class _DatePicker extends State<DatePicker> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  final TextEditingController _dateRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24, ),
      child: Center(
        child: TextField(
          controller: _dateRangeController,
          decoration: InputDecoration(
            labelText: "StartDate  -  EndDate",
            labelStyle: const TextStyle(color: kGreyColor),
            prefixIcon: const Icon(Icons.calendar_today, color: kGreyColor),
            suffixIcon: const Icon(Icons.arrow_drop_down, color: kGreyColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          readOnly: true,
          onTap: () async {
            await _selectDateRange(context);
          },
        ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
    );

    if (picked != null &&
        picked != DateTimeRange(start: _startDate, end: _endDate)) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _dateRangeController.text = _formatDateRange(_startDate, _endDate);
      });
    }
  }

  String _formatDateRange(DateTime start, DateTime end) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String startDateString = formatter.format(start);
    final String endDateString = formatter.format(end);
    return '$startDateString ' ' - ' ' $endDateString';
  }
}
