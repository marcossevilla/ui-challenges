class Chat {
  final String time;
  final String sender;
  final String message;
  final String imageURL;
  final String imageMessageURL;
  final int unread;
  final bool isVoice;

  Chat({
    this.time,
    this.sender,
    this.message,
    this.imageURL,
    this.unread,
    this.isVoice = false,
    this.imageMessageURL = '',
  });
}

final chats = [
  Chat(
    time: '${DateTime.now().hour}:42',
    sender: 'Matt Champion',
    message: 'You like my verse in RENTAL?',
    imageURL:
        'https://i.pinimg.com/originals/74/17/12/7417127d0af0bf05e8190dac8c3dea85.jpg',
    unread: 1,
  ),
  Chat(
    time: '${DateTime.now().hour}:38',
    sender: 'Kevin Abstract',
    message: 'Peach is sooo good',
    imageURL:
        'https://lastfm.freetls.fastly.net/i/u/770x0/37af8edd1955d078d7cfc26d067fee76.jpg#37af8edd1955d078d7cfc26d067fee76',
    unread: 0,
  ),
  Chat(
    time: '${DateTime.now().hour}:34',
    sender: 'Bearface',
    message: 'Summer sucks when it\'s pandemic',
    imageURL:
        'https://vignette.wikia.nocookie.net/brockhampton/images/6/67/BF1.jpg/revision/latest?cb=20180330053655',
    unread: 3,
  ),
  Chat(
    time: '${DateTime.now().hour}:30',
    sender: 'Dom McLennon',
    message: 'It\'s all mental, man',
    imageURL:
        'https://vignette.wikia.nocookie.net/the-brockhampton/images/9/93/Dom-Mclennon.jpg/revision/latest?cb=20190411134353',
    unread: 0,
  ),
  Chat(
    time: '${DateTime.now().hour}:28',
    sender: 'Merlyn Wood',
    message: 'Better hold me',
    imageURL:
        'https://i0.wp.com/rappers.money/wp-content/uploads/2018/08/merlyn-wood-e1533584963222.jpg?fit=726%2C733&ssl=1',
    unread: 0,
  ),
  Chat(
    time: '${DateTime.now().hour}:20',
    sender: 'Joba',
    message: 'There\'s a place in your country named like me',
    imageURL:
        'https://i.pinimg.com/originals/58/c6/30/58c6301d1943be0bcd3781f55162f16d.jpg',
    unread: 1,
  ),
  Chat(
    time: '${DateTime.now().hour}:18',
    sender: 'Mom',
    message: 'Turn down that volume',
    imageURL:
        'https://img.freepik.com/free-photo/cheerful-middle-aged-woman-with-curly-hair_1262-20859.jpg?size=626&ext=jpg',
    unread: 0,
  ),
  Chat(
    time: '${DateTime.now().hour}:10',
    sender: 'Dad',
    message: 'Let\'s watch the game today',
    imageURL:
        'https://media1.popsugar-assets.com/files/thumbor/rel5oYkUltxB3lsjuDee0K9raZg/0x0:3427x3427/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2020/03/17/835/n/1922398/11a627175e711ee4975f09.79521254_/i/Jon-Hamm.jpg',
    unread: 1,
  ),
];

final conversation = [
  Chat(
    time: '${DateTime.now().hour}:42',
    sender: 'Matt Champion',
    message: 'The world is crazy man',
    imageURL:
        'https://i.pinimg.com/originals/74/17/12/7417127d0af0bf05e8190dac8c3dea85.jpg',
  ),
  Chat(
    time: '${DateTime.now().hour}:50',
    sender: 'Me',
    message: 'It is',
    imageURL:
        'https://lastfm.freetls.fastly.net/i/u/770x0/37af8edd1955d078d7cfc26d067fee76.jpg#37af8edd1955d078d7cfc26d067fee76',
  ),
  Chat(
    time: '${DateTime.now().hour}:51',
    sender: 'Me',
    message: 'Dark says the end of the world is on June 27th',
    imageURL:
        'https://lastfm.freetls.fastly.net/i/u/770x0/37af8edd1955d078d7cfc26d067fee76.jpg#37af8edd1955d078d7cfc26d067fee76',
  ),
  Chat(
    time: '${DateTime.now().hour}:55',
    sender: 'Matt Champion',
    message: 'Haha seems like it',
    imageURL:
        'https://i.pinimg.com/originals/74/17/12/7417127d0af0bf05e8190dac8c3dea85.jpg',
  ),
  Chat(
    time: '${DateTime.now().hour}:56',
    sender: 'Matt Champion',
    imageURL:
        'https://i.pinimg.com/originals/74/17/12/7417127d0af0bf05e8190dac8c3dea85.jpg',
    imageMessageURL:
        'https://i.insider.com/5df126b679d7570ad2044f3e?width=1100&format=jpeg&auto=webp',
  ),
  Chat(
    time: '${DateTime.now().hour}:59',
    sender: 'Me',
    imageURL:
        'https://lastfm.freetls.fastly.net/i/u/770x0/37af8edd1955d078d7cfc26d067fee76.jpg#37af8edd1955d078d7cfc26d067fee76',
    isVoice: true,
  ),
];
