import 'package:flutter/material.dart';
import 'track_model.dart';
import 'technology_model.dart';

const List<TrackModel> mockInterviewTracks = [
  TrackModel(
    title: 'Flutter',
    subtitle: 'Widgets • Bloc • Firebase',
    icon: Icons.flutter_dash,
    color: Color(0xFF4F7CFF),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'Mobile Native',
    subtitle: 'iOS • Android',
    icon: Icons.phone_android,
    color: Color(0xFF22B57A),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'Android (Kotlin)',
        icon: Icons.android,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'Android (Java)',
        icon: Icons.android,
        color: Color(0xFFF0B23A),
      ),
      TechnologyModel(
        title: 'iOS (Swift)',
        icon: Icons.phone_iphone,
        color: Color(0xFF4F7CFF),
      ),
      TechnologyModel(
        title: 'React Native',
        icon: Icons.phone_android,
        color: Color(0xFF03A9F4),
      ),
    ],
  ),
  TrackModel(
    title: 'Frontend Web',
    subtitle: 'DOM • CSS • Performance',
    icon: Icons.web,
    color: Color(0xFF9C27B0),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'React',
        icon: Icons.javascript,
        color: Color(0xFF03A9F4),
      ),
      TechnologyModel(
        title: 'Next.js',
        icon: Icons.javascript,
        color: Color(0xFF333B4F),
      ),
      TechnologyModel(
        title: 'Angular',
        icon: Icons.javascript,
        color: Color(0xFFE5484D),
      ),
      TechnologyModel(
        title: 'Vue',
        icon: Icons.javascript,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'Svelte',
        icon: Icons.javascript,
        color: Color(0xFFFF9800),
      ),
    ],
  ),
  TrackModel(
    title: 'Backend',
    subtitle: 'API • Authentication',
    icon: Icons.storage,
    color: Color(0xFF22B57A),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'Node.js',
        icon: Icons.hub_outlined,
        color: Color(0xFF4CAF50),
      ),
      TechnologyModel(
        title: 'Express.js',
        icon: Icons.javascript,
        color: Color(0xFF607D8B),
      ),
      TechnologyModel(
        title: 'NestJS',
        icon: Icons.javascript,
        color: Color(0xFFE5484D),
      ),
      TechnologyModel(
        title: 'ASP.NET Core',
        icon: Icons.code,
        color: Color(0xFF9C27B0),
      ),
      TechnologyModel(
        title: 'Spring Boot',
        icon: Icons.code,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'Django',
        icon: Icons.code,
        color: Color(0xFF009688),
      ),
      TechnologyModel(
        title: 'Laravel',
        icon: Icons.code,
        color: Color(0xFFE5484D),
      ),
      TechnologyModel(
        title: 'FastAPI',
        icon: Icons.code,
        color: Color(0xFF00BCD4),
      ),
      TechnologyModel(
 
        title: 'Go',
        icon: Icons.code,
        color: Color(0xFF03A9F4),
      ),
      TechnologyModel(
        title: 'Ruby on Rails',
        icon: Icons.code,
        color: Color(0xFFE5484D),
      ),
    ],
  ),
  TrackModel(
    title: 'Algorithms',
    subtitle: 'Problem Solving',
    icon: Icons.functions,
    color: Color(0xFFE5484D),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'Data Structures',
    subtitle: 'Trees • Graphs',
    icon: Icons.account_tree,
    color: Color(0xFF673AB7),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'OOP',
    subtitle: 'Design • Patterns',
    icon: Icons.category,
    color: Color(0xFF673AB7),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'SOLID',
    subtitle: 'Principles • Clean',
    icon: Icons.rule,
    color: Color(0xFF00BCD4),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'Design Patterns',
    subtitle: 'Creational • Structural',
    icon: Icons.dashboard_customize,
    color: Color(0xFFFF9800),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'System Design',
    subtitle: 'Scale • Tradeoffs',
    icon: Icons.architecture,
    color: Color(0xFFFF9800),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'Databases',
    subtitle: 'SQL • NoSQL',
    icon: Icons.dataset,
    color: Color(0xFF009688),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'PostgreSQL',
        icon: Icons.storage,
        color: Color(0xFF336791),
      ),
      TechnologyModel(
        title: 'MySQL',
        icon: Icons.storage,
        color: Color(0xFFF0B23A),
      ),
      TechnologyModel(
        title: 'SQL Server',
        icon: Icons.storage,
        color: Color(0xFFE5484D),
      ),
      TechnologyModel(
        title: 'MongoDB',
        icon: Icons.storage,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'Firebase',
        icon: Icons.local_fire_department,
        color: Color(0xFFFF9800),
      ),
      TechnologyModel(
        title: 'Redis',
        icon: Icons.storage,
        color: Color(0xFFE5484D),
      ),
    ],
  ),
  TrackModel(
    title: 'DevOps',
    subtitle: 'CI/CD • Deployment',
    icon: Icons.cloud_done,
    color: Color(0xFF03A9F4),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'Docker',
        icon: Icons.view_in_ar,
        color: Color(0xFF03A9F4),
      ),
      TechnologyModel(
        title: 'Kubernetes',
        icon: Icons.anchor,
        color: Color(0xFF4F7CFF),
      ),
      TechnologyModel(
        title: 'GitHub Actions',
        icon: Icons.play_circle_filled,
        color: Color(0xFF333B4F),
      ),
      TechnologyModel(
        title: 'AWS',
        icon: Icons.cloud,
        color: Color(0xFFFF9800),
      ),
      TechnologyModel(
        title: 'Azure',
        icon: Icons.cloud,
        color: Color(0xFF03A9F4),
      ),
      TechnologyModel(
        title: 'Google Cloud',
        icon: Icons.cloud,
        color: Color(0xFF4F7CFF),
      ),
      TechnologyModel(
        title: 'CI/CD',
        icon: Icons.sync,
        color: Color(0xFF22B57A),
      ),
    ],
  ),
  TrackModel(
    title: 'Testing',
    subtitle: 'QA • Automation',
    icon: Icons.bug_report,
    color: Color(0xFF22B57A),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'Unit Testing',
        icon: Icons.science,
        color: Color(0xFF4F7CFF),
      ),
      TechnologyModel(
        title: 'Widget Testing',
        icon: Icons.touch_app,
        color: Color(0xFF9C27B0),
      ),
      TechnologyModel(
        title: 'Integration Testing',
        icon: Icons.integration_instructions,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'End-to-End',
        icon: Icons.all_inclusive,
        color: Color(0xFF00BCD4),
      ),
      TechnologyModel(
        title: 'Automation',
        icon: Icons.smart_toy,
        color: Color(0xFFFF9800),
      ),
    ],
  ),
  TrackModel(
    title: 'AI Engineering',
    subtitle: 'ML • Models',
    icon: Icons.psychology,
    color: Color(0xFF9C27B0),
    requiresTechnologySelection: true,
    technologies: [
      TechnologyModel(
        title: 'Machine Learning',
        icon: Icons.model_training,
        color: Color(0xFF9C27B0),
      ),
      TechnologyModel(
        title: 'Deep Learning',
        icon: Icons.schema,
        color: Color(0xFF673AB7),
      ),
      TechnologyModel(

        title: 'NLP',
        icon: Icons.chat,
        color: Color(0xFF03A9F4),
      ),
      TechnologyModel(
        title: 'Computer Vision',
        icon: Icons.visibility,
        color: Color(0xFF22B57A),
      ),
      TechnologyModel(
        title: 'Generative AI',
        icon: Icons.auto_awesome,
        color: Color(0xFFFF9800),
      ),
      TechnologyModel(
        title: 'LLM Apps',
        icon: Icons.memory,
        color: Color(0xFF4F7CFF),
      ),
      TechnologyModel(
        title: 'Prompt Engineering',
        icon: Icons.edit_note,
        color: Color(0xFF00BCD4),
      ),
    ],
  ),
  TrackModel(
    title: 'HR Interview',
    subtitle: 'Behavioral • Culture',
    icon: Icons.people,
    color: Color(0xFFE91E63),
    requiresTechnologySelection: false,
  ),
  TrackModel(
    title: 'Cyber Security',
    subtitle: 'InfoSec • Privacy',
    icon: Icons.security,
    color: Color(0xFF607D8B),
    requiresTechnologySelection: false,
  ),
];
