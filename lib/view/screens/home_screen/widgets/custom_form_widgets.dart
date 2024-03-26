import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';

class CustomForm extends StatefulWidget {
  final String lable;
  final GlobalKey<FormState> formKey;

  const CustomForm({
    Key? key,
    required this.lable,
    required this.formKey,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: TextFormField(
          autofocus: true,
          controller: textEditingController,
          onChanged: (value) => WriteDataCubit.get(context).updateText(value),
          validator: (value) {
            // عايز اعرف اختار عربي ولا انجليزي
            return _vlaidator(value, WriteDataCubit.get(context).isArabic);
          },
          minLines: 1,
          maxLines: 2,
          cursorColor: ColorManger.white,
          style: const TextStyle(color: ColorManger.white),
          decoration: _getInputDecoration(),
        ));
  }

  String? _vlaidator(String? value, bool isArabic) {
//1- هل الكلمة دي فاضيه ولا لا
    if (value == null || value.trim().isEmpty) {
      return "This Field Has not be empty";
    }
    //2- همسك كل حرف واعمل عليه check
    for (var i = 0; i < value.length; i++) {
      //3- عايز اعرف اي هو نوع الحرف ده
      CharType charType = _getCharType(value.codeUnitAt(i));
      if (charType == CharType.notValid) {
        return "Char Number ${i + 1} Not Valid";
      }
      // يكون الحرف الي معايا عربي وهو مدخل انجليزي
      else if (charType == CharType.arabic && isArabic == false) {
        return "Char Number ${i + 1} is not english Char";
      } else if (charType == CharType.english && isArabic == true) {
        return "Char Number ${i + 1} is not arabic Char";
      }
    }
  }

  CharType _getCharType(int asciiCode) {
    //3- هنستخدم asciiCodeTaple اكيد مش هروح اعمل كل حرف حرف ده عربي وده انجليزي
//4- check CapetalCase Letter english
//5- check smole Letterenglish
    if ((asciiCode >= 65 && asciiCode <= 90) ||
        asciiCode >= 97 && asciiCode <= 122) {
      return CharType.english;
    }
//6- Arabic
    else if (asciiCode >= 1569 && asciiCode <= 1610) {
      return CharType.arabic;
    }
//-7 space letter
    else if (asciiCode == 32) {
      return CharType.space;
    }
    return CharType.notValid;
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      label: Text(
        widget.lable,
        style: const TextStyle(
          color: ColorManger.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: BorderSide(color: ColorManger.white, width: 2.w)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: BorderSide(color: ColorManger.white, width: 2.w)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: BorderSide(color: ColorManger.red, width: 2.w)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: BorderSide(color: ColorManger.red, width: 2.w)),
    );
  }
}

enum CharType { arabic, english, space, notValid }
