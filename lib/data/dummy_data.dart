class Chat {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final int unread;
  final bool muted;

  const Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.unread = 0,
    this.muted = false,
  });
}

const stories = [
  'https://randomuser.me/api/portraits/women/65.jpg',
  'https://randomuser.me/api/portraits/women/68.jpg',
  'https://randomuser.me/api/portraits/men/32.jpg',
  'https://randomuser.me/api/portraits/women/26.jpg',
  'https://randomuser.me/api/portraits/women/90.jpg',
  'https://randomuser.me/api/portraits/men/75.jpg',
];

const chats = [
  Chat(
    name: 'Shane Haq',
    message: 'Hi There! Are you available for talk?',
    time: '12:00',
    avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
    unread: 1,
  ),
  Chat(
    name: 'María Bail',
    message: "Can't talk now, I'm on the way to home",
    time: '12:00',
    avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
  ),
  Chat(
    name: 'Gualtiero Cea',
    message: "Hey! What's Up? Didn't find from you in a while",
    time: '13:00',
    avatar: 'https://randomuser.me/api/portraits/men/46.jpg',
    unread: 2,
  ),
  Chat(
    name: 'María Zarco',
    message: 'Is this my espresso machine? Wh-what is-h-how',
    time: '7:00',
    avatar: 'https://randomuser.me/api/portraits/women/33.jpg',
  ),
  Chat(
    name: 'Rosita Marcos',
    message: 'I gave it a cold? I gave it a virus. A computer virus.',
    time: '13:00',
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    unread: 2,
    muted: true,
  ),
  Chat(
    name: 'Agueda Pedro',
    message: 'if The Pirates of the Caribbean breaks down, the pirates don’t eat the tourists.',
    time: '14:00',
    avatar: 'https://randomuser.me/api/portraits/women/79.jpg',
    unread: 1,
  ),
  Chat(
    name: 'Leo Martins',
    message: 'See you tomorrow at the coffee shop ☕',
    time: '16:30',
    avatar: 'https://randomuser.me/api/portraits/men/22.jpg',
  ),
  Chat(
    name: 'Nora Ellis',
    message: 'Sent you the photos from the trip 📸',
    time: '17:05',
    avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
    unread: 3,
  ),
  Chat(
    name: 'Daniel Cruz',
    message: 'Game night on Friday? Bring snacks!',
    time: '18:20',
    avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
  ),
  Chat(
    name: 'Sofia Lane',
    message: 'Thanks for the help today, you’re the best 💛',
    time: '19:45',
    avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
    unread: 1,
    muted: true,
  ),
];
