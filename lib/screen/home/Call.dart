import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  String phoneNumber = '';

  void addToPhoneNumber(String digit) {
    setState(() {
      phoneNumber += digit;
    });
  }

  void deleteFromPhoneNumber() {
    setState(() {
      if (phoneNumber.isNotEmpty) {
        phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
      }
    });
  }

  Future<void> makeCall() async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      // Handle error when unable to make the call directly
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to make the call.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                phoneNumber,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: [
                ...List.generate(9, (index) {
                  final digit = (index + 1).toString();
                  return InkWell(
                    onTap: () => addToPhoneNumber(digit),
                    child: Center(
                      child: Container(
                        width: 64,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            digit,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                InkWell(
                  onTap: deleteFromPhoneNumber,
                  child: Center(
                    child: Container(
                      width: 64,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.backspace,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => addToPhoneNumber('0'),
                  child: Center(
                    child: Container(
                      width: 64,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          '0',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: ElevatedButton(
              onPressed: makeCall,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.green,
              ),
              child: const Icon(
                Icons.call,
                size: 36,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
