# GenAI-Slides-LD
Created Monday 23 March 2026

Metadata:

* Created: **2026-03-23**; Modified: **2026-03-23**; Status: **Active**
* Tags: #resource #learningdiary #genai #slides #presentations #marp #slidev
* Related: [:Digital:AI](file:///home/samsy/dwl/zimx/AI.markdown)
* Summary: **Learning diary on GenAI-powered text-encoded slide production tools and frameworks**


	Prompt: Task: Provide a research report or learning diary entry of the following topic.
	Topic: AI-Assisted Slide Presentation Approaches and Tools
	The learning diary entry should cover the topic comprehensively, informatively with up to date information.
	It should include all the best, popular, specialized and general, established and novel AI-assisted presentation slide generation and development tools.
	I have a lot of images I want to present. Typically 1-4 per slide. But also some text and diagram-style illustrations. I generally value preparation speed and convenience over visual perfectionism. My goal is typically to inform and make a point, not to impress or build emotions.
	One approach which has its benefits is to use a presentation tool that is based on text encoding such that the whole presentation can be drafted and tweaked with just a text editor and besides the images, it takes almost no disk space, and is readable even years from now. Examples of such tools are Marp, Quarto and Presenterm.
	Some of the diagrams could also be text encoded, e.g. with tools such as plantuml and dot. I understand AI tools such as Claude are good with helping build such text encoded diagrams. Then of course it is easy for me to modify those. That would be handy.
	Ideally the core presentation could be drafted with text but then it could be converted to a visual presentation format that I could tweak further visually.
	Another approach is to directly use some visual web based tool such as Google Slides or Gamma Slides or desktop tool such as LibreOffice Impress or Microsoft Powerpoint.
	Can you present a few different approaches, the pros and cons, and the recommended tools for each. Provide links to any existing comparative tool overview or tool description web pages.
	Formatting: Please respond with a copy-paste ready verbatim text block formatted in adherence to the Zim-wiki syntax (https://zim-wiki.org/manual/Help/Wiki_Syntax.html). Make the content compact, dense and informative; Generally start with the big picture, and only then go deeper; For comparisons, lead with a compact comparison table, and follow with explanatory paragraphs; Avoid prefaces, bridges and conversational fillers; No table cell should have over 60 content characters, and no row over 120. Prefer bullet points instead of sequential paragraphs. Enforce "*" for all Zim bullets (no "-"); Favor the pattern: "* **[name] — [summarizing tagline]**: [dense 2-5 sentence technical description, argumentation or elaboration]""". Use a professional, technical, unbiased style; Output a strictly verbatim copy-paste block with zero rendering.
	The first row should be "===== YYYY-MM-DD MODEL on TOPIC =====" where the first part is today's date in ISO format, MODEL is the AI model used (you), and TOPIC is the topic as requested above. All subsequent headings should be of lower heading level ("====" at most).

	Please fix the report: You did not follow my request to output it in verbatim such that I can easily copy paste it into my Zim notebook source. For example, the tables show up as rendered tables and getting them into a Zim compliant form manually would be a hassle.
	Also, in your introductory paragraphs, emphasize with bold or italics the key concepts and points you are making in them.
	For the image layout strategies, include analysis on the idea of using a separate AI-assisted visual image collage creation tool that would handle different aspect ratios and help with cropping and framing and then be also might output the collage as a single image that would then be very easy to embed in the final presentation and also reduce its total file size.
	For technical deployments and practical suggestions please find online blog posts or other material where the approach you recommend is well documented and found effective. For example I am not immediately convinced the Markdown + Pandoc/Presenti approach is popular and has such resources available.


2026-03-23 Gemini's Text-Encoded Slide Production: 2026 Guide
-------------------------------------------------------------

### 1. Modern Presentation Frameworks
| **Framework**  | **Formats**             | **Strengths**               | **Tradeoffs**             | **Popular Among**     |
|:---------------|:------------------------|:----------------------------|:--------------------------|:----------------------|
| **Slidev**     | MD/Vue -> HTML/PDF      | Live coding, Vue, Sleek UI  | Complex JS learning curve | Devs, Tech Speakers   |
| **Marp**       | MD -> PDF/HTML/PPTX     | Fastest MD-to-slides, CSS   | Limited layout control    | Minimalists, Managers |
| **Quarto**     | MD/qmd -> Reveal/Beamer | Academic, R/Py, Pro math    | Massive install, complex  | Scientists, Academics |
| **Reveal.js**  | HTML/CSS -> Browser     | Infinite web flexibility    | Requires manual coding    | Designers, Web Pros   |
| **Patat**      | MD -> Terminal/ANSI     | CLI-native, no distractions | No images, terminal fonts | Hackers, CLI Fans     |
| **Presenterm** | MD -> Terminal (Rust)   | High-perf, Rust-based, fast | Niche, terminal-bound     | Terminal Power Users  |


#### Design Philosophies

* **Slidev — The "Hacker's Beamer" for web**: Slides as a web app. Every slide is a Vue component, allowing for live interactive demos. Beamer users will appreciate the strict content/style split but enjoy the "live-reloading" browser preview that eliminates the edit-compile-PDF wait time.
* **Marp — The "Fast-Draft" Markdown standard**: Markdown as a first-class citizen. It uses a custom engine to turn headers and bullets into slides instantly. It is the closest modern tool to Beamer's simplicity but trades Beamer's complex typesetting for modern CSS speed.
* **Quarto — The true scientific heir to Beamer**: Computational reproducibility. It is built for "Power Academics" who need BibTeX, cross-references, and executable code. It renders to high-end Reveal.js HTML or classic Beamer PDF, making it the most versatile hybrid.
* **Reveal.js — The foundational web canvas**: The Browser is the Stage. It is a library, not just a format. While Beamer is rigid and linear, Reveal.js allows for non-linear "2D" navigation (up/down/left/right) and 3D transitions that are impossible in static PDF formats.
* **Patat — The distraction-free CLI presenter**: Minimalism through the shell. It renders Markdown directly in your ANSI terminal. It is for those who find even a browser too bloated. It mirrors the "text-only" ethos of early LaTeX but removes the compilation overhead entirely.
* **Presenterm — The high-performance Rust engine**: Speed and safety in the terminal. Written in Rust, it provides smooth animations and high-performance rendering within a terminal emulator. It is the modern alternative for speakers who present entirely from a CLI environment.


### 2. AI Model Comparison for Slide Logic
| **Model**        | **Specialty**        | **Max Context** | **Workflow Role**         |
|:-----------------|:---------------------|:----------------|:--------------------------|
| **Claude 4.6**   | Layout & UI Code     | 1M Tokens       | Architectural Scaffolding |
| **Gemini 3 Pro** | Massive Synthesis    | 2M+ Tokens      | Discovery & Outline       |
| **Grok 4**       | Technical Precision  | 128K+ Tokens    | Technical Auditing        |
| **Llama 4**      | General Reasoning    | 10M Tokens      | Private Local Drafting    |
| **DeepSeek V4**  | Advanced Coding/Math | 1M Tokens       | Logic & Code Debugging    |


#### Elaboration

* **Anthropic Claude 4.6 — The Architect**: It possesses a superior "aesthetic sense" for layout. When generating CSS for Marp or Slidev, it creates modern, professional designs. It is the most reliable model for following complex multi-file structural rules during the build phase.
* **Google Gemini 3 Pro — The Librarian**: The context king. It can ingest a 1,000-page manual and extract a coherent 15-slide deck outline instantly. Use this during the "Discovery Phase" to ensure no technical detail from your source documentation is overlooked.
* **xAI Grok 4 — The Engineer**: Excels at logical flow and technical rigor. It is particularly adept at generating error-free LaTeX math environments or Python snippets for Quarto. Use it to audit the factual consistency of your technical arguments.
* **Llama 4 Maverick — The Local Scout**: Running via Ollama, it provides frontier-level reasoning with total data privacy. With its massive context window, it can synthesize local codebases into slide content without ever sending your IP to a third-party cloud.
* **DeepSeek V4 — The Logic Specialist**: The global leader in code and math reasoning efficiency. It is the optimal choice for generating the actual underlying logic or data-science code (R/Python/Julia) that you intend to embed within a Quarto presentation.


### 3. Integrated Optimal Workflow
The 2026 workflow maximizes efficiency by matching the AI interface to the specific phase of production:

* **Phase 1: Ideation (Cloud AI Chat)**: Use **Gemini** or **Grok** via their web interfaces to brainstorm themes and extract outlines from large documents. Their massive context and real-time search are best for "Zero-to-One" drafting of the slide structure.
* **Phase 2: Scaffolding (Claude Code CLI)**: Initiate the project via the **Claude Code** agentic terminal. Commands like *"Initialize a Slidev project using this outline and create a dark theme"* allow the AI to autonomously create the file structure and install dependencies.
* **Phase 3: Iterative Design (Cursor IDE)**: Open the project in **Cursor**. This is where you refine specific slides. Use the IDE's model-switcher to use **Claude 4.6** for CSS/layout tweaks and **GPT-5.2** for prose refinement. The visual diffs ensure you see every change before saving.
* **Phase 4: Privacy & Logic (Ollama CLI)**: Use **Ollama** locally to handle sensitive data or to run specialized models like **DeepSeek V4** for complex math debugging. It allows for "Off-Grid" refinement and ensures high-logic tasks don't deplete your cloud API quotas.


2026-04-01 Claude Sonnet 4.6 on AI-Assisted Slide Presentation Approaches and Tools
-----------------------------------------------------------------------------------

### Overview: The Paradigm Shift from Drawing to Encoding
The landscape of presentation creation has shifted from pixel-pushing in GUIs to programmatic, text-encoded workflows. The modern stack decouples content from layout, enabling plain-text drafting while AI handles spatial distribution, image scaling, and branding. __Four philosophical approaches dominate__: **text-encoded frameworks** (longevity, versioning), **agentic AI generators** (narrative speed), **ecosystem-integrated assistants** (enterprise compatibility), and **hybrid conversion pipelines** (flexibility).
| Approach     | Representative Tools      | Core Strength     | Technical Logic |
|:-------------|:--------------------------|:------------------|:----------------|
| Text-Encoded | Marp, Quarto, Slidev      | Longevity & Git   | Markdown/CSS    |
| Agentic      | Gamma, Alai, PageOn       | Narrative Speed   | LLM Agents      |
| Ecosystem    | Copilot, Gemini, Canva AI | Enterprise Native | API Integration |
| Hybrid       | Pandoc, Presenti AI       | Draft-to-PPTX     | AST Conversion  |
| Terminal     | Presenterm, Lookatme      | CLI-Native TUI    | Sixel/Kitty     |


### Text-Encoded Frameworks: Presentation-as-Code
| Tool       | Engine    | Image Layout      | Export Formats  | Linux Install     |
|:-----------|:----------|:------------------|:----------------|:------------------|
| Marp       | Marpit    | BG directives/CSS | PDF, HTML, PPTX | npm / VS Code ext |
| Quarto     | Reveal.js | layout-ncol grid  | HTML, PDF, PPTX | .deb installer    |
| Slidev     | Vite/Vue  | UnoCSS grid/flex  | SPA, PDF, PNG   | npm               |
| Presenterm | Rust/TUI  | Kitty/Sixel cols  | Terminal, PDF   | cargo / binary    |


* **Marp — Lightweight developer standard for version-controlled decks**: Extends Markdown with directives (no raw HTML); the ``bg`` keyword auto-tiles or splits slides for 1–4 images. Best for decks that must remain readable for years in any text editor. Install via ``npm install -g @marp-team/marp-cli`` or the VS Code extension.
* **Quarto — Scientific publishing with deterministic grid layouts**: Built on Pandoc and Reveal.js; the ``layout-ncol`` attribute auto-arranges images into balanced grids (e.g., ``layout-ncol=2`` → 2×2 for four images). Executes Python/R/Julia inline and renders output into slides. Native ``.deb`` installer for Linux.
* **Slidev — Developer-grade interactive web slides**: Combines Markdown with Vue.js components; uses UnoCSS (``grid grid-cols-2 gap-4``) for complex text-plus-image layouts. Exports as a hostable SPA (GitHub Pages, Netlify) or PDF.
* **Presenterm — Terminal-native TUI slideshow**: Written in Rust; renders Markdown in-terminal using Kitty or Sixel protocols for pixel-perfect images. Ideal for live technical talks with integrated code execution. Requires Kitty, Wezterm, or Ghostty terminal.


### Advanced Image Layout Strategies in Text-Encoded Workflows
| Feature      | Marp Method        | Quarto Method     | Slidev Method     | Presenterm     |
|:-------------|:-------------------|:------------------|:------------------|:---------------|
| 2×2 Grid     | Multiple ``!bg``   | ``layout-ncol=2`` | ``grid-cols-2``   | Column config  |
| Split Screen | ``bg left/right``  | ``.columns`` div  | ``.split`` layout | Defined widths |
| Image Scale  | ``width:`` keyword | ``{width=50%}``   | CSS ``width``     | Terminal units |
| Overlays     | CSS ``position``   | Absolute pos      | Vue components    | N/A            |


* **Marpit BG directives**: Marking images with ``![bg](img.jpg)`` sets them as backgrounds; multiple ``bg`` images auto-stack horizontally or vertically. Ideal for 1–4 images with zero manual sizing.
* **Quarto ''layout-ncol''**: Wrap image refs in a div with ``{layout-ncol=2}`` for automatic grid formation. Removes all manual resizing and enforces visual consistency.
* **Slidev UnoCSS grid**: ``<div class="grid grid-cols-2 gap-4">`` enables non-standard patterns (e.g., three images right, explanatory text left). Most flexible for mixed content.
* **Presenterm column layouts**: Column widths defined in the Markdown YAML header or via slide separators. Critical for readability in horizontally constrained terminal environments.


### The Collage Strategy: AI-Assisted Image Pre-Processing
For 1–4 images per slide, pre-processing into a single composite image bypasses layout complexity in any tool, reduces file size, and ensures consistent visual weight.

* **CapCut Web (Seedream 4.0) — Generative scene synthesis**: Neural-network harmonization of lighting and color across multiple source images; outputs a unified professional banner. Browser-based, no install.
* **Pixazo / Venngage — Intelligent panel arrangement**: Analyzes panel count and framing; exports balanced WebP/PNG composites instantly. Keeps final deck lightweight.
* **Evoto / Fotor — Subject-aware AI crop**: Detects main subject per image and crops consistently; ensures uniform visual weight across a 1–4 image set without manual resizing.


### Diagramming-as-Code: Text-Encoded Technical Illustrations
| Diagram Type | Tool     | Syntax Style     | Primary Usage    | AI Generation |
|:-------------|:---------|:-----------------|:-----------------|:--------------|
| Flowchart    | Mermaid  | ``graph TD``     | Process logic    | Excellent     |
| Sequence     | PlantUML | ``Alice -> Bob`` | API/auth flow    | Good          |
| ERD          | Mermaid  | ``erDiagram``    | Data modeling    | Excellent     |
| Org Chart    | D2       | ``x -> y``       | Hierarchy        | Good          |
| Gantt        | Mermaid  | ``gantt``        | Project schedule | Excellent     |
| Network/DAG  | Graphviz | DOT language     | Math graphs      | Moderate      |


* **Mermaid.js — Lightweight modern standard**: Markdown-inspired syntax; natively supported by Marp, Quarto, Slidev, and Presenterm. AI assistants (including Claude) reliably generate syntactically correct Mermaid blocks from raw prose descriptions. Paste directly into any text-encoded deck.
* **PlantUML — Enterprise UML powerhouse**: More verbose but strictly UML-compliant; preferred where architectural accuracy is mandatory. Requires Java on Linux. Integrates with Pandoc-based pipelines via pre-processors.
* **Graphviz (DOT) — Academic graph precision**: Automated layout algorithm minimizes edge crossings; gold standard for complex network and mathematical graph visualization without manual intervention.


### Agentic AI Generators: Narrative Intelligence
| Tool         | Core Engine    | Design Level | Image Handling   | Best For          |
|:-------------|:---------------|:-------------|:-----------------|:------------------|
| PageOn.ai    | Agentic search | High         | Auto web-sourced | Research/data     |
| Alai         | Multi-layout   | High         | 4 variants/slide | Business/sales    |
| Gamma        | Web-native LLM | Modern       | Embedded/stock   | Async web sharing |
| Beautiful.ai | Smart rules    | Professional | Auto-realign     | High-speed pro    |
| Tome         | Storytelling   | Narrative    | Contextual       | Emotional pitch   |


* **PageOn.ai — Research-led storytelling**: Auto-performs web searches to source latest data and matching images. "AI Blocks" system snaps together content modules while AI handles layout. Strong for the 1–4 image requirement via automatic asset extraction.
* **Alai — Iterative multi-variant designer**: Provides four distinct layout options per slide, eliminating one-shot AI frustration. "Agent Mode" accepts natural language edits ("make the bottom-right image larger", "split into two slides") without breaking existing design.
* **Gamma — Web-native async storytelling**: Generates 10-slide decks with images in under a minute from a single prompt. Outputs responsive "Gams" usable as traditional slides or scrollable web pages. Native Salesforce/HubSpot data embedding.
* **Beautiful.ai — Constraint-based automatic layout**: "Smart Slides" enforce design rules; automatically realigns up to 4+ images to maintain professional proportions. Solves the blank-page problem while keeping informative slides legible.


### Ecosystem-Integrated Tools: Native AI for Corporate Workflows
| Tool        | Integration   | Primary AI Feature | PPTX Native? |
|:------------|:--------------|:-------------------|:-------------|
| Copilot     | MS PowerPoint | Word → PPTX        | Yes          |
| Gemini      | Google Slides | Prompt → Slide     | Yes          |
| Canva AI    | Web/Mobile    | Magic Design       | Export only  |
| Plus AI     | Add-on (both) | Slide remixing     | Yes          |
| MagicSlides | Add-on        | YouTube/MD → Slide | Yes          |


* **Microsoft Copilot for PowerPoint — Document-to-deck automation**: Transforms Word documents into full PPTX while preserving structure and key points. Saves hours of manual copy-paste for internal reporting. Criticized for weak visual creativity vs. Gamma.
* **Gemini for Google Slides — Cloud-native image generation**: Generates custom imagery via Google's latest image models directly in Slides; useful when stock photos are insufficient for a technical point.
* **Canva AI (Magic Design) — Creative asset powerhouse**: Generates full presentations from a single prompt using 100M+ stock assets. "Layouts" feature suggests real-time arrangements for 1–4 uploaded images while maintaining brand consistency.
* **Plus AI — Professional remix add-on**: Layers on top of Google Slides and PowerPoint; focuses on "remixing" existing content into more effective layouts. Preferred by consultants needing more design flexibility than native Copilot/Gemini.


### The Hybrid Bridge: Text Drafting to Visual Refinement
| Conversion Path  | Tool        | Editability   | Speed      |
|:-----------------|:------------|:--------------|:-----------|
| MD → PPTX        | Pandoc      | High (native) | High (CLI) |
| MD → AI PPTX     | Presenti AI | High (online) | High (web) |
| MD → PPTX        | MagicSlides | High (add-on) | High (web) |
| MD → PDF         | Marp CLI    | Low (static)  | Instant    |
| Word → PPTX      | Copilot     | High (native) | High (app) |
| MD → chat refine | SlideSpeak  | Medium (chat) | Fast (web) |


* **Pandoc + reference-doc workflow — Professional automation standard**: Install via ``sudo apt install pandoc``. The ``--reference-doc`` flag applies corporate branding, fonts, and slide masters to generated PPTX. Enables 90% text-editor work, 10% PowerPoint tweaking. Documented comprehensively in Thomas Mailund's *Introducing Markdown and Pandoc* (ISBN 9781484248326).
* **Presenti AI — Smart Markdown-to-PPTX conversion**: LLM analyzes Markdown structure to decide which slides need images, charts, or specific layouts. Supports embedded Mermaid and PlantUML. Designed for technical writers who must remain in Markdown but deliver polished PPTX.
* **SlideSpeak — Chat-driven document transformation**: Upload Markdown or Word files; refine via chat interface. Fast at summarizing large documents into concise slides. Prioritizes preparation speed over complex design control.
* **MagicSlides — Seamless Markdown/YouTube-to-PPT bridge**: Maintains Markdown structural fidelity while applying professional themes. Outputs to Google Slides or PowerPoint. Unique YouTube-to-slide pipeline for media-rich content.


### Technical Deployment and Environment Management
| Deployment    | Recommended Tool | Environment  | Key Requirement   |
|:--------------|:-----------------|:-------------|:------------------|
| Desktop CLI   | Marp / Pandoc    | Terminal     | Node.js / apt     |
| IDE-centric   | Quarto / Slidev  | VS Code      | Extension plugins |
| Terminal-only | Presenterm       | CLI          | Kitty/Sixel term  |
| Web-based     | Gamma / Alai     | Browser      | Internet access   |
| Web hosting   | Slidev / Quarto  | GitHub Pages | SPA export        |


* **VS Code as central hub**: The "Marp for VS Code" extension provides live preview and one-click PDF/PPTX export. Quarto and Slidev also use VS Code as the primary IDE with dedicated extension support.
* **Pandoc-MCP server — Agentic CLI control**: Model Context Protocol (MCP) integration allows AI (e.g., Claude) to write Markdown files and command a local Pandoc server to convert them to PPTX automatically. Documented in ``mcp-pandoc-md2pptx`` and on FastMCP. Automates the entire hybrid workflow end-to-end.
* **Terminal emulator selection for Presenterm**: Kitty, Wezterm, and Ghostty are the recommended terminals; they support Kitty and Sixel image protocols for pixel-perfect in-terminal image rendering. Standard terminals (gnome-terminal, xterm) will not render images.
* **SPA hosting**: Slidev and Quarto export presentations as Single Page Applications deployable to GitHub Pages or Netlify. A URL-sharable deck that behaves like a modern website is a powerful stakeholder delivery format.


### Automated MCP Pipeline Architecture
The Pandoc-MCP integration represents the frontier of fully automated slide generation. An AI agent writes a Markdown file locally, invokes the MCP Pandoc server, and receives a branded PPTX — with zero manual intervention.

* **Workflow**: Prompt AI → AI writes ``.md`` → MCP server runs ``pandoc --reference-doc=brand.pptx input.md -o output.pptx`` → branded PPTX on disk.
* **Key projects**: ``pandoc-markdown-to-powerpoint`` MCP server (FastMCP registry); ``mcp-pandoc-md2pptx`` (documented on Skywork.ai).
* **Diagram integration**: Mermaid/PlantUML blocks in the Markdown source are pre-rendered to PNG before Pandoc conversion, or handled via Quarto's native diagram execution pipeline.
* **Limitation**: Pandoc-generated PPTX uses flat image rendering; advanced animations and SmartArt require post-conversion manual editing in PowerPoint.


### Strategic Recommendations by Workflow Type

* **Longevity and Speed (recommended default)**: **Quarto + Mermaid on Linux**. ``layout-ncol`` handles 1–4 images with mathematical precision; Mermaid diagrams are AI-generated from prose; ``.deb`` install is trivial; output is Git-versionable and readable indefinitely.
* **Hybrid stakeholder delivery**: **Marp or Pandoc on Linux**. Draft in any text editor; export to editable PPTX via ``marp --pptx`` or ``pandoc --reference-doc``. Mailund's book is the canonical reference for the Pandoc path.
* **Rapid visual success (lowest friction)**: **CapCut Web → Gamma or Alai**. Pre-process 1–4 images into a single composite in CapCut; drop into Gamma or Alai for instant narrative structure. No Markdown knowledge required.
* **Developer/live-demo path**: **Presenterm on Linux with Kitty terminal**. Git-versioned, terminal-native, supports live code execution inline. Best for technical teaching where leaving the terminal breaks flow.
* **Pure agentic speed**: **Gamma or PageOn.ai (browser)**. Lowest friction for stakeholders who need a web-shareable or exportable deck from a single prompt. Sacrifices fine-grained layout control for narrative coherence and generation speed.


### Resources

1. 20 Best AI Slides Agents in 2025: Complete Comparison Guide | by ..., accessed April 1, 2026, <https://medium.com/@shawnawangstudio/20-best-ai-slides-agents-in-2025-complete-comparison-guide-a4e28c7e52d2>
2. Markdown Presentations or Slides - Simon Späti, accessed April 1, 2026, <https://www.ssp.sh/brain/markdown-presentations-or-slides/>
3. From Markdown to Masterpiece: A Deep Dive into the Pandoc-to-PPTX MCP Server - Skywork.ai, accessed April 1, 2026, <https://skywork.ai/skypage/en/markdown-pandoc-pptx/1980477447000596480>
4. Best AI Presentation Makers 2026 Compared | PageOn.AI, accessed April 1, 2026, <https://www.pageon.ai/blog/best-ai-presentation-maker>
5. The Top 10 Best AI Presentation Makers in 2026 | The Beautiful Blog, accessed April 1, 2026, <https://www.beautiful.ai/blog/best-ai-presentation-makers>
6. The Top 10 AI Presentation Tools in 2025 - LG Networks, Inc., accessed April 1, 2026, <https://lgnetworksinc.com/the-top-10-ai-presentation-tools-in-2025/>
7. Free Markdown to Presentation AI Converter - Presenti AI, accessed April 1, 2026, <https://presenti.ai/markdown-to-presentation/>
8. The Best AI Presentation Tools in 2026 - I tested all of them so you don't have to - Reddit, accessed April 1, 2026, <https://www.reddit.com/r/powerpoint/comments/1pjtkfh/the_best_ai_presentation_tools_in_2026_i_tested/>
9. Creating slides with Markdown using Marp | Dissociated Press, accessed April 1, 2026, <https://dissociatedpress.net/2023/01/24/creating-slides-with-markdown-using-marp/>
10. Gamma vs PageOn.ai: Which AI Presentation Tool Is Better?, accessed April 1, 2026, <https://www.pageon.ai/blog/gamma-vs-pageon>
11. Top 5 AI Tools for Document-to-Slide Conversion - Quizcat AI, accessed April 1, 2026, <https://www.quizcat.ai/blog/top-5-ai-tools-for-document-to-slide-conversion>
12. PlantUML vs Mermaid: Which Tool Is Best for Sequence Diagrams in ..., accessed April 1, 2026, <https://jimmywongiot.com/2025/08/28/plantuml-vs-mermaid-which-tool-is-best-for-sequence-diagrams-in-markdown/>
13. Converting system design text into flow diagrams with nice look and feel (beyond Mermaid.js basics) - Reddit, accessed April 1, 2026, <https://www.reddit.com/r/ExperiencedDevs/comments/1q5dfwg/converting_system_design_text_into_flow_diagrams/>
14. GitHub - mermaid-js/mermaid: Generation of diagrams like flowcharts or sequence diagrams from text in a similar manner as markdown, accessed April 1, 2026, <https://github.com/mermaid-js/mermaid>
15. 10+ Best AI Presentation Makers of 2026: I Tested & Ranked Every Major Tool | Alai Blog, accessed April 1, 2026, <https://getalai.com/blog/best-ai-presentation-makers>


