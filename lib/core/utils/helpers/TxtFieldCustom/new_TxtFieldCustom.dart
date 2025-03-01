import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtFieldCustom {
  TxtFieldCustom._();
  static final text = _TxtFieldCustomText._();
  static final password = _TxtFieldCustomPassword._();
  static final datetime = _TxtFieldCustomDatetime._();
  static final emailAddress = _TxtFieldCustomEmailAddress._();
  static final multiline = _TxtFieldCustomMultiline._();
  static final phone = _TxtFieldCustomPhone._();
  static final number = _TxtFieldCustomNumber._();
  static final url = _TxtFieldCustomUrl._();
}

// Base class for all custom text fields
abstract class _BaseTextField {
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

  _BaseTextField({
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.textInputType = TextInputType.text,
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

  TextFormField build({
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

// Specific implementations for different types of text fields
class _TxtFieldCustomText extends _BaseTextField {
  _TxtFieldCustomText._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.text,
        );

  static _TxtFieldCustomText instance = _TxtFieldCustomText._();
}

class _TxtFieldCustomPassword extends _BaseTextField {
  _TxtFieldCustomPassword._()
      : super(
          controller: TextEditingController(),
          obscureText: true,
          textInputType: TextInputType.text,
        );

  static _TxtFieldCustomPassword instance = _TxtFieldCustomPassword._();
}

class _TxtFieldCustomDatetime extends _BaseTextField {
  _TxtFieldCustomDatetime._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.datetime,
        );

  static _TxtFieldCustomDatetime instance = _TxtFieldCustomDatetime._();
}

class _TxtFieldCustomEmailAddress extends _BaseTextField {
  _TxtFieldCustomEmailAddress._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email address';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        );

  static _TxtFieldCustomEmailAddress instance = _TxtFieldCustomEmailAddress._();
}

class _TxtFieldCustomMultiline extends _BaseTextField {
  _TxtFieldCustomMultiline._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.multiline,
          maxLines: null, // Allows unlimited lines
        );

  static _TxtFieldCustomMultiline instance = _TxtFieldCustomMultiline._();
}

class _TxtFieldCustomPhone extends _BaseTextField {
  _TxtFieldCustomPhone._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

  static _TxtFieldCustomPhone instance = _TxtFieldCustomPhone._();
}

class _TxtFieldCustomNumber extends _BaseTextField {
  _TxtFieldCustomNumber._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

  static _TxtFieldCustomNumber instance = _TxtFieldCustomNumber._();
}

class _TxtFieldCustomUrl extends _BaseTextField {
  _TxtFieldCustomUrl._()
      : super(
          controller: TextEditingController(),
          textInputType: TextInputType.url,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a URL';
            }
            if (!RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$')
                .hasMatch(value)) {
              return 'Please enter a valid URL';
            }
            return null;
          },
        );

  static _TxtFieldCustomUrl instance = _TxtFieldCustomUrl._();
}

class ScaMyAppA extends StatefulWidget {
  @override
  State<ScaMyAppA> createState() => _ScaMyAppAState();
}

class _ScaMyAppAState extends State<ScaMyAppA> {
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TxtFieldCustom.text.build(
                controller: _nameController,
              ),
              SizedBox(height: 16),
              TxtFieldCustom.password.build(controller: _passwordController),
              SizedBox(height: 16),
              TxtFieldCustom.emailAddress.build(controller: _emailController),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // يمكنك معالجة البيانات هنا
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم إرسال النموذج بنجاح')),
                      );
                    }
                  },
                  child: Text('إرسال'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
