import 'package:flutter/material.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
	const SplashPage({Key? key}) : super(key: key);

	@override
	State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
	late SplashViewModel _viewModel;

	@override
	void initState() {
		super.initState();
		_viewModel = SplashViewModel(onFinished: _goToLogin);
		_viewModel.startTimer(seconds: 2);
	}

	void _goToLogin() {
		Navigator.of(context).pushReplacementNamed('/login');
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				width: double.infinity,
				height: double.infinity,
				color: Colors.blueAccent,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Icon(Icons.flutter_dash, size: 80, color: Colors.white),
						SizedBox(height: 24),
						Text(
							'Bem-vindo ao App!',
							style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
						),
						SizedBox(height: 16),
						Text(
							'Carregando...',
							style: TextStyle(fontSize: 16, color: Colors.white70),
						),
					],
				),
			),
		);
	}
}
