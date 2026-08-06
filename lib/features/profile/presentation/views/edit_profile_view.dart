import '../cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class EditProfileView extends StatefulWidget {

  final String name;

  const EditProfileView({
    super.key,
    required this.name,
  });


  @override
  State<EditProfileView> createState()=>_EditProfileViewState();

}


class _EditProfileViewState extends State<EditProfileView>{

  late TextEditingController controller;


  @override
  void initState(){
    super.initState();

    controller =
    TextEditingController(text: widget.name);
  }


  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children:[


            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),


            const SizedBox(height:30),

ElevatedButton(
  onPressed: () async {

    await context.read<ProfileCubit>().updateProfile(
      name: controller.text.trim(),
    );

    if (context.mounted) {
      context.read<ProfileCubit>().getProfile();

      Navigator.pop(context);
    }

  },


              child: const Text(
                "Save",
              ),

            )

          ],
        ),
      ),
    );
  }
}