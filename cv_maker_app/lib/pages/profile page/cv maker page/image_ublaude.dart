// import 'dart:io';
// import 'package:cv_maker_app/service/supabase_services.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageUploadPage extends StatefulWidget {
//   const ImageUploadPage({super.key});

//   @override
//   _ImageUploadPageState createState() => _ImageUploadPageState();
// }

// class _ImageUploadPageState extends State<ImageUploadPage> {
//   File? _imageFile;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _uploadData() async {
//     if (_imageFile == null) {
//       return;
//     }

//     // Upload image to Supabase Storage
//     final imageUrl = await _uploadImageToStorage(_imageFile!);

//     // Insert CV data with image URL to Supabase database
//     // final success = await _insertCVData(imageUrl);
//     // if (success) {
//     //   // Data uploaded successfully, show success message or navigate to next screen
//     //   print('CV data uploaded successfully!');
//     // } else {
//     //   // Handle upload failure
//     //   print('Error uploading CV data.');
//     // }
//   }

//   Future<String> _uploadImageToStorage(File imageFile) async {
//     final client = Database().supabase;
//     final storage = client.storage.from('your-storage-bucket');

//     final response = await storage.upload(
//       'images/${DateTime.now().millisecondsSinceEpoch}.jpg',
//       imageFile.readAsBytes(),
//       metadata: {'contentType': 'image/jpeg'},
//     );

//     if (response.error != null) {
//       throw Exception('Error uploading image: ${response.error!.message}');
//     }

//     return response.data!.url;
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _imageFile != null
//               ? Image.file(_imageFile!)
//               : const Text('No image selected'),
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: const Text('Pick Image'),
//           ),
//           ElevatedButton(
//             onPressed: _uploadImage,
//             child: const Text('Upload Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }
