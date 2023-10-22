import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/presentation/bloc/register/register_cubit.dart';
import 'package:gestion_tesis/src/presentation/widgets/shared/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView() ,),
      
     );
  }
}


class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
    child: Padding( 
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            
            _RegisterForm(),

             SizedBox(height: 20),

          ],
        ),
      ),
    ));
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState(); 
    
}

class _RegisterFormState extends State<_RegisterForm>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String username = '';
  // String email = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de usuario',
            //si la persona hace algun cambio en este input, automaticamente se verifica si es valido
            onChanged: (value) {registerCubit.usernameChanged(value);
            _formKey.currentState?.validate();},
            validator: (value){
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              return null;

            },
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: (value) {registerCubit.emailChanged(value);
            _formKey.currentState?.validate();},
            validator: (value){
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$' , );

              if(!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
              return null;
             
            },

          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) {registerCubit.passwordChanged(value);
            _formKey.currentState?.validate();},
            validator: (value){
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 8) return 'Minimo 8 caracteres';
              return null;
            },

          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
              onPressed: (){
                final isValid = _formKey.currentState!.validate();
                if (!isValid)return;

              }, 
              icon: const Icon(Icons.save), 
              label: const Text('Registrar')),
       
      ]),
    );
  }
  
}