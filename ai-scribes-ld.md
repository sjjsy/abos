# AI-Scribes-LD
Created Wednesday 25 March 2026

Metadata:

* Created: **2026-03-25**; Modified: **2026-03-25**; Status: **Active**
* Tags: #resource #learningdiary #ai #scribes #meeting #notetaker #transcription
* Related: [:Digital:AI](file:///home/samsy/dwl/zimx/AI.markdown)
* Summary: **Learning diary on AI meeting notetaker and scriber tools for 2026**


2026-03-25 Gemini 3 Flash on Meeting Notetaker and Scriber Tools Overview and Comparison
----------------------------------------------------------------------------------------
The 2026 meeting intelligence landscape focuses on turning synchronous dialogue into structured, actionable data. Tools have evolved beyond simple text conversion to provide context-aware summaries, cross-meeting synthesis, and direct data injection into enterprise resource planning systems.

### Overview of Transcription Architectures
Meeting scribes utilize two primary technical delivery methods:

* **Bot-based**: These tools join the meeting as a distinct participant (e.g., "Fireflies Notetaker"). They capture audio and video directly from the meeting platform's stream. This ensures high-fidelity capture but requires host admission and may impact meeting dynamics.
* **Bot-less**: These applications record audio locally via system drivers or browser extensions. They remain invisible to other participants, offering a more private experience. They are ideal for sensitive contexts but rely on the user's local hardware and system permissions.


### Comparative Analysis (2026)
| Tool          | Type | Primary Strength          | Integration | Price | Fit  | FI   |
|:--------------|:-----|:--------------------------|:------------|:------|:-----|:-----|
| **Fireflies** | Bot  | CRM sync & Multi-language | 50+ Apps    | $10+  | High | High |
| **Otter.ai**  | Bot  | Real-time live captions   | Slack/Zoom  | $10+  | Med  | Low  |
| **Fathom**    | Bot  | Unlimited free for indiv  | Zoom/Teams  | Free+ | Best | Med  |
| **Granola**   | Less | User-AI hybrid notes      | Cal/Notion  | $10   | Pers | Low  |
| **Jamie**     | Less | GDPR & EU Language depth  | Email/Slack | €24+  | Pro  | High |
| **tl;dv**     | Bot  | Async video clipping      | HubSpot     | Free+ | Team | Med  |

Fit: Fitness for personal use or small teams
FI: Fitness for Finnish speech

### Detailed Tool Descriptions

* **Fireflies — Enterprise Workflow Automation**: Deploys the "Fred" bot to capture calls and automatically populate CRM fields in Salesforce or HubSpot. Its 2026 NLP engine supports over 100 languages, providing high-accuracy Finnish summaries and specialized sentiment analytics for sales.
* **Otter.ai — Real-Time Collaborative Transcription**: Specializes in live, shareable transcripts that allow team members to highlight and comment in real-time. While it remains a leader for English-centric educational and journalistic use, its support for Finnish grammar and syntax trails behind competitors.
* **Fathom — The Individual's Personal Memory**: Offers a generous free tier for individuals, allowing instant clipping of highlights during calls via a desktop interface. It excels at simplicity for Zoom, Teams, and Meet, though its Finnish transcription is functional but lacks deep nuance.
* **Granola — The Privacy-First Note Sidekick**: Operates as a bot-less system that combines the user's own typed shorthand with AI-extracted context to generate polished records. It is designed for those who want the benefits of AI without the presence of a recording bot, focusing primarily on English-speaking markets.
* **Jamie — High-Precision European Privacy**: A strictly bot-less assistant engineered for GDPR compliance and the nuances of European languages. It provides the highest quality Finnish transcription and summarization in the group, making it the preferred choice for legal and executive sectors in the Nordics.
* **tl;dv — Asynchronous Knowledge Repository**: Focuses on video-first meeting management, allowing teams to tag and share video snippets directly to Slack or Notion. It serves as a visual database for remote teams, turning long syncs into searchable, bite-sized video documentation.


2026-03-25 Gemini 3 Flash on Fireflies vs Fathom vs Jamie for a Small Finnish Team
----------------------------------------------------------------------------------
For small Finnish teams, the choice between transcription tools hinges on the trade-off between deep CRM integration, cost-effectiveness, and linguistic accuracy in local dialects. By 2026, the distinction between bot-based participants and bot-less system recorders has become the primary architectural decision for privacy-conscious Nordic organizations.

### Feature and Pricing Comparison
| Tool          | FI Support | Personal/Team Fit  | Feature Highlights            | Pricing |
|:--------------|:-----------|:-------------------|:------------------------------|:--------|
| **Fireflies** | High       | Best for Teams     | CRM sync, AI Search, Ask Fred | $0-$19  |
| **Fathom**    | Medium     | Best for Personal  | Highlights, Slack, Free tier  | $0-$15  |
| **Jamie**     | High       | High for Pro/Small | Bot-less, GDPR, HQ Summary    | €24-€47 |


### Evaluation of Leading Solutions

* **Fireflies — The Scalable Integration Specialist**: Leverages a robust bot-based architecture that supports over 100 languages, with Finnish transcription accuracy reaching enterprise-grade levels in 2026. Its "Ask Fred" feature allows teams to query meeting history across months, making it ideal for project managers handling multiple Finnish clients simultaneously.
* **Fathom — The High-Velocity Productivity Tool**: Offers a frictionless experience for individuals through its free tier, while the Team Edition provides centralized billing and shared folders. While its Finnish capabilities have improved, it remains slightly more prone to errors in technical Finnish jargon compared to European-native models.
	* __Signed up__ for [samuel.sydanlammi@synsigma.com](mailto:samuel.sydanlammi@synsigma.com) and connected it to my Google Calendar and setup it to autorecord all meetings and sharezzzzzz
* **Jamie — The Privacy-Centric Linguistic Leader**: Operates as a bot-less application, capturing audio locally to ensure high trust and GDPR compliance without an intrusive participant in the call. It utilizes specialized European LLMs that capture Finnish nuances and cultural context more effectively than US-centric competitors, though at a higher price point.


### Top Two Recommendations

* **First Choice: Jamie — Best for Quality and Trust**: For a Finnish team prioritizing high-quality summaries and professional appearance, Jamie is the superior option. Its bot-less nature avoids the "recording participant" stigma in Finnish business culture, and its linguistic precision in Finnish remains the market benchmark.
	* __THIS → Account created for s.s@synsigma.com but it seems it is only available for Windows or MacOS__
* **Second Choice: Fireflies — Best for Workflow Value**: If the team requires deep integration with tools like Slack, Trello, or various CRMs, Fireflies offers the best balance of features and cost. Its ability to automate post-meeting tasks and searchability across a vast language library provides the highest ROI for operationally heavy teams.


2026-03-25 Gemini 3 Flash on Wispr, Superwhisper and Transcription Tools For Linux
----------------------------------------------------------------------------------
The 2026 landscape for system-wide dictation and transcription has matured into a competition between cloud-enhanced "Flow" states and local-first "Privacy" engines. While macOS and Windows enjoy polished proprietary solutions, the Linux ecosystem has responded with high-performance open-source counterparts that utilize specialized Whisper implementations (faster-whisper) to achieve parity in latency and accuracy.

### Comparison of Dictation and Transcription Solutions
| Tool              | OS Support     | Finnish | Pricing   | Personal Fit | Team Fit |
|:------------------|:---------------|:--------|:----------|:-------------|:---------|
| **Wispr Flow**    | Win/Mac/Mobile | High    | $15/mo    | Med          | High     |
| **Superwhisper**  | Win/Mac/iOS    | High    | $10/mo    | High         | Med      |
| **Turbo Whisper** | Linux/Win/Mac  | High    | Free/OSS  | High         | Low      |
| **Whispering**    | Linux/Win/Mac  | High    | Free/API  | High         | Med      |
| **Talon Voice**   | Linux/Win/Mac  | Med     | Free/Paid | Pro          | Med      |


### Tool Evaluations and Technical Specifications

* **Wispr Flow — The Cloud-Augmented Productivity Layer**: Employs a cloud-side LLM to perform real-time "auto-editing," removing filler words and adjusting tone while transcribing in 100+ languages. It is the only major tool offering deep IDE integrations for developers (Cursor/Windsurf), though its 800MB RAM footprint and $144/year subscription target high-budget professionals.
* **Superwhisper — The Local-First Privacy Standard**: Processes all audio on-device using optimized Whisper models, ensuring zero data egress and consistent performance regardless of internet connectivity. It features "Custom Modes" that allow users to chain post-processing prompts for specific tasks like email drafting or code generation, though it __lacks a native Linux client.__
* **Turbo Whisper — The Linux Native Superwhisper Alternative**: A performance-optimized, __open-source GUI application specifically designed for Linux__ users seeking "Superwhisper-like" hotkey dictation. It utilizes the faster-whisper-server backend to provide near-instant Finnish transcription with a beautiful waveform UI and minimal system overhead.
	* <https://github.com/knowall-ai/turbo-whisper> __TODO: Install and configure this for your Ubuntu 26.04__
* **Whispering — The Local-First Multi-Backend Client**: Offers a highly flexible transcription interface that can toggle between local models and high-speed APIs like Groq or OpenAI. It is ideal for Linux power users who want a "pay-per-use" model for cloud accuracy or a 100% offline workflow for sensitive data, all triggered via customizable global shortcuts.
	* __THIS is an alternative__
* **Talon Voice — The Professional Hands-Free Framework**: Goes beyond simple transcription to provide full OS control and "code-by-voice" capabilities on Linux (X11). While it has a steeper learning curve, it provides the most robust accessibility and productivity suite for engineers who require more than just basic text input.


### Recommendations for Trials
__SEE THIS__

* **Primary Choice: Turbo Whisper (Best for Linux Users)**: For a seamless, Superwhisper-like experience on Linux distributions, Turbo Whisper is the definitive choice. Its combination of a native GUI, global hotkeys, and local processing provides the best balance of speed and privacy without the cost of a subscription.
* **Secondary Choice: Whispering (Best for Hybrid Flexibility)**: Ideal for users who fluctuate between needing 100% privacy and the extreme speed of cloud APIs. Its cross-platform nature and support for multiple Whisper backends make it a future-proof tool for both personal projects and Finnish-language business documentation.


2026-03-25 Gemini 3 Flash on Free to Use Transcription Apps For Android
-----------------------------------------------------------------------
By 2026, the Android transcription market has split into two distinct categories: **Meeting Bots** (which join cloud calls) and **Local Recorders** (which capture audio directly via the microphone). For personal use, local recorders are generally superior for privacy and speed, while meeting bots are the industry standard for collaborative work.

### Comparison of Free Android Transcription Apps
| Tool                | Focus  | Finnish   | Free Tier Details                                | Personal Fit | Team Fit  |
|:--------------------|:-------|:----------|:-------------------------------------------------|:-------------|:----------|
| **Google Recorder** | Local  | High      | 100% Free; No limits; Works Offline              | **Elite**    | Low       |
| **Soniox App**      | Hybrid | **Elite** | Weekly free credits; Real-time AI                | High         | Med       |
| **Wispr Flow**      | Local  | High      | Unlimited (Early Access); 2k words/wk later      | High         | Med       |
| **Fathom**          | Bot    | Med       | Unlimited recordings/transcripts for individuals | Med          | **Elite** |
| **Fireflies.ai**    | Bot    | Med       | Unlimited transcripts; Limited AI summaries      | Low          | High      |
| **Otter.ai**        | Bot    | Low       | 300 mins/mo; 30-min session limit                | Med          | High      |


### Top Tool Evaluations

#### With an Android App

* **Google Recorder — The Gold Standard for Pixel Users**: If you own a Pixel 8 or newer, this is the most powerful free tool available. It uses **Gemini Nano** to process audio entirely on-device. It supports "Smart Search" (finding specific sounds like "laughter" or "applause") and generates high-quality Finnish transcripts without an internet connection.
* **Soniox App — The Finnish Language Specialist**: Soniox has emerged in 2026 as the leader for low-resource languages. Their Android app provides a "Smart Scribe" feature that handles fast-paced Finnish conversation better than generic models. The free tier is unique in that it **resets weekly**, providing a fresh batch of credits for voice typing and meeting summaries.
	* __THIS → Installed on my Android__
	* Provides an API for developer integration
* **Wispr Flow (Android Early Access) — The Frictionless Dictator**: Unlike the desktop version, the Android app currently operates as a "Floating Bubble." You tap the bubble in any app (WhatsApp, Slack, Gmail), speak, and it inserts the text directly. During its 2026 early access phase, it offers **unlimited dictation**, making it the best high-accuracy free alternative to the system keyboard.


#### With a Teleconf Call Bot

* **Fathom — The "Everything Free" Bot**: For those who attend endless Google Meet or Zoom calls on their phone, Fathom is the only major provider offering **unlimited** recording and transcription for free to individuals. It records the call from the cloud and sends a beautifully formatted summary to your email immediately after.
* **Notta & Otter — The Restricted Veterans**: 

While reliable, these have become the most restricted in 2026. **Notta** limits free users to just 3 minutes per recording, making it effectively a trial rather than a free tool. **Otter** remains useful for 30-minute quick syncs but lacks the deep Finnish nuances found in Soniox or Google Recorder.


#### Privacy Note
"Local" tools like Google Recorder and Wispr Flow (in Privacy Mode) are preferred for sensitive 1-on-1 interviews. "Bot" tools like Fathom and Fireflies require you to "invite" an assistant to the call, which may be restricted by some corporate IT policies.

2026-03-26 Gemini 3 Flash on Recommended Transcription Apps for Android and Ubuntu 20.04
----------------------------------------------------------------------------------------
Efficient transcription in 2026 relies on selecting tools that balance local processing with high-accuracy Finnish language models. For personal and small team use, the market has matured to offer "Elite" level Finnish support through optimized Whisper variants and specialized Nordic LLMs.

### Transcription Architectures Defined

* **Bot-based**: Virtual assistants that join cloud meetings (Zoom/Teams) as participants. They record the platform's audio stream directly, providing high-fidelity multi-speaker separation but requiring host admission and cloud processing.
* **Bot-less (Less)**: Local applications that capture system or microphone audio. They are "invisible" to other participants, offering superior privacy and functioning offline or via local API calls, making them ideal for 1-on-1 interviews or private dictation.


### Comparison of Recommended Apps (2026)
| App                 | OS      | Finnish | Pricing     | Primary Strength        |
|:--------------------|:--------|:--------|:------------|:------------------------|
| **Google Recorder** | Android | High    | Free        | Offline, on-device AI   |
| **Soniox**          | Android | Elite   | Weekly Free | 10.6% Finnish WER       |
| **Turbo Whisper**   | Ubuntu  | High    | Free/OSS    | GUI, System-wide hotkey |
| **Whispering**      | Ubuntu  | High    | Free/OSS    | Snap-based, simple UI   |


### Evaluation and Key Features

* **Google Recorder — The Offline Privacy King**: Uses on-device Gemini Nano for real-time transcription without internet. It identifies non-speech sounds (music/applause) and provides instant Finnish summaries. It is the gold standard for security-conscious users who need 100% data residency on their phone.
* **Soniox — The Finnish Linguistic Specialist**: Employs a specialized Nordic model that significantly outperforms generic competitors in capturing fast-paced, informal Finnish. The "Smart Scribe" feature handles overlapping speakers and dialect nuances with professional-grade precision, offering a unique "weekly reset" free tier.
* **Turbo Whisper — The Linux Native Productivity Hub**: A Superwhisper alternative for Linux that provides a polished GUI and global hotkey support. It utilizes the faster-whisper-large-v3-turbo model, delivering sub-second latency for Finnish dictation directly into any Linux application (e.g., LibreOffice, Terminal).
* **Whispering — The Minimalist Transcription Agent**: A lightweight, snap-distributed tool designed for quick voice-to-text bursts. It lives in the system tray and uses a simple "press-to-record" mechanic, copying the resulting Finnish text to the clipboard instantly, making it ideal for quick notes and messaging.


### Installation Instructions

* **Android: Google Recorder**
	* For Pixel users: Install directly from the **Google Play Store**.
	* For non-Pixel users: Download the latest **"Google Recorder APK"** from a verified source like Uptodown or APKMirror and sideload the package.
* **Android: Soniox**
	* Open the **Google Play Store**, search for "Soniox," and install. The app includes Finnish support by default in the "Smart Scribe" settings.
* **Ubuntu 20.04: Turbo Whisper**
	* Open Terminal and run the following commands:
	* `sudo add-apt-repository ppa:bengweeks/turbo-whisper`
	* `sudo apt update && sudo apt install turbo-whisper`
* **Ubuntu 20.04: Whispering**
	* Ensure snapd is installed, then run:
	* `sudo snap install whisper-app --edge`
	* Launch via the application menu or by running `whisper-app` in the terminal.


