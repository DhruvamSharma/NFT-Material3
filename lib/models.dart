final categories = <String>[
  'Trending',
  'Digital Arts',
  '3D Videos',
  'Game',
  'Collections'
];

final auctionItems = <AuctionItem>[
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/0fS5vAl.jpg',
    price: '15.97 ETH',
  ),
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/z0CUA32.jpg',
    price: '15.97 ETH',
  ),
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/rtojy3V.png',
    price: '15.97 ETH',
  ),
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/P2ry6fH.png',
    price: '15.97 ETH',
  ),
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/srp01dU.jpg',
    price: '15.97 ETH',
  ),
  const AuctionItem(
    owner: 'A.',
    title: 'Day 74',
    userName: '@Mark Rise',
    timeLeft: '20h : 35m: 08s',
    imageLink: 'https://i.imgur.com/Hk2WRh4.jpg',
    price: '15.97 ETH',
  ),
];

class AuctionItem {
  final String owner;
  final String title;
  final String userName;
  final String timeLeft;
  final String imageLink;
  final String price;

  const AuctionItem({
    required this.owner,
    required this.title,
    required this.userName,
    required this.timeLeft,
    required this.imageLink,
    required this.price,
  });
}
