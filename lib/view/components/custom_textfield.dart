import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/listners_utils.dart';

class CoustomTextfield extends StatelessWidget {
  String labelText;
  String placeholder;
  bool isPasswordTextField;
  double width;
  late TextEditingController controller;
  FocusNode FocusNodeNames;
  var changeFocusNode;
  IconData iconName;
  var maxline;

  CoustomTextfield({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.isPasswordTextField,
    required this.width,
    required this.controller,
    required this.maxline,
    required this.FocusNodeNames,
    required this.changeFocusNode,
    required this.iconName,
  });

  // bool _isObscure = true;

  ValueNotifier<bool> _isObscure = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print("built method ran");
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
      child: ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            width: width,
            child: TextFormField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(changeFocusNode);
                },
                autocorrect: true,
                maxLines: maxline,
                obscureText: _isObscure.value,
                validator: (value) {},
                controller: controller,
                textInputAction: TextInputAction.next,
                focusNode: FocusNodeNames,
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    iconName,
                    color: TheamColors.primaryColor,
                  ),
                  suffixIcon: Visibility(
                    visible: isPasswordTextField,
                    child: IconButton(
                      icon: Icon(
                        color: Colors.deepPurpleAccent,
                        _isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        _isObscure.value = !_isObscure.value;
                      },
                    ),
                  ),
                  hintText: placeholder,
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: TheamColors.HtexrtColor1, width: 1),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: TheamColors.primaryColor, width: 2),
                  ),
                )),
          );
        },
      ),
    );
  }
}
