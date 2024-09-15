import 'package:app/OnBoarding/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:country_picker/country_picker.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _country;
  DateTime? _dob;
  File? _image;
  bool _isFormValid = false;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.orange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true
          ),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioLockEnabled: true,
          )
      );

      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path);
        });
      }
    }
  }

  void _updateFormValidity() {
    setState(() {
      // Image is now optional, so no need to check _image for form validity
      _isFormValid = _name != null && _email != null && _dob != null && _country != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('User Information', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _updateFormValidity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please enter your details below',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.orange[100],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(Icons.add_a_photo, size: 40, color: Colors.orange)
                      : null,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _image == null ? 'Tap to upload a profile picture (optional)' : 'Tap to edit profile picture',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _name = value,
                validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _email = value,
                validator: (value) => !EmailValidator.validate(value!)
                    ? 'Please enter a valid email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _dob = date;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  text: _dob != null ? "${_dob!.toLocal()}".split(' ')[0] : "",
                ),
                validator: (value) => value!.isEmpty ? 'Please select your date of birth' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                readOnly: true,
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      setState(() {
                        _country = country.name;
                      });
                    },
                  );
                },
                controller: TextEditingController(text: _country ?? ''),
                validator: (value) => value!.isEmpty ? 'Please select your country' : null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: Text('Continue'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.orange,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: _isFormValid
                ? () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Signuppage()),
                );
              }
            }
                : null,
          ),
        ),
      ),
    );
  }
}
