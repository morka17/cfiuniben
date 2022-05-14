class Cell {
  final String name;

  Cell(this.name);

  @override
  String toString() {
    return name;
  }
}

class Unit {
  final String name;

  Unit(this.name);

  @override
  String toString() {
    return name;
  }
}

class Answer {
  final String answer;

  Answer(this.answer);
  @override
  String toString() {
    return answer;
  }
}

class Level {
  final String level;

  Level(this.level);

  @override
  String toString() {
    return level;
  }
}

List<Answer> answers = [
  Answer('YES'),
  Answer('NO'),
];

List<Cell> cells = [
  Cell('None'),
  Cell("Dunamis"),
  Cell('Jedidiah'),
  Cell('Jeshua'),
  Cell('Philadelphia'),
  Cell('Salem'),
  Cell('Shekinah'),
];

List<Unit> units = [
  Unit('None'),
  Unit('Academy Unit'),
  Unit('Affections'),
  Unit('Asset Management Team'),
  Unit("Bible Study unit"),
  Unit('Business Unit'),
  Unit("Cfi Choir"),
  Unit('Decoration Unit'),
  Unit('Dude Cfi (Drama Unit)'),
  Unit("Evangelism Unit"),
  Unit('Impact Team'),
  Unit('Itec'),
  Unit('Jesus in Us (JINUS)'),
  Unit('Levites(Technical crew)'),
  Unit('Liberary Unit'),
  Unit('Love Dimensions'),
  Unit('Multimedia Unit'),
  Unit('Nehemiah Club'),
  Unit('Prayer Unit'),
  Unit('Publicity Unit'),
  Unit('Vessels in Praise'),
  Unit('Welfare Unit'),
  Unit('Warn Hearts(Ushers)'),
];

List<Level> levels = [
  Level("None"),
  Level("100"),
  Level("200"),
  Level("300"),
  Level("400"),
  Level("500"),
  Level("600"),
  Level("700"),
  Level("800"),
  Level("900"),
  Level('Postgraduate Study')
];

const List<String> aboutTitle = [
  'Our History',
  'Vision (The end Picture)',
  'Our Mission (Purpose of Our Vision)',
  'Objectives (Specific Actiond Required',
  'Our Goals',
  'Our Value',
  'Main Attack',
  'Target Audience',
  'Core Message',
  'Method',
  'Our Drive',
  'Core Purpose',
  'Core Competence',
  'Tools',
];

const List<String> aboutBody = [
  'Christian Fellowship International is a non-denomination body of Christ that has it roots from CHURCH OF GOD MISSON INTERNATIONAL.\nThe vision was birthed by Archbishop B.A Idahosa to a group of university students in Faith Arena\n\nCfi started in 1990/91 academic session at the sport complex of the university od benin.\nCfi since it was founded has grow with different chapter spread across the nation in various tertiary institutions.\nAll we seek to attain is contained in the vision of CFI',
  'To be a 21St century GOD-CLASS youth and campus minstry\n employing cutting-edge technolgies and techniques in proclaiming the gospel of our Lord Jesus\n By the inspiration of the Holy Spirit.',
  'To Raise EFFECTIVE and efficient Christain leaders and Disciples sof Christ who are sound in spirit, soul and body\nexcelling in their chosen fields (Academics, Professions, Politcs,Business,Ministry, Sports, Entertainment,Tourism,Arts and Culture) by deliberate training.',
  '1.To Identify and retain members of the mission in tertiary institutions John 17:12 Heb 10:24-25\n2.To serve as a grooming ground for the future leadership of the mission in particular and the church in general, 2 Tim 2:2, 1 Tim 4:12-6.\n3.To Generate friendship and fellowship amongst members of the mission  and members of other ministries in the fellowship within and outSide campus.1 pet.2:17b Acts 2:44-47\n4.To Encourage optimu co-operation in academic and social experiences on campus. 2Thes.3:13, Gal 6:10\n5.To Encourage alliances of members in the pursuit of prospects outside campus - ministrt, business, profession ,politics, etc Acts 18:3\n6.To Carry Out on campus th vision evangelism and outreach\n our supreme tack 2cor.5:-17 and 20a\n7.To Sustain our common faith in Christ on campus. Eph.5:19,Heb.3:12-13',
  'Strengthening the confession/ profession of our faith in Christ Jesus through fellowship.\nAttainment and pusuit of acamedic excellence through deliberate training\nCreatin partnership from campus for ministry,business, profession, social and politics \nin order to effect positive changes in our society.',
  '1.Our mission statement\n2.Our membership\n3.Our leadership',
  '1.Soul Winning\n2.Discipleship\n3.Leadership\n4.Academic Excellence',
  'UNDERGRADUATES and youths in general.',
  'The Gospel of our Lord Christ.',
  'Using GOD\'s Love to groom the future of today.',
  'The Pursuit of excellence.',
  'Enforcing GOD\'s Kingdom in our immediate\n environment, society, our nation and the nations of the earth.',
  'Ministry Excellence, leadership development, youth empowerment, national transformation.',
  'Music/Dance/Drama Outreach Programs, Small group meetings,\nAcademic Excellence, Showing Love, Leadership Traning Programs, Academics & Relational Seminars, Fellowship Planting etc.',
];
