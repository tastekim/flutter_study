void main() {
  Dict dict = Dict();

  print('현재 사전 : ${dict.showAll()}');
  dict.add({'term': '테스트1', 'definition': '첫 챌린지'});
  dict.add({'term': '테스트2', 'definition': '첫 챌린지2'});
  dict.add({'term': '테스트3', 'definition': '첫 챌린지3'});

  Word? word = dict.get('테스트1');
  print('${word?.term} : ${word?.definition}');

  word = dict.get('테스트2');
  print('${word?.term} : ${word?.definition}');

  print(dict.showAll());
  print('현재 단어 갯수 : ${dict.count()}');

  dict.delete('테스트3');
  print('현재 단어 갯수 : ${dict.count()}');

  dict.update({'term': '테스트1', 'definition': '업데이트 챌린지'});
  word = dict.get('테스트1');
  print('${word?.term} : ${word?.definition}');

  dict.upsert({'term': '테스트2', 'definition': '업데이트 챌린지2'});
  dict.upsert({'term': '테스트4', 'definition': '업데이트 챌린지4'});

  print(dict.showAll());
  print('현재 단어 갯수 : ${dict.count()}');

  var bulkList = [
    {'term': '테스트벌크1', 'definition': '업데이트 벌크1'},
    {'term': '테스트벌크2', 'definition': '업데이트 벌크2'},
    {'term': '테스트벌크3', 'definition': '업데이트 벌크3'},
  ];
  dict.bulkAdd(bulkList);
  print(dict.showAll());
  print('현재 단어 갯수 : ${dict.count()}');

  var bulkDelList = [
    '테스트벌크1',
    '테스트벌크2',
  ];
  dict.bulkDelete(bulkDelList);
  print(dict.showAll());
  print('현재 단어 갯수 : ${dict.count()}');
}

typedef WordList = List<InsertWord>;
typedef WordType = Map<String, Word>;
typedef InsertWord = Map<String, String>;

class Word {
  final String term;
  final String definition;

  Word({
    required this.term,
    required this.definition,
  });
}

class Dict {
  WordType words = {};

  void add(InsertWord newWord) {
    if (!exists(newWord['term'])) {
      var word =
          Word(term: newWord['term']!, definition: newWord['definition']!);
      words[word.term] = word;
      print('단어 추가 성공');
    } else {
      print('이미 존재하는 단어입니다.');
    }
  }

  Word? get(String term) {
    return words[term];
  }

  void delete(String term) {
    if (exists(term)) {
      words.remove(term);
      print('삭제했습니다');
    } else {
      print('존재하지 않는 단어입니다');
    }
  }

  void update(InsertWord updateWord) {
    if (exists(updateWord['term'])) {
      Word word = Word(
          term: updateWord['term']!, definition: updateWord['definition']!);
      words[word.term] = word;
      print('단어 업데이트');
    } else {
      print('존재하지 않는 단어입니다');
    }
  }

  WordList? showAll() {
    WordList wordList = [];
    words.keys.forEach((term) {
      wordList.add({
        'term': words[term]!.term,
        'definition': words[term]!.definition,
      });
    });
    return wordList;
  }

  int count() {
    return words.keys.length;
  }

  void upsert(InsertWord newWord) {
    if (exists(newWord['term'])) {
      update(newWord);
      print('${newWord["term"]} 단어를 업데이트했습니다.');
    } else {
      add(newWord);
      print('${newWord["term"]} 단어를 새로 추가했습니다.');
    }
  }

  bool exists(String? term) {
    return words.containsKey(term);
  }

  void bulkAdd(List<InsertWord> addList) {
    for (var word in addList) {
      Word newWord = Word(term: word['term']!, definition: word['definition']!);
      words[newWord.term] = newWord;
    }
    print('여러 단어 추가');
  }

  void bulkDelete(List<String> terms) {
    for (var term in terms) {
      if (exists(term)) {
        words.remove(term);
        print('삭제했습니다');
      } else {
        print('$term 은 존재하지 않는 단어입니다.');
      }
    }
  }
}
