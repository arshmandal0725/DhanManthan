class Module {
  Module(
      {required this.topic,
      required this.subTopics,
      required this.moduleCount});
  final String topic;
  final List<List<dynamic>> subTopics;
  int moduleCount;
}

List<Module> modules = [
  Module(
      topic: 'Insider Threat Prevention',
      subTopics: [
        ['Understanding Insider Threats', false],
        ['Employee Awareness Training', false],
        ['Monitoring Internal Access', false],
        ['Creating a Culture of Security', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Cryptocurrency Scams',
      subTopics: [
        ['Ponzi Schemes in the Crypto Space', false],
        ['Fake Initial Coin Offerings (ICOs)', false],
        ['Phishing Attacks Targeting Crypto Investors', false],
        ['Pump-and-Dump Schemes', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Deceptive Investment Frauds',
      subTopics: [
        ['Fake Investment Opportunities', false],
        ['High-Yield Investment Programs (HYIPs)', false],
        ['Binary Options and Forex Scams', false],
        ['Promissory Note Scams', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Online Banking and Payment Fraud',
      subTopics: [
        ['Account Takeover Attacks', false],
        ['Fake Banking Websites and Apps', false],
        ['Unauthorized Transactions and Payment Fraud', false],
        ['CEO Fraud and Business Email Compromise (BEC)', false],
      ],
      moduleCount: 0),
  Module(
      topic: 'Social Engineering Attacks',
      subTopics: [
        ['Impersonation and Identity Theft', false],
        ['Phishing Emails and Spear Phishing', false],
        ['Vishing (Voice Phishing) Scams', false],
        ['Pump-and-Dump Schemes', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'AI-Related Frauds',
      subTopics: [
        ['AI-Powered Deepfake Scams', false],
        ['AI-Generated Fake News and Market Manipulation', false],
        ['Fraudulent AI-Driven Investment Platforms', false],
        ['AI-Enhanced Phishing and Social Engineering', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Reporting and Responding to Financial Fraud',
      subTopics: [
        ['Recognizing a Financial Fraud Case', false],
        ['Steps to Report a Financial Scam', false],
        ['Contacting Law Enforcement and Regulatory Agencies', false],
        ['Recovering Stolen Funds and Preventing Future Losses', false]
      ],
      moduleCount: 0),
  Module(
      topic: ' Data Privacy Essentials',
      subTopics: [
        ['Importance of Data Privacy in Finance', false],
        ['Key Data Privacy Regulations', false],
        ['Personal Data Protection', false],
        ['PSafeguarding Financial Records', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Understanding Cyber Threats',
      subTopics: [
        ['Types of Cyber Threats in Finance', false],
        ['The Anatomy of Cyberattacks', false],
        ['Recognizing Suspicious Online Activities', false],
        ['Cybersecurity Risk Assessment', false]
      ],
      moduleCount: 0),
  Module(
      topic: 'Phishing and Social Engineering Awareness',
      subTopics: [
        ['Identifying Phishing Attempts', false],
        ['Recognizing Social Engineering Tactics', false],
        ['Reporting Suspicious Messages', false],
        ['Verifying Online Identities', false]
      ],
      moduleCount: 0),
];
