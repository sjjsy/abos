# AI-Coding-LD
Created Monday 23 March 2026

## 2026-04-18 Mikko's Human + AI Controller + AI Developer Idea and Agent Harness Engineering

The core insight: the human is the bottleneck

Mikko started from a personal observation — in AI-assisted software development, the AI can generate code fast, but the human spends disproportionate time on everything around the code: deciding what to do next, testing things manually, setting up infrastructure, navigating third-party consoles, procrastinating between tasks. The goal is to minimize that wasted human time, not to automate the coding itself (which is already largely solved).

### The Controller role — inverting the human-AI dynamic

The central innovation in Mikko's design is an inversion of the normal AI interaction pattern. Normally the human prompts the AI. The Controller flips this: the AI tells the human what to do next. Specifically:

### The Controller reads a shared project file to understand goals and current status

* It determines the single most valuable next human action
* It presents that action with clear rationale and steps
* The human either completes it, reports a problem, redirects priorities, or answers a clarifying question
* The Controller updates the file and loops

The tone is direct and action-oriented — this is a personal agent, not a customer-facing product.

What the human is asked to do spans the things AI genuinely cannot do autonomously yet: test a flow in the browser, register a domain, create an app in Google Cloud Console, approve a design, judge whether UX feels right, submit a release to the App Store. The Controller's job is to make sure none of those steps get forgotten and the human always knows what the highest-leverage next action is.

### The developer role — a separate concern

The AI coding agent (e.g. Claude Code) is kept distinct from the Controller. When the Controller identifies a coding task, it hands off to the developer agent. When a human reports a bug that has a clear fix, the Controller instructs the developer directly without asking the human for confirmation — only escalating to the human when the issue is ambiguous or the fix requires significant decisions.

### The project file — single source of truth

After considering multiple-file approaches (separate status, decisions, incidents, actions files), Mikko concluded that a single .md file is better. The risk with multiple files is drift — a new requirement added to one file but not reflected in another. With one file, requirements and their implementation status live inline, making it structurally impossible to silently forget a feature. The Controller reads this file at the start of every session to reconstruct context, making it robust to context resets.

### Implementation philosophy: minimalism first

Mikko was explicitly skeptical of complex orchestration frameworks — BMAD, CrewAI, the ai-scrum-master-template — not because they're wrong, but because they encode assumptions about what the model can't do, and those assumptions go stale as models improve. The better approach is to start with the least process possible — a project file, a task loop, a direct tone — and add components only when a recurring failure mode demands it. Test automation, for instance, was deferred to v1 and handled via a simple CLAUDE.md instruction rather than baked into the Controller itself.

### The broader argument: harness engineering over framework adoption

The conversation evolved toward what Fowler's article calls harness engineering — the idea that Agent = Model + Harness, and that the outer harness a user builds for their specific context matters as much as the underlying model. Mikko's position, validated by Anthropic's own published engineering work, is that:

* Generic frameworks are built by people who want to generalize, not by people optimizing for a specific problem
* The best harness is one tailored to the actual weaknesses and strengths of the specific human and project
* Since model capabilities improve rapidly, harness components should be stripped back regularly to avoid maintaining scaffolding that the model no longer needs

### Why this is realistic where "AI software company" fantasies aren't

The conversation touched on the difference between the romantic vision of a fully autonomous AI development team and the practical reality.
Mikko's framing — one human, a Controller, and a coding agent — is grounded in what actually fails in AI-assisted development today: not the code generation, but the coordination, context persistence across sessions, and the irreducibly human steps.
The Controller addresses exactly those gaps without overclaiming what AI can do autonomously.

The analogy Mikko used at the end is apt: this is like the moment electricity reached cities — the question isn't how to optimize the existing process, it's what becomes newly possible for one or two people that previously required a full team.
