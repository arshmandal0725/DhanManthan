class Module {
  const Module({required this.topic, required this.subTopics});
  final String topic;
  final List<String> subTopics;
}

List<Module> modules = [
  const Module(topic: 'Insider Threat Prevention', subTopics: [
    'Understanding Insider Threats',
    'Employee Awareness Training',
    'Monitoring Internal Access',
    'Creating a Culture of Security'
  ]),
  const Module(topic: 'Cryptocurrency Scams', subTopics: [
    'Ponzi Schemes in the Crypto Space',
    'Fake Initial Coin Offerings (ICOs)',
    'Phishing Attacks Targeting Crypto Investors',
    'Pump-and-Dump Schemes'
  ]),
  const Module(topic: 'Deceptive Investment Frauds', subTopics: [
    'Fake Investment Opportunities',
    'High-Yield Investment Programs (HYIPs)',
    'Binary Options and Forex Scams',
    'Promissory Note Scams'
  ]),
  const Module(topic: 'Online Banking and Payment Fraud', subTopics: [
    'Account Takeover Attacks',
    'Fake Banking Websites and Apps',
    'Unauthorized Transactions and Payment Fraud',
    'CEO Fraud and Business Email Compromise (BEC)'
  ]),
  const Module(topic: 'Social Engineering Attacks', subTopics: [
    'Impersonation and Identity Theft',
    'Phishing Emails and Spear Phishing',
    'Vishing (Voice Phishing) Scams',
    'Pump-and-Dump Schemes'
  ]),
  const Module(topic: 'AI-Related Frauds', subTopics: [
    'AI-Powered Deepfake Scams',
    'AI-Generated Fake News and Market Manipulation',
    'Fraudulent AI-Driven Investment Platforms',
    'AI-Enhanced Phishing and Social Engineering'
  ]),
  const Module(
      topic: 'Reporting and Responding to Financial Fraud',
      subTopics: [
        'Recognizing a Financial Fraud Case',
        'Steps to Report a Financial Scam',
        'Contacting Law Enforcement and Regulatory Agencies',
        'Recovering Stolen Funds and Preventing Future Losses'
      ]),
  const Module(topic: ' Data Privacy Essentials', subTopics: [
    'Importance of Data Privacy in Finance',
    'Key Data Privacy Regulations',
    'Personal Data Protection',
    'PSafeguarding Financial Records'
  ]),
  const Module(topic: 'Understanding Cyber Threats', subTopics: [
    'Types of Cyber Threats in Finance',
    'The Anatomy of Cyberattacks',
    'Recognizing Suspicious Online Activities',
    'Cybersecurity Risk Assessment'
  ]),
  const Module(topic: 'Phishing and Social Engineering Awareness', subTopics: [
    'Identifying Phishing Attempts',
    'Recognizing Social Engineering Tactics',
    'Reporting Suspicious Messages',
    'Verifying Online Identities'
  ]),
];
