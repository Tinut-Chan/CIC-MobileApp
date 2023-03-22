import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.controller,
    this.autoCorrect = false,
    this.buildCounter,
    this.onChanged,
    this.validator,
    this.enableSuggestions = false,
    this.enable = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters,
    this.keyboardAppearance,
    required this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.onSaved,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    required this.readOnly,
    this.initialValue,
    this.textDirection,
    this.border,
    this.isValidate = false,
    this.isRequird,
    this.labelText,
    this.maxLength,
  });

  final TextEditingController? controller;
  final bool autoCorrect;
  final InputCounterWidgetBuilder? buildCounter;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enableSuggestions;
  final bool enable;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final String? initialValue;
  final TextDirection? textDirection;
  final InputBorder? border;
  final bool? isValidate;
  final bool? isRequird;
  final String? labelText;
  final int? maxLength;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  final _locatTextEditingController = TextEditingController();

  void _initialTextField() {
    (widget.controller ?? _locatTextEditingController).text =
        widget.initialValue ?? '';
  }

  @override
  void initState() {
    _initialTextField();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
      autocorrect: widget.autoCorrect,
      buildCounter: widget.buildCounter, // Count remaining index in textfield
      validator: widget.validator,
      enableSuggestions: widget.enableSuggestions,
      enabled: widget.enable,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      keyboardAppearance: widget.keyboardAppearance,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      focusNode:
          widget.focusNode, // When click done auto go throw to next textfield
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      onEditingComplete: widget
          .onEditingComplete, // After click done, go ... on keyboard, it sumit to controller
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      textDirection: widget.textDirection,
      decoration: InputDecoration(
        border: widget.border,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        filled: true,
        alignLabelWithHint: true,
        errorBorder: errorOutlineBorder,
        fillColor:
            (widget.controller ?? _locatTextEditingController).text.isNotEmpty
                ? widget.readOnly == true
                    ? Colors.green
                    : Colors.grey
                : Colors.orange,
        enabledBorder: widget.isValidate!
            ? errorOutlineBorder
            : (widget.controller ?? _locatTextEditingController).text.isEmpty
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: widget.readOnly == true ? 0.5 : 1,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
        focusedBorder: widget.isValidate!
            ? errorOutlineBorder
            : (widget.controller ?? _locatTextEditingController).text.isEmpty
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: widget.readOnly == true ? 0.5 : 1,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
        label: widget.labelText == null
            ? null
            : Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    widget.isRequird != null && widget.isRequird!
                        ? Text(
                            '*',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                          )
                        : const SizedBox(),
                    const SizedBox(width: 5.0),
                    Text(widget.labelText ?? ''),
                  ],
                ),
              ),
        labelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xff828282),
            ),
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xff828282),
            ),
      ),
    );
  }

  OutlineInputBorder readOnlyOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.black.withOpacity(0.7),
      width: 1,
    ),
  );
  OutlineInputBorder errorOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.red.withOpacity(0.7),
      width: 1,
    ),
  );
  OutlineInputBorder smallOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.green.withOpacity(0.7),
      width: 1,
    ),
  );
  OutlineInputBorder normalOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.blue.withOpacity(0.7),
      width: 1,
    ),
  );
}
