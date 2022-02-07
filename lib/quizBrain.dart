import 'questions.dart';

class QuizBrain {
  int _queNo = 0;

  final List<Question> _queBank = [
    Question(q: 'The first country in the world to use postcards was the United States of America.', a: false),
    Question(q: 'Tea contains more caffeine than coffee and soda.', a: false),
    Question(q: 'Dogs have an appendix.', a: false),
    Question(q: 'Mice have more bones than humans.', a: true),
    Question(q: 'John F. Kennedy is one of the four U.S. President who is on Mount Rushmore.', a: false),
    Question(q: 'The first product with a bar code was chewing gum.',a: true),
    Question(q: 'The star is the most common symbol used in all national flags around the world.',a: true),
    Question(q: 'AB- is the rarest type of blood in humans.',a: true),
    Question(q: 'English is the most spoken language in the world.',a: false),
    Question(q: 'Lungs are the largest internal organ in the human body.',a: false)
  ];

  void nextQue() {
    if (_queNo < _queBank.length - 1) {
      _queNo++;
    }
  }

  String getQue() {
    return _queBank[_queNo].qq;
  }

  bool getAns() {
    return _queBank[_queNo].aa;
  }

  bool isEnd() {
    if (_queNo >= _queBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _queNo = 0;
  }
}
