import "package:flutter/material.dart";
import "package:tallerflutter/app_data.dart";
import "package:tallerflutter/widgets/auth_components.dart";

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailWasSet = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_emailWasSet) {
      final email = ModalRoute.of(context)?.settings.arguments;
      if (email is String) {
        _emailController.text = email;
      }
      _emailWasSet = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8FC),
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -35,
            child: Container(
              width: 135,
              height: 155,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3AA5EE),
              ),
            ),
          ),
          Positioned(
            top: 85,
            right: 18,
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
            bottom: -23,
            left: -38,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB8D9FF),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: -20,
            child: Transform.rotate(
              angle: 0.35,
              child: Container(
                width: 43,
                height: 42,
                decoration: BoxDecoration(
                  color: Color(0xFFD94BB9),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -22,
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFE39A),
              ),
            ),
          ),
          SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13, top: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
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
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF368EF4),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(51, 228, 20, 20),
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            "¿Olvidaste tu\ncontraseña?",
                            style: TextStyle(
                              color: Color(0xFF252536),
                              fontSize: 20,
                              height: 1.15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Ingresa el correo con el que te registraste y te enviaremos un código de 4 dígitos.",
                            style: TextStyle(
                              color: Color(0xFF858594),
                              fontSize: 10,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 12),
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
                                return "Ingresa tu correo electrónico";
                              }
                              if (!RegExp(r"^[^@]+@[^@]+\.[^@]+$")
                                  .hasMatch(email)) {
                                return "Ingresa un correo válido";
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
                                borderSide: BorderSide(
                                  color: Color(0xFFE9E9EF),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                  color: Color(0xFF368EF4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 11),
                          AuthPrimaryButton(
                            label: "Enviar código",
                            height: 38,
                            radius: 8,
                            fontSize: 11,
                            startColor: Color(0xFF8539EA),
                            endColor: Color(0xFFEA399F),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AppData.email = _emailController.text.trim();
                                Navigator.of(context).pushNamed(
                                  "/verification",
                                  arguments: AppData.email,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿La recordaste? ",
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
