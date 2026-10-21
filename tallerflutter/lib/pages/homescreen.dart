import "package:flutter/material.dart";
import "package:tallerflutter/app_data.dart";
import "package:tallerflutter/widgets/auth_components.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8FC),
      body: Stack(
        children: [
          Positioned(
            top: -95,
            right: -38,
            child: Container(
              width: 160,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFA843D5), Color(0xFFEF3F9D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 62,
            left: 30,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC629),
              ),
            ),
          ),
          Positioned(
            top: 154,
            left: -12,
            child: Container(
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFE950AD), width: 3),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: -54,
            child: Container(
              width: 116,
              height: 116,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB8D9FF),
              ),
            ),
          ),
          Positioned(
            bottom: 73,
            right: -12,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  color: Color(0xFFFFA51F),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF8539EA), Color(0xFFEA399F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33883DEB),
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "¡Bienvenido!",
                      style: TextStyle(
                        color: Color(0xFF252536),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0E8FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Color(0xFF8B45EF),
                            size: 11,
                          ),
                          SizedBox(width: 4),
                          Text(
                            AppData.email,
                            style: TextStyle(
                              color: Color(0xFF8044E6),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: AuthPrimaryButton(
                        label: "Cerrar sesión",
                        height: 38,
                        radius: 8,
                        fontSize: 11,
                        startColor: Color(0xFF8539EA),
                        endColor: Color(0xFFEA399F),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil("/", (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
