import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/UserInfo/data/network.dart';

class phonetextfield extends StatefulWidget {
  phonetextfield({
    required this.textfieldname,
    super.key,
  });

  String? textfieldname;

  @override
  State<phonetextfield> createState() => _phonetextfieldState();
}

class _phonetextfieldState extends State<phonetextfield> {
  bool code = false;

  Country? pagecountry;

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // text field title
        Row(
          children: [
            size.width(30),
            Text(
              widget.textfieldname!,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.text,
                  fontFamily: 'Manrope'),
            ),
          ],
        ),
        size.height(10),
        // text field
        Container(
          width: 300.w,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child:
                // two fields for phone and code
                Row(
              children: [
                code == false
                    ? IconButton(
                        color: colors.primary,
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode:
                                true, // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              setState(() {
                                pagecountry = country;
                                code = true;
                              });
                            },
                          );
                        },
                        icon: Icon(Icons.flag, color: colors.text))
                    : GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode:
                                true, // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              setState(() {
                                pagecountry = country;
                              });
                            },
                          );
                        },
                        child: Text(
                          pagecountry!.flagEmoji.toString(),
                          style: textstyle.subtitle,
                        )),
                size.width(10),
                // phone field
                code == false
                    ? size.width(3)
                    : Container(
                        width: 80.w,
                        height: 50.h,
                        child: DropdownButton(
                          items: [
                            for (int i = 0; i <= 20; i++) ...{
                              DropdownMenuItem(
                                child: Text('code'),
                                value: 'code',
                              )
                            }
                          ],
                          onChanged: (value) {},
                        )),

                Container(
                  width: 150.w,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: colors.sub_background,
                      filled: true,
                      hintText: ' phone number',
                      hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: colors.subtext,
                          fontFamily: 'Manrope'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: colors.sub_background, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: colors.sub_background, width: 0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            // color: Color(0xfff3f4f6),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
