# README
Created Sunday 22 March 2026

``pkm``

This is a file repository that serves as the **Personal Knowledge Management (PKM)** solution for its author, Samuel Sydänlammi. It was first implemented with the **Zim wiki** tool but has grown, and intends to, toward supporting broader **Personal AI Infrastructure (PAI)**.

**Current Goal:** To transition a passive PKM system into a high-velocity **Agentic Operating System** (AOS) where AI partners with Samuel to help him grow, thrive and serve more effectively.

**Broader Vision:** To serve as a foundational dataset for a future **Virtual AI Clone**.


### The Human Integration
This repository implements a multi-layered approach to human-AI synergy, drawing inspiration from the following:

#### Clear Information Organization

* **PARA Method:** Organizing the filesystem by *actionability* to optimize clarity and usability: **Projects**, **Areas**, **Resources**, **Archives**. 
* **Zettelkasten Method:** Pages form a **web with cross-linking** instead of relying only on file hierarchy.
* **BASB (Building a Second Brain):** Utilizing the **CODE** workflow to optimize Human-AI collaboration and context management for information processing: **Capture**, **Organize**, **Distill**, **Express**.


#### Self-Leadership Support

* **GTD (Getting Things Done):** Providing a time-tested human-friendly system for self-leadership and project and task execution and management: **Capture**, **Clarify**, **Organize**, **Reflect**, **Engage**
* **Personal Lean Agile Leadership:** Applying agile principles and OKR (Objectives & Key Results) thinking into self-management: **Sprints**, **Dailies**, **Metrics**, **Retrospectives**, **Quarterlies**.
* **Pomodoro Technique**: Estimate task effort, block distraction free time, and work in 20-50 min timed full-focus intervals.
* **Time Blocking**: Plan days and weeks ahead of time such that sufficient time blocks are reserved for deep work to ensure GTD flow materializes into success.


#### Simplicity and Control

* **Zim-wiki**: Open source text-based wiki PKM software: Simple, local, flexible, effective
* **Git with Watchdog**: Version control with watchdog script ensuring effective change tracking


#### Secure Sovereign AI Infrastructure

* **Personal AI Assistant**: AI helps with organization, tasks, analysis, decisions and compliance (also to the philosophical stack) to reduce cognitive load and increase productivity
* **AI-Powered PKM**: AI enhances knowledge retrieval and synthesis for faster insight generation


### The AI Integration

#### Tier 1: Personal Sovereign AI Assistance

* **Local AI**: Employ open-source AI models on local hardware → **Optimized reliability, security, performance, and cost**
* **AI-Powered PKM**: AI–PKM integration for effective RAG and synthesis → **Faster PKM, analysis, research and synthesis**
* **AI Assistant**: Organization, compliance, self-management, and simple tasks → **Reduces everyday cognitive and execution load**


#### Tier 2: Personal Agentic AI Operating System

* **Agentic AI**: Local agents (e.g. OpenClaw) "live and work" for you asynchronously → **Automation for PKM and execution**
* **AI Operating System**: Integrates life data, plans, and execution → **Holistic and adaptive life management support**
* **AI Life Dashboard**: Centralized overview of goals, tasks, and progress → **Clarity, focus and transparency for sustainable speed**
* **AI Accountability System**: Tracks behavior vs. goals; enforces discipline → **Outsources self-leadership load and drives habits and execution**


#### Tier 3: Personal Agentic Infrastructure

* **AI Infrastructure**: Fully owned and controlled, modular and scalable AI system → **Sovereign system that learns and grows with and for you**
* **AI Strategist**: Evaluates options and recommends actions → **Reduces decision paralysis; increases confidence, velocity and success**
* **AI Partner**: Proactive coach, advisor, and coworker for strategy and execution → **Strong management, leadership and execution support for success**


#### Tier 4: Personal Virtual AI Clone Team

* **AI Clones**: Models your thinking, writing, and preferences → **Scales personal productivity through delegation and representation**
	* Multiple clones or variants with different specializations and roles in the team


#### Tier 5: Personal Virtual AI Superclones

* **AI Superclones**: Like clones but smarter and more capable than their owner in almost every way → **Augments and superscales personal productivity in ways we cannot yet predict**


### Implementation
__TODO__: Reorganize this section based on the layers overview (one section for each layer) and update both.

#### Architectural Layers
Most advanced systems combine multiple layers:
| Layer         | Description            | Example Tools                                            |
|---------------|------------------------|----------------------------------------------------------|
| Tool          | Execution capabilities | Zim, Git, Whisper, Claude, Cursor, OpenClaw, Aider, APIs |
| Orchestration | Specialized AI agents  | Claude                                                   |
| Interface     | User interaction       | Chat, dashboards, Telegram                               |
| Intelligence  | Reasoning AI models    | Claude, local LLaMA                                      |
| Data          | Personal data sources  | Zim wiki notebook, files, email, calendar                |
| Control       | Permissions & policies | CLAUDE.md approval gates and logging                     |


#### Simple and Scalable Notebook Organization and Self-Leadership Support
The solution is a compromise between pure PARA, pure Zettelkasten, pure GTD, pure OKR application and simplicity:

