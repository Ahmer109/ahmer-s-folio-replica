class Skill {
  final String name;
  final int percent;
  const Skill(this.name, this.percent);
}

class Project {
  final String number;
  final String title;
  final String body;
  final List<String> tags;
  final String href;
  const Project({
    required this.number,
    required this.title,
    required this.body,
    required this.tags,
    required this.href,
  });
}

class Job {
  final String year;
  final String role;
  final String company;
  final List<String> points;
  const Job({
    required this.year,
    required this.role,
    required this.company,
    required this.points,
  });
}

class PortfolioData {
  static const name = 'Ahmer Ali';
  static const eyebrow = "HELLO, I'M AHMER ALI";
  static const roleTitle = 'Python & ';
  static const roleAccent = 'Flutter Developer';
  static const heroCopy =
      'I build practical data-driven applications, machine-learning experiences, '
      'and responsive mobile products with Python, Streamlit, Flutter, and Firebase.';

  static const metrics = <List<String>>[
    ['4', 'featured projects'],
    ['2', 'active tech tracks'],
    ['2028', 'BSCS graduate'],
  ];

  static const navItems = ['About', 'Skills', 'Projects', 'Experience', 'Contact'];

  static const aboutCopy =
      "I'm a Computer Science student at the University of Sindh, building at the "
      'intersection of Python, data science, and Flutter. Alongside developing '
      'real-world applications, I teach Python and Flutter through practical, '
      'project-based lessons tailored to every learner.';

  static const whatIBring = [
    'Practical, project-based problem solving',
    'Patience and adaptability as an instructor',
    'Hands-on Python, Flutter, and data science experience',
    'A commitment to continuous learning and student success',
  ];

  static const skills = <Skill>[
    Skill('Python', 92),
    Skill('Data Analysis (Pandas, NumPy)', 88),
    Skill('Streamlit', 85),
    Skill('Data Visualization (Matplotlib)', 82),
    Skill('Flutter & Dart', 80),
    Skill('Scikit-learn', 78),
    Skill('Firebase / Firestore', 76),
    Skill('Supabase', 55),
  ];

  static const toolboxCopy =
      'My toolkit spans Python data workflows, machine learning, Streamlit '
      'applications, cross-platform Flutter development, and cloud-backed '
      'products with Supabase.';

  static const tools = [
    'Python', 'NumPy', 'Pandas', 'Matplotlib', 'Scikit-learn', 'Streamlit',
    'Flutter', 'Dart', 'Firebase', 'Firestore', 'Supabase', 'Java', 'C',
    'Jupyter Notebook', 'Google Colab', 'Android Studio', 'VS Code',
  ];

  static const projects = <Project>[
    Project(
      number: '01',
      title: 'My Digital CV and Portfolio',
      body: 'A deployed personal portfolio with a clean, modern interface showcasing professional skills, projects, and achievements.',
      tags: ['Python', 'Streamlit'],
      href: 'https://ahmer-ali-ahmerali-portfolio.hf.space',
    ),
    Project(
      number: '02',
      title: 'Student Performance Predictor',
      body: 'An AI-powered web app using multiple machine-learning algorithms to predict academic performance and support educational improvement.',
      tags: ['Python', 'Streamlit', 'Scikit-learn'],
      href: 'https://ahmer-ali-datascience.hf.space',
    ),
    Project(
      number: '03',
      title: 'TEQNITEHUB — Data & Tech Web App',
      body: 'An interactive data and technology application with a modern interface and dynamic cloud-backed functionality.',
      tags: ['Python', 'Streamlit', 'Firestore'],
      href: 'https://teqnite.streamlit.app',
    ),
    Project(
      number: '04',
      title: 'Property Management System',
      body: 'A contract project for adding, managing, and searching properties, with secure authentication and real-time data.',
      tags: ['Flutter', 'Dart', 'Firebase'],
      href: 'https://managmentsystemapp.netlify.app',
    ),
  ];

  static const experience = <Job>[
    Job(
      year: '2026 — Present',
      role: 'Data Science Intern',
      company: 'Technify · Hyderabad, Pakistan',
      points: [
        'Analyze, preprocess, and visualize real-world datasets.',
        'Apply Pandas, NumPy, and Matplotlib to practical data tasks.',
        'Build insights and analytical reports that support decision-making.',
      ],
    ),
    Job(
      year: 'Aug 2024 — Present',
      role: 'Programming Instructor',
      company: 'Private Tutoring · Self-Employed',
      points: [
        'Teach Python and Flutter through one-on-one and small-group sessions.',
        'Design custom lessons, hands-on projects, exercises, and assessments.',
        'Help students debug applications and adopt coding best practices.',
      ],
    ),
    Job(
      year: 'Jun — Jul 2025',
      role: 'Python Programming Intern',
      company: 'Gexton Education · Hyderabad, Pakistan',
      points: [
        'Completed a six-week practical Python development internship.',
        'Built an intelligent virtual assistant with predictive analytics.',
        'Developed attendance management and automated quiz systems.',
      ],
    ),
  ];

  static const contactCopy =
      "Have a Python, data science, Flutter, or teaching opportunity? I'd love to "
      "hear about it. I'm based in Hyderabad, Sindh.";
  static const email = 'ahmeralishoukat.work@gmail.com';
  static const phone = '+92 315-2661772';
  static const github = 'https://github.com/Ahmer109';
  static const linkedin = 'https://www.linkedin.com/in/a-ahmer/';
}
