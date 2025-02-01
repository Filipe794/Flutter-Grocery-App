import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/services/authservice.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Crie sua conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: CustomButton(
          onPressed: () async {
            if (_nomeController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Por favor, insira seu nome.')),
              );
              return;
            }
            if (_emailController.text.isEmpty ||
                !_emailController.text.contains('@')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Por favor, insira um e-mail válido.')),
              );
              return;
            }
            if (_senhaController.text.isEmpty ||
                _senhaController.text.length < 6) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('A senha precisa ter pelo menos 6 caracteres.')),
              );
              return;
            }

            setState(() {
              _isLoading = true;
            });

            String? erro = await _authService.authUser(
                email: _emailController.text,
                password: _senhaController.text,
                name: _nomeController.text,
                phone: _phoneController.text,
                context: context);

            setState(() {
              _isLoading = false;
            });

            if (erro != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(erro)),
              );
            } else {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                Provider.of<AppState>(context, listen: false).setUser(user);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao obter usuário.')),
                );
              }
            }
          },
          buttonText: _isLoading ? 'Cadastrando...' : "Cadastrar",
        ),
      ),
    );
  }
}
