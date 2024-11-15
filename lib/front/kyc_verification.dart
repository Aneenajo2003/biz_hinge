
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../main.dart';

class KycVerificationPage extends StatefulWidget {
  @override
  _KycVerificationPageState createState() => _KycVerificationPageState();
}

class _KycVerificationPageState extends State<KycVerificationPage> {
  bool isAgreed = false;
  String? ownershipCertificate;
  String? gstCertificate;


  Future<void> pickFile(String certificateType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        if (certificateType == "ownership") {
          ownershipCertificate = result.files.single.path;
        } else if (certificateType == "gst") {
          gstCertificate = result.files.single.path;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}
        ),
        title: Text(
          "KYC Verification",
          style: TextStyle(fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "For completion of registration,\nplease upload ANY ONE of the following\ndocument",
              style: TextStyle(fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.info_outline, size: 20, color: Color(0xff677294)),),
                SizedBox(width: 8),
                Text(
                  "Why this is needed?",
                  style:
                  TextStyle(fontFamily: 'Poppins',
                    fontSize: 14,
                    color:  Color(0xff677294),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),

            GestureDetector(
              onTap: () => pickFile("ownership"),
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    ownershipCertificate != null
                        ? "Ownership Certificate Uploaded"
                        : "Upload Ownership Certificate",
                    style: TextStyle(fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),

            GestureDetector(
              onTap: () => pickFile("gst"),
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    gstCertificate != null
                        ? "GST Certificate Uploaded"
                        : "Upload GST Certificate",
                    style: TextStyle(fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),

            Row(
              children: [
                Checkbox(
                  value: isAgreed,
                  onChanged: (value) {
                    setState(() {
                      isAgreed = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
                Expanded(
                  child: Text(
                    "I agree with giving above documents",
                    style: TextStyle(fontFamily: 'Poppins',
                      fontSize: 14,
                      color:  Color(0xff677294),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),

            Center(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MyHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6EBC31).withOpacity(0.50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Skip",
                        style:TextStyle(fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff005511),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: isAgreed &&
                          (ownershipCertificate != null ||
                              gstCertificate != null)
                          ? () {

                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6EBC31),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
