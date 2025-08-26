

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.indigo,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
      home: PortfolioHome(
        isDarkMode: _isDarkMode,
        onThemeChanged: (val) {
          setState(() {
            _isDarkMode = val;
          });
        },
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const PortfolioHome({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final _homeKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildNavButton(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('My Portfolio'),
        actions: [
          _buildNavButton('Home', _homeKey),
          _buildNavButton('Projects', _projectsKey),
          _buildNavButton('Contact', _contactKey),
          IconButton(
            icon: widget.isDarkMode
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.nightlight_round),
            onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
            tooltip: widget.isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionWrapper(
                key: _homeKey,
                child: Column(
                  children: [
                    Text(
                      "FATHIMA HANEENA T E",
                      style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "I'm Fathima Haneena T E, a Flutter Developer. Passionate about crafting efficient and user friendly mobile application and web application. Proficient in Flutter, Dart, State management, API integration, html, css, mern stack.  I enjoy solving challenges and continuously learning new technologies to enhance app and web development.",
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        
                        _launchUrl('https://drive.google.com/file/d/1E5pdYF5jzW7xVkCDwknLoQ4VNlW4AXiQ/view?usp=sharing');
                      },
                      child: const Text('Resume'),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

       
SectionWrapper(
  key: _projectsKey,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Projects',
        style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),

      // Wrap instead of placing each ProjectCard individually
      Wrap(
        spacing: 20, // space between cards horizontally
        runSpacing: 20, // space between rows
        children: [
          SizedBox(
            width: 400, // or MediaQuery.of(context).size.width * 0.45
            child: ProjectCard(
              title: 'Train Dine – Onboard Food Ordering',
              description: 'Cross-platform app for ordering food from the train kitchen. Flutter, Java, MySQL.',
              githubUrl: 'https://github.com/yourusername/train-dine',
              demoUrl: 'https://example.com/train-dine-demo',
            ),
          ),
          SizedBox(
            width: 400,
            child: ProjectCard(
              title: 'CourierIQ – Smart Courier Management',
              description: 'Flutter app to schedule pickups, track deliveries. Backend in PHP & MySQL.',
              githubUrl: 'https://github.com/yourusername/courieriQ',
              demoUrl: 'https://example.com/courieriQ-demo',
            ),
          ),
          SizedBox(
            width: 400,
            child: ProjectCard(
              title: 'Ecommerce Mobile App',
              description: 'Cross-platform app for ordering various products. Flutter, PHP, MySQL.',
              githubUrl: 'https://github.com/Fathimahaneenate/E-commerce1',
              demoUrl: 'https://example.com/train-dine-demo',
            ),
          ),
          SizedBox(
            width: 400,
            child: ProjectCard(
              title: 'Sign Language Detection App',
              description: 'Android app to detect sign language gestures using ML Kit and Android camera.',
              githubUrl: 'https://github.com/yourusername/sign-language-app',
            ),
          ),
          SizedBox(
            width: 400,
            child: ProjectCard(
              title: 'MRM admin dashboard',
              description: 'Cross-platform webapp for .',
              githubUrl: 'https://github.com/yourusername/train-dine',
              demoUrl: 'https://example.com/train-dine-demo',
            ),
          ),
          SizedBox(
            width: 400,
            child: ProjectCard(
              title: 'Business Finance Tracker Website',
              description: 'Web app built with PHP & MySQL to track small business finances with reports.',
              githubUrl: 'https://github.com/yourusername/finance-tracker',
            ),
          ),
        ],
      ),

      const SizedBox(height: 32),
    ],
  ),
),

              // Contact Section
              SectionWrapper(
                key: _contactKey,
                child: Column(
                  children: [
                    Text(
                      'Contact Me',
                      style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ContactForm(),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          tooltip: 'GitHub',
                          onPressed: () {
                            _launchUrl('https://github.com/Fathimahaneenate');
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          tooltip: 'LinkedIn',
                          onPressed: () {
                            _launchUrl('https://www.linkedin.com/in/fathima-haneena-t-e-607056335/');
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.envelope),
                          tooltip: 'Email',
                          onPressed: () {
                            _launchUrl('mailto:fathimahaneenate@gmail.com');
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.whatsapp),
                          tooltip: 'WhatsApp',
                          onPressed: () {
                            _launchUrl('https://wa.me/917356761180');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

class SectionWrapper extends StatefulWidget {
  final Widget child;
  const SectionWrapper({super.key, required this.child});

  @override
  State<SectionWrapper> createState() => _SectionWrapperState();
}

class _SectionWrapperState extends State<SectionWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnimation = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: widget.child,
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String? githubUrl;
  final String? demoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.githubUrl,
    this.demoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 320,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 12),
              Row(
                children: [
                  if (githubUrl != null)
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      onPressed: () {
                        _launchUrl(githubUrl!);
                      },
                      tooltip: 'View on GitHub',
                    ),
                  if (demoUrl != null)
                    IconButton(
                      icon: const Icon(Icons.open_in_new),
                      onPressed: () {
                        _launchUrl(demoUrl!);
                      },
                      tooltip: 'View Live Demo',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _message = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
              onSaved: (val) => _name = val ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (val) => val == null || !val.contains('@') ? 'Enter valid email' : null,
              onSaved: (val) => _email = val ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 4,
              validator: (val) => val == null || val.isEmpty ? 'Enter message' : null,
              onSaved: (val) => _message = val ?? '',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submit,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Text('Send Message'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thanks $_name, message sent! (Demo only)')),
      );
      form.reset();
    }
  }
}
