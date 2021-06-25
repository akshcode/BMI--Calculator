class Calculator {
  final int weight;
  final int height;
  Calculator({required this.height, required this.weight});

  double _bmi = 0;

  double calculateBMI() {
    _bmi = weight / ((height * height) / 10000);
    return _bmi;
  }

  String getResult(_bmi) {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UNderweight';
    }
  }

  String getFeedback(_bmi) {
    if (_bmi >= 25) {
      return 'Focus on your health.Do Workout on regular basis and eat healthy!';
    } else if (_bmi > 18.5) {
      return 'Good Job, now maintain yourself like this!';
    } else {
      return 'Hit the gym. Eat more than you regular diet.';
    }
  }
}
