import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'reset_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String otpCode = "";
  late String generatedOtp; // 🧩 Mã OTP ngẫu nhiên

  // 🔹 Hàm tạo mã OTP ngẫu nhiên 6 chữ số
  String _generateRandomOTP() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString(); // từ 100000 đến 999999
  }

  @override
  void initState() {
    super.initState();
    generatedOtp = _generateRandomOTP();

    // 🕓 Hiển thị thông báo chứa mã OTP (thời gian dài hơn)
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "📩 Verification code ($generatedOtp) sent to ${widget.email}",
          ),
          duration: const Duration(seconds: 12), // ⏳ Thời gian hiển thị lâu hơn
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar với nút Back
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Verify Code",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Logo + Tên ứng dụng
              Image.asset('assets/images/uth_logo.png', height: 100),
              const SizedBox(height: 8),
              const Text(
                "SmartTasks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Verify Code",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter the code we just sent you on your registered ${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // 🔹 Các ô nhập OTP
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.blue,
                cursorColor: Colors.blue,
                focusedBorderColor: Colors.blue,
                showFieldAsBox: true,
                fieldWidth: 45,
                borderRadius: BorderRadius.circular(8),
                onCodeChanged: (String code) {},
                onSubmit: (String code) {
                  otpCode = code;
                },
              ),

              const SizedBox(height: 28),

              // 🔹 Nút Verify
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (otpCode == generatedOtp) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(
                            email: widget.email,
                            code: generatedOtp,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid code! Please try again.'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
