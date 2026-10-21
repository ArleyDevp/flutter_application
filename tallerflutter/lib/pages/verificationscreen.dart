import "dart:async";

import "package:flutter/material.dart";
import "package:tallerflutter/app_data.dart";
import "package:tallerflutter/widgets/auth_components.dart";

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeControllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());
  int _secondsRemaining = 45;
  Timer? _timer;

  bool get _codeComplete =>
      _codeControllers.every((controller) => controller.text.isNotEmpty);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in _codeControllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 45;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 1) {
        timer.cancel();
        setState(() {
          _secondsRemaining = 0;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _updateCode(int index, String value) {
    setState(() {});
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    } else if (value.isNotEmpty) {
      _focusNodes[index].unfocus();
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
            right: -38,
            child: Container(
              width: 135,
              height: 155,
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
            top: 86,
            right: 18,
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
            bottom: -23,
            right: -26,
            child: Container(
              width: 78,
              height: 78,
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
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF653D),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(
                            Icons.verified_user_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        SizedBox(height: 13),
                        Text(
                          "Verifica tu correo",
                          style: TextStyle(
                            color: Color(0xFF252536),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Escribe el código de 4 dígitos que enviamos a",
                          style: TextStyle(
                            color: Color(0xFF858594),
                            fontSize: 9,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          AppData.email,
                          style: TextStyle(
                            color: Color(0xFF464656),
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 13),
                        Row(
                          children: List.generate(4, (index) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: index == 3 ? 0 : 8,
                                ),
                                child: CodeDigitInput(
                                  controller: _codeControllers[index],
                                  focusNode: _focusNodes[index],
                                  onChanged: (value) {
                                    _updateCode(index, value);
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "¿No te llegó? ",
                              style: TextStyle(
                                color: Color(0xFF858594),
                                fontSize: 8,
                              ),
                            ),
                            GestureDetector(
                              onTap: _secondsRemaining == 0
                                  ? () {
                                      _startTimer();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Se reenvió el código.",
                                              ),
                                            ),
                                          );
                                    }
                                  : null,
                              child: Text(
                                _secondsRemaining == 0
                                    ? "Reenviar código"
                                    : "Reenviar código en 00:${_secondsRemaining.toString().padLeft(2, "0")}",
                                style: TextStyle(
                                  color: _secondsRemaining == 0
                                      ? Color(0xFF7648ED)
                                      : Color(0xFF9A9AA7),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        AuthPrimaryButton(
                          label: "Siguiente",
                          height: 38,
                          radius: 8,
                          fontSize: 10,
                          startColor: Color(0xFF8539EA),
                          endColor: Color(0xFFEA399F),
                          disabled: !_codeComplete,
                          onPressed: _codeComplete
                              ? () {
                                  Navigator.of(context)
                                      .pushNamed("/new-contra");
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
