import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './button_gradient.dart';

import '../utils/generate_hex_color.dart';
import '../utils/get_computed_line_height.dart';

class AuthScreen extends StatefulWidget {
  final bool isLogin;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String error;

  final void Function({String email, String password, String username})
      onSubmit;

  const AuthScreen({
    this.isLogin = false,
    this.onSubmit,
    this.isLoading,
    this.isError,
    this.isSuccess,
    this.error,
  });

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
  };

  String get getAuthLabel {
    return widget.isLogin ? "Sign In" : "Sign Up";
  }

  void _onSubmit() {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }

    _formKey.currentState.save();

    widget.onSubmit(
      email: _authData['email'],
      password: _authData['password'],
      username: _authData['username'],
    );
  }

  @override
  void didUpdateWidget(covariant AuthScreen oldWidget) {
    if (widget.isError || (widget.isSuccess && !widget.isLogin)) {
      final message =
          widget.isError ? widget.error : "Account registered with success";

      Fluttertoast.showToast(
        msg: message,
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          margin: EdgeInsets.only(
            top: 18,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                generateHexColor("#23253A"),
              ],
              transform: GradientRotation(315),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    left: 62,
                    bottom: 8,
                  ),
                  child: Text(
                    getAuthLabel,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      height: getComputedLineHeight(30, 41),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 40,
                    bottom: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (!widget.isLogin)
                          AuthTextField(
                            label: 'Username',
                            inputType: TextInputType.name,
                            onSaved: (value) {
                              _authData['username'] = value;
                            },
                            validator: ValidationBuilder()
                                .minLength(3)
                                .maxLength(80)
                                .build(),
                          ),
                        AuthTextField(
                          label: 'Email',
                          inputType: TextInputType.emailAddress,
                          validator: ValidationBuilder().email().build(),
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),
                        AuthTextField(
                          label: 'Password',
                          obscureText: true,
                          inputType: TextInputType.text,
                          onSaved: (value) {
                            _authData['password'] = value;
                          },
                          validator: ValidationBuilder()
                              .minLength(6)
                              .maxLength(40)
                              .build(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 208,
                    child: ButtonGradient(
                      text: getAuthLabel,
                      onPress: widget.isLoading ? null : _onSubmit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthTextField extends StatefulWidget {
  final String label;
  final FormFieldValidator<String> validator;
  final TextInputType inputType;
  final bool obscureText;
  final FormFieldSetter<String> onSaved;

  const AuthTextField(
      {@required this.label,
      @required this.validator,
      @required this.inputType,
      this.obscureText = false,
      this.onSaved});

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  UnderlineInputBorder get _border {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(233, 234, 242, .1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        height: getComputedLineHeight(15, 18),
        decoration: TextDecoration.none,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 26,
          bottom: 26,
          left: 64,
          right: 29,
        ),
        filled: _focusNode.hasFocus,
        fillColor: Color.fromRGBO(233, 234, 242, .1),
        border: _border,
        disabledBorder: _border,
        enabledBorder: _border,
        errorBorder: _border,
        focusedBorder: _border,
        focusedErrorBorder: _border,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          fontSize: 15,
          height: getComputedLineHeight(15, 18),
        ),
      ),
    );
  }
}
