import 'package:flutter/material.dart';
import 'package:atividadep1/app/viewmodels/login_viewmodel.dart';
import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewmodel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: 370,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      Icon(
                        Icons.lock_outline,
                        size: 64,
                        color: const Color.fromARGB(255, 0, 13, 190),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Bem-vindo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Faça login para continuar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 0, 13, 190),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: viewModel.emailValidator,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: viewModel.passwordController,
                        obscureText: viewModel.obscurePassword,
                        validator: viewModel.passwordValidator,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            onPressed: viewModel.togglePasswordVisibility,
                            icon: Icon(
                              viewModel.obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: viewModel.isLoading
                              ? null
                              : () {
                                  if (viewModel.formKey.currentState?.validate() ?? false) {
                                    final email = viewModel.emailController.text.trim();
                                    final senha = viewModel.passwordController.text;
                                    UserModel? usuario;
                                    try {
                                      usuario = usuariosMock.firstWhere(
                                        (u) => u.email == email && u.password == senha,
                                      );
                                    } catch (e) {
                                      usuario = null;
                                    }
                                    if (usuario != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Login realizado com sucesso!')),
                                      );
                                      // Aqui você pode navegar para a tela principal
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Usuário ou senha inválidos!')),
                                      );
                                    }
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 13, 190),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: viewModel.isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Não tem conta?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text("Cadastre-se"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