* No clear distinction is enforced between PARA ``Area``, ``Project`` and ``Resource`` pages. However, most pages at the root level are ``Area`` pages. Any page can contain tasks but pages without tasks can be seen as ``Resource`` pages.
* The root contains a special ``AGTD`` folder with Lean-Agile GTD system documentation, and some automagically updated overview and dashboard views, and links to active pages. Read ``AGTD.txt`` to understand it.
* All pages should have a meta block at the very top that is specified at ``./README/Pages.txt`` ([:README:Pages](./pkm_files/Pages.markdown)) along with Zim-wiki related formatting specs.


#### Folder and File Structure
Special pages and folders:

* ``AGTD`` — ``Area`` page for the Augmented Lean-Agile GTD task and time management system documentation and "living" overview and dashboard views
	* ``AGTD/Next`` — overview of tasks queued for execution, and links to pages with tasks; Designated as the Home Page in Zim's notebook settings.
	* ``AGTD/Reference/`` — folder for simple everyday oriented notes for reference; includes f. ex. packing, shopping and reading lists
* ``Archive/`` — archived projects, areas and resources (especially courses) (9 GB)
* ``Bibliography/`` — academic papers and references (50 MB)
* ``Calendar/`` — time-based entries
* ``Knowledge/`` — personal knowledge base (130 MB)


Then there are many major PARA ``Area`` folders which often also include goal-oriented ``AGTD`` content; For example: ``Career``, ``Digital``, ``Family``, ``Health``, ``People``, ``Recreation``, ``Social``, ``Tools``, ``Wealth``.

Many folders include a ``Files`` subfolder which is for attaching files to a page. Zim should ignore those in indexing (but it currently does not).

Note that there are special Zim-wiki specific files:

* ``notebook.zim`` — main Zim config; document root is ``~/doc/zim``, home page is ``ZGTD:Next``
	* ``.zim/index.db`` — Zim's SQLite full-text search index (auto-managed by Zim, excluded from sync via ``.stignore``)
	* ``.zim/state.conf`` — Zim's UI window/tab state
* ``zim.code-workspace`` — VS Code workspace pointing to this root


#### Agentic Orchestration (draft content)
__TODO__: Rework this section
Different agents for different purposes to optimize context management (agents can focus on similar tasks and build context and memory for those; also makes communication more efficient since they are able to assume more based on earlier interaction); See <https://code.claude.com/docs/en/sub-agents>

* Nara: The general notebook assistant
* Caleb: The Career Coach
* Abby: The system admin

Note: Openclaw is maybe not needed, scheduled agentic work can be handled with Claude(?)

### Integration Summary

* **Organization**: PARA, Zettelkasten, BASB, GTD → **Clear Structure**
* **Leadership**: GTD, Lean-Agile, Pomodoro, Time Blocking → **Systematic Execution** 
* **Software**: Zim, Git, Whisper, LLaMA, OpenClaw → **Effective Implementation**
* **Empowerment**: Agentic Assistance, Coaching, Strategizing and Growth → **Automation, Augmentation & Success**


### Example Applications

#### Tier 1

* **Knowledge management**: Systematic organization, indexing, and linking of files and notes; integrating new material into the wiki with consistent structure
* **Search & synthesis**: Question-answering and summaries grounded in *your* Zim pages and attachments (local or private RAG)
* **Writing & editing**: Drafting, rewriting, and proofreading in place—meeting notes, specs, diary entries, email drafts
* **Compliance & routine tasks**: Checklists against CLAUDE.md-style rules, recurring reminders, light triage of inbox or task lists
* **Privacy-sensitive work**: Analysis and drafting that should not leave your machines (local models + local data)


#### Tier 2

* **Self-leadership**: Collecting time-use or activity signals, comparing them to the day’s plan, updating simple metrics, and feedback on drift
* **Automation**: Scheduled or triggered jobs—exporting a weekly review summary, syncing labels, filing downloads into PARA folders, scripted Git or backup hooks
* **Career**: Surfacing relevant job posts or leads from feeds you control; shortlisting against stated criteria (with you approving sends)
* **Life operations**: Calendar-aware packing lists, meal or errand batching from a shared household list, renewal and deadline nudges
* **Dashboard & review**: One-screen view of goals, projects, and next actions for weekly or monthly planning sessions
* **Accountability**: Streaks, OKR check-ins, or “did you do what you said?” prompts tied to goals you defined


#### Tier 3

* **Self-leadership & strategy**: Scenario planning, goal critique, quarterly reviews—what to stop, start, or double down on
* **Communication**: Tracking open loops across channels; drafting replies for your edit; prioritizing who needs an answer first
* **Work**: Breaking down ambiguous projects, risk lists, stakeholder maps, prioritization when everything feels urgent
* **Career**: Positioning, narrative for interviews or LinkedIn, networking outreach angles, skill-gap analysis vs target roles
* **Learning**: Curriculum outlines, spaced-repetition prompts from your notes, Socratic drilling before talks or exams
* **Infrastructure**: Choosing and wiring tools (models, agents, policies) so the stack stays yours—versioned configs and audit-friendly workflows


#### Tier 4

* **Writing & voice**: First drafts of posts or documentation in your tone from past examples; you review before anything ships
* **Communication**: Routine replies or scheduling proposals that match how you usually phrase things—**never** without disclosure where trust matters
* **Representation**: Briefing others from your wiki when you are unavailable—still **your** approval on sensitive content
* **Delegation**: Handing bounded tasks (“summarize yesterday’s meeting and propose three follow-ups”) with explicit scope and rollback
* **Co-creation**: Brainstorming with trusted humans *about* you (care circle, mastermind) using structured prompts—not replacing human judgment


