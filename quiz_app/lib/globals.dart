library globals;

import 'package:quiz_app/models/quiz_question.dart';
int? index;
var questions = [cLanguageQuizQuestions, pythonQuizQuestions, flutterQuizQuestions];

const flutterQuizQuestions = [
  QuizQuestion(      // quiz_question.dart
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

const pythonQuizQuestions = [
  QuizQuestion(
    'Who developed Python Programming Language?',
    [
      'Guido van Rossum',
      'Rasmus Lerdorf',
      'Wick van Rossum',
      'Niene Stom',
    ],
  ),
  QuizQuestion(
    'Which type of Programming does Python support?',
    [
      'all of the mentioned',
      'functional programming',
      'structured programming',
      'object-oriented programming',
    ],
  ),
  QuizQuestion(
    'Is Python case sensitive when dealing with identifiers?',
    [
      'yes',
      'machine dependent',
      'none of the mentioned',
      'no',
    ],
  ),
  QuizQuestion(
    'Is Python code compiled or interpreted?',
    [
      'Python code is both compiled and interpreted',
      'Python code is neither compiled nor interpreted',
      'Python code is only compiled',
      'Python code is only interpreted',
    ],
  ),
  QuizQuestion(
    'All keywords in Python are in _________',
    [
      'None of the mentioned',
      'UPPER CASE',
      'lower case',
      'Capitalized',
    ],
  ),
  QuizQuestion(
    'All keywords in Python are in _________',
    [
      'Indentation',
      'Key',
      'Brackets',
      'All of the mentioned',
    ],
  ),
];

const cLanguageQuizQuestions = [
  QuizQuestion(
    'Who is the father of C language?',
    [
      'Dennis Ritchie',
      'James Gosling',
      'Steve Jobs',
      'Rasmus Lerdorf',
    ],
  ),
  QuizQuestion(
    'What is short int in C programming?',
    [
      'Short is the qualifier and int is the basic data type',
      'Qualifier',
      'The basic data type of C',
      'All of the mentioned',
    ],
  ),
  QuizQuestion(
    'Which of the following declaration is not supported by C language?',
    [
      'String str;',
      'char *str',
      'float str = 3e2;',
      'Both “String str;” and “float str = 3e2;”',
    ],
  ),
  QuizQuestion(
    'Which keyword is used to prevent any changes in the variable within a C program?',
    [
      'const',
      'immutable',
      'mutable',
      'volatile',
    ],
  ),
  QuizQuestion(
    'Which of the following typecasting is accepted by C language?',
    [
      'Widening & Narrowing conversions',
      'Narrowing conversions',
      'Widening conversions',
      'None of the mentioned',
    ],
  ),
  QuizQuestion(
    'Which of the following is NOT possible with any 2 operators in C?',
    [
      'Same precedence, different associativity',
      'Different precedence, different associativity',
      'Different precedence, same associativity',
      'All of the mentioned',
    ],
  ),
];
