import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:login_page/widgets/app_backgroung.dart';
import 'package:login_page/widgets/button.dart'; // Ensure you import the MyButton widget
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  final bool isDarkMode;
  const ProfileScreen({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Color primary = const Color(0xffee444c);
  String birth = "Date of birth";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool _editable = true;
  XFile? _imageFile; // To hold the profile image

  final ImagePicker _picker = ImagePicker(); // For picking images

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: widget.isDarkMode,
            data: Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    // Profile Image Section
                    _buildProfileImageSection(),
                    const SizedBox(height: 24),
                    Align(
                      child: Text(
                        "Student ID: ",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 24),
                    textField("First Name", "Enter your first name",
                        firstNameController),
                    textField("Last Name", "Enter your last name",
                        lastNameController),
                    buildDateOfBirthField(),
                    textField(
                        "Address", "Enter your address", addressController),
                    _buildEditButton(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            backgroundImage:
                _imageFile != null ? FileImage(File(_imageFile!.path)) : null,
            child: _imageFile == null
                ? Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.grey[700],
                  )
                : null,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Change Profile Picture",
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take a Photo"),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Choose from Gallery"),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Widget textField(
      String title, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: primary,
            maxLines: 1,
            enabled: _editable,
            style: TextStyle(
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: widget.isDarkMode ? Colors.white70 : Colors.black54,
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateOfBirthField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of Birth",
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: _editable ? _selectBirthDate : null,
          child: Container(
            height: 60,
            width: screenWidth,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                birth,
                style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _selectBirthDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        if (value != null) {
          birth = DateFormat("MM/dd/yyyy").format(value);
        }
      });
    });
  }

  Widget _buildEditButton() {
    return MyButton(
      name: _editable ? 'Save' : 'Update Info',
      ontap: _editable ? _handleSave : _toggleEditMode,
    );
  }

  void _toggleEditMode() {
    setState(() {
      _editable = !_editable;
    });
  }

  void _handleSave() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String address = addressController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        birth.isEmpty ||
        address.isEmpty) {
      showSnackBar("All fields are required.");
    } else {
      _showSaveSuccessDialog();
    }
  }

  void _showSaveSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profile Saved Successfully'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Do not toggle the edit mode here
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
