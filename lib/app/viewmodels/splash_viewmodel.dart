import 'dart:async';

class SplashViewModel {
	final void Function() onFinished;

	SplashViewModel({required this.onFinished});

	void startTimer({int seconds = 2}) {
		Timer(Duration(seconds: seconds), onFinished);
	}
}
