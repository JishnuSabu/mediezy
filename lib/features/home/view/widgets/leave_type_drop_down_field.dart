import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaveTypeDropdown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const LeaveTypeDropdown({super.key, this.onChanged});

  @override
  State<LeaveTypeDropdown> createState() => _LeaveTypeDropdownState();
}

class _LeaveTypeDropdownState extends State<LeaveTypeDropdown> {
  String? _selectedLeaveType;

  final List<String> _leaveTypes = ['Casual', 'Sick'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedLeaveType,
      hint: Text(
        'Select your Leave type',
        style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade400),
      ),
      icon: Icon(Icons.keyboard_arrow_down_rounded,
          color: Colors.grey.shade500, size: 22.w),
      style: TextStyle(fontSize: 13.sp, color: Colors.black87),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      items: _leaveTypes
          .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
          .toList(),
      onChanged: (value) {
        setState(() => _selectedLeaveType = value);
        widget.onChanged?.call(value);
      },
    );
  }
}
