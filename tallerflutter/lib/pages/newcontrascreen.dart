import "package:flutter/material.dart";
import "package:tallerflutter/app_data.dart";
import "package:tallerflutter/widgets/auth_components.dart";

class NewContraScreen extends StatefulWidget {
  const NewContraScreen({super.key});

  @override
  State<NewContraScreen> createState() => _NewContraScreenState();
}

class _NewContraScreenState extends State<NewContraScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  bool get _hasMinimumLength => _passwordController.text.length >= 8;
  bool get _hasUppercase => RegExp(r"[A-Z]").hasMatch(_passwordController.text);
  bool get _hasNumber => RegExp(r"[0-9]").hasMatch(_passwordController.text);
  bool get _passwordsMatch =>
      _passwordController.text.isNotEmpty &&
      _passwordController.text == _confirmPasswordController.text;
  bool get _canSubmit =>
      _hasMinimumLength && _hasUppercase && _hasNumber && _passwordsMatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8FC),
      body: Stack(
        children: [
          Positioned(
            top: -94,
            right: -38,
            child: Container(
              width: 150,
              height: 155,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFA843D5), Color(0xFFEF3F9D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
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
            bottom: -23,
            left: -37,
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
            bottom: -19,
            right: -20,
            child: Transform.rotate(
              angle: -0.25,
              child: Container(
                width: 45,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xFFFFA51F),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(14, 12, 14, 0),
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
                    padding: EdgeInsets.fromLTRB(14, 12, 14, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE7F8EF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 11,
                                color: Color(0xFF39C779),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Código verificado",
                                style: TextStyle(
                                  color: Color(0xFF36B96E),
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFDD43B0),
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x33DD43B0),
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Crea una nueva\ncontraseña",
                          style: TextStyle(
                            color: Color(0xFF252536),
                            fontSize: 18,
                            height: 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Tu nueva contraseña debe ser diferente a las que usaste antes.",
                          style: TextStyle(
                            color: Color(0xFF858594),
                            fontSize: 9,
                            height: 1.35,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Nueva contraseña",
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
                          onChanged: (value) {
                            setState(() {});
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "••••••••",
                            hintStyle: TextStyle(
                              color: Color(0xFF858594),
                              fontSize: 11,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 16,
                                color: Color(0xFF9292A0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
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
                          onChanged: (value) {
                            setState(() {});
                          },
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF333342),
                          ),
                          decoration: InputDecoration(
                            hintText: "••••••••",
                            hintStyle: TextStyle(
                              color: Color(0xFF858594),
                              fontSize: 11,
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
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 16,
                                color: Color(0xFF9292A0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFFAFAFC),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
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
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              _hasMinimumLength
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              size: 10,
                              color: _hasMinimumLength
                                  ? Color(0xFF4CCB83)
                                  : Color(0xFFB0B0BA),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Mínimo 8 caracteres",
                              style: TextStyle(
                                color: Color(0xFF858594),
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(
                              _hasUppercase
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              size: 10,
                              color: _hasUppercase
                                  ? Color(0xFF4CCB83)
                                  : Color(0xFFB0B0BA),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Al menos una mayúscula",
                              style: TextStyle(
                                color: Color(0xFF858594),
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(
                              _hasNumber
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              size: 10,
                              color: _hasNumber
                                  ? Color(0xFF4CCB83)
                                  : Color(0xFFB0B0BA),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Al menos un número",
                              style: TextStyle(
                                color: Color(0xFF858594),
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        AuthPrimaryButton(
                          label: "Restablecer contraseña",
                          height: 38,
                          radius: 8,
                          fontSize: 10,
                          startColor: Color(0xFF8539EA),
                          endColor: Color(0xFFEA399F),
                          disabled: !_canSubmit,
                          onPressed: _canSubmit
                              ? () {
                                  AppData.password = _passwordController.text;
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/",
                                    (route) => false,
                                    arguments: {
                                      "message":
                                          "Contraseña restablecida con éxito.",
                                    },
                                  );
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
