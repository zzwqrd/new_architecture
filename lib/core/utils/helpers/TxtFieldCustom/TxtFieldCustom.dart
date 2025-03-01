import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class TxtFieldCustomBase {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;

  const TxtFieldCustomBase({
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.labelText,
    required this.textInputType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.minLines,
    this.maxLines,
  });

  Widget build({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    bool? obscureText,
    bool? enabled,
    int? maxLength,
    int? minLines,
    int? maxLines,
    List<TextInputFormatter>? inputFormatters,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller ?? this.controller,
      validator: validator ?? this.validator,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ?? this.hintText,
        labelText: labelText ?? this.labelText,
        prefixIcon: prefixIcon ?? this.prefixIcon,
        suffixIcon: suffixIcon ?? this.suffixIcon,
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText ?? this.obscureText,
      enabled: enabled ?? this.enabled,
      maxLength: maxLength ?? this.maxLength,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      focusNode: focusNode ?? this.focusNode,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines ?? 1,
    );
  }
}

class TxtFieldCustomText extends TxtFieldCustomBase {
  TxtFieldCustomText()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.text);
}

class TxtFieldCustomPassword extends TxtFieldCustomBase {
  TxtFieldCustomPassword()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.visiblePassword,
            obscureText: true);
}

class TxtFieldCustomDatetime extends TxtFieldCustomBase {
  TxtFieldCustomDatetime()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.datetime);
}

class TxtFieldCustomEmailAddress extends TxtFieldCustomBase {
  TxtFieldCustomEmailAddress()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.emailAddress);
}

class TxtFieldCustomMultiline extends TxtFieldCustomBase {
  TxtFieldCustomMultiline()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.multiline,
            maxLines: null);
}

class TxtFieldCustomPhone extends TxtFieldCustomBase {
  TxtFieldCustomPhone()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.phone);
}

class TxtFieldCustomNumber extends TxtFieldCustomBase {
  TxtFieldCustomNumber()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.number);
}

class TxtFieldCustomUrl extends TxtFieldCustomBase {
  TxtFieldCustomUrl()
      : super(
            controller: TextEditingController(),
            textInputType: TextInputType.url);
}

class TxtFieldCustom {
  TxtFieldCustom._();

  static final text = TxtFieldCustomText();
  static final password = TxtFieldCustomPassword();
  static final datetime = TxtFieldCustomDatetime();
  static final emailAddress = TxtFieldCustomEmailAddress();
  static final multiline = TxtFieldCustomMultiline();
  static final phone = TxtFieldCustomPhone();
  static final number = TxtFieldCustomNumber();
  static final url = TxtFieldCustomUrl();
}

class ScaMyApp extends StatefulWidget {
  @override
  State<ScaMyApp> createState() => _ScaMyAppState();
}

class _ScaMyAppState extends State<ScaMyApp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _multilineController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _urlController.dispose();
    _dateController.dispose();
    _numberController.dispose();
    _multilineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TxtFieldCustom.text.build(
              controller: TextEditingController(text: _nameController.text),
              focusNode: FocusNode(),
              labelText: 'الاسم',
              hintText: 'أدخل اسمك',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال الاسم';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TxtFieldCustom.password.build(controller: _passwordController),
            // SizedBox(height: 16),
            TxtFieldCustom.emailAddress.build(controller: _emailController),
          ],
        ),
      ),
    );
  }
}
