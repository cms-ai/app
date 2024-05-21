import 'package:app/gen/export.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDropdownButton extends StatefulWidget {
  const CommonDropdownButton({
    super.key,
    this.hintText = "",
    this.customMargin,
    required this.items,
    this.onChange,
  });
  final String hintText;
  final EdgeInsetsGeometry? customMargin;
  final List<String> items;
  final Function(String?, int selectIndex)? onChange;

  @override
  State<CommonDropdownButton> createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: widget.customMargin,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[500],
                    fontFamily: FontFamily.dMSans,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            final int indexSelected =
                widget.items.indexWhere((element) => element == value);
            if (widget.onChange != null) widget.onChange!(value, indexSelected);
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: const Color(0xFF19173D).withOpacity(.5),
              ),
              // color: Colors.redAccent,
            ),
            elevation: 0,
          ),
          iconStyleData: IconStyleData(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 26,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey[500],
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              // color: Colors.redAccent,
            ),
            offset: const Offset(10, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          ),
        ),
      ),
    );
  }
}
