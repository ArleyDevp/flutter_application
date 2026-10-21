import "package:flutter/material.dart";
import "package:tallerflutter/app_data.dart";
import "package:tallerflutter/widgets/auth_components.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _acceptedTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8FC),
      body: Stack(
        children: [
          Positioned(
            top: -95,
            right: -62,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFF7849), Color(0xFFF34C9D)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Positioned(
            top: 77,
            right: 26,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF9657F5), width: 4),
              ),
            ),
          ),
          Positioned(
            top: 112,
            right: 17,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC629),
              ),
            ),
          ),
          Positioned(
            bottom: -22,
            right: -26,
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB8E8FA),
              ),
            ),
          ),
          Positioned(
            bottom: -18,
            left: -20,
            child: Transform.rotate(
              angle: 0.35,
              child: Container(
                width: 43,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFD94BB9),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(17, 12, 17, 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 420),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(9),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(9),
                              onTap: () => Navigator.of(context).maybePop(),
                              child: SizedBox(
                                width: 34,
                                height: 34,
                                child: Icon(
                                  Icons.chevron_left,
                                  size: 22,
                                  color: Color(0xFF454555),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 13),
                        Text(
                          "Crea tu cuenta",
                          style: TextStyle(
                            color: Color(0xFF252536),
                            fontSize: 22,
                            height: 1.15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Completa tus datos para empezar",
                          style: TextStyle(
                            color: Color(0xFF9292A0),
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Nombre completo",
                          style: TextStyle(
                            color: Color(0xFF464656),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        AuthTextField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Escribe tu nombre completo";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "Juan Pérez",
                            hintStyle: TextStyle(
                              color: Color(0xFF9A9AA7),
                              fontSize: 10,
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 11,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFFE9E9EF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFF9A55F5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          "Correo electrónico",
                          style: TextStyle(
                            color: Color(0xFF464656),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        AuthTextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            final email = value?.trim() ?? "";
                            if (email.isEmpty) {
                              return "Escribe tu correo electrónico";
                            }
                            if (!RegExp(r"^[^@]+@[^@]+\.[^@]+$")
                                .hasMatch(email)) {
                              return "Escribe un correo válido";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "tu@correo.com",
                            hintStyle: TextStyle(
                              color: Color(0xFF9A9AA7),
                              fontSize: 10,
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 11,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFFE9E9EF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFF9A55F5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          "Contraseña",
                          style: TextStyle(
                            color: Color(0xFF464656),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        AuthTextField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          validator: (value) {
                            if ((value ?? "").length < 8) {
                              return "Usa al menos 8 caracteres";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "Mínimo 8 caracteres",
                            hintStyle: TextStyle(
                              color: Color(0xFF9A9AA7),
                              fontSize: 10,
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 11,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 17,
                                color: Color(0xFF9292A0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFFE9E9EF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFF9A55F5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          "Confirmar contraseña",
                          style: TextStyle(
                            color: Color(0xFF464656),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        AuthTextField(
                          controller: _confirmPasswordController,
                          obscureText: !_confirmPasswordVisible,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return "Las contraseñas no coinciden";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "Repite tu contraseña",
                            hintStyle: TextStyle(
                              color: Color(0xFF9A9AA7),
                              fontSize: 10,
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 11,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _confirmPasswordVisible =
                                      !_confirmPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _confirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 17,
                                color: Color(0xFF9292A0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFFE9E9EF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xFF9A55F5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 11),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: _acceptedTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptedTerms = value ?? false;
                                  });
                                },
                                activeColor: Color(0xFFD844C2),
                                side: BorderSide(color: Color(0xFFD0D0D9)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            SizedBox(width: 7),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text(
                                  "Acepto los Términos y condiciones y la Política de privacidad",
                                  style: TextStyle(
                                    color: Color(0xFF8C8C9B),
                                    fontSize: 9,
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        AuthPrimaryButton(
                          label: "Crear cuenta",
                          height: 43,
                          startColor: Color(0xFF843AF2),
                          endColor: Color(0xFFEA3E9E),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            if (!_acceptedTerms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Debes aceptar los términos para continuar.",
                                  ),
                                ),
                              );
                              return;
                            }
                            AppData.name = _nameController.text.trim();
                            AppData.email = _emailController.text.trim();
                            AppData.password = _passwordController.text;
                            Navigator.of(context).pushNamed("/home");
                          },
                        ),
                        SizedBox(height: 31),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "¿Ya tienes cuenta? ",
                              style: TextStyle(
                                color: Color(0xFF858594),
                                fontSize: 10,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).maybePop(),
                              child: Text(
                                "Inicia sesión",
                                style: TextStyle(
                                  color: Color(0xFF7648ED),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
