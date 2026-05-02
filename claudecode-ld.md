# ClaudeCode-LD
Created Saturday 21 March 2026

TODO: <https://claude.ai/chat/bf0a9695-f54b-48a7-90be-6a3347abb6ec>

	Task: Write a Zim-wiki learning diary entry that summarizes your previous answer (TOPIC: Claude Learning Plan). Output ONLY the raw entry — no prose wrapper, no markdown fences.
	Make it concise and add links to relevant official and community projects that provide further learning.
	
	Structure:
	* Line 1: ===== YYYY-MM-DD MODEL on TOPIC ===== (ISO date; your model name; topic as a short slug)
	* Line 2: Tags: #tag1 #tag2 #tag3 (3–6 relevant tags)
	* Body: start with the big picture; go deeper section by section; for comparisons, lead with a table, then explanatory bullets
	
	Style:
	* Dense and informative; no prefaces, bridges, or conversational filler
	* Prefer bullets over paragraphs; bullet pattern: * **[Name] — [tagline]**: [2–5 sentence dense elaboration]
	* Professional, technical, unbiased tone; all body headings at ==== level or lower
	
	Zim syntax (not Markdown — use these exactly):
	* Bullets: * (never -)     Bold: **text**     Italic: //text//
	* Inline verbatim: ''text''     Multiline verbatim: '''...'''
	* H2: ===== Heading =====     H3: ==== Heading ====
	* Tables: | col | col | with a |---|---| separator row; cell ≤60 chars, row ≤120 chars


Dos and Don'ts for Cost Efficiency and Effectiveness
----------------------------------------------------
| Impact     | Do                                                                | Do not                                               | Why                                                                    |
|------------|-------------------------------------------------------------------|------------------------------------------------------|------------------------------------------------------------------------|
| **High**   | **Use /clear or /compact** on long threads                        | Stay in a long "dead" session                        | Every new token sends full history; cost stacks up fast                |
| **High**   | **Batch related tasks** in one message                            | Split related fixes into separate turns              | One turn is cheaper than several for the same work                     |
| **High**   | **Use Plan Mode** before big codegen                              | Start huge generations without a reviewed plan       | Surfaces expensive mistakes for a fraction of the cost                 |
| **High**   | **Verify the plan** (bullet the intended edits first)             | Let the model start writing with no agreed scope     | Catches costly mistakes before code is generated                       |
| **Medium** | **Modularize files** (≈300–500 lines per file)                    | Rely on one huge file as the main context            | Re-reading a giant file costs more over time than several smaller ones |
| **Medium** | **Watch the console; interrupt** if it loops or reads wrong files | Ignore runaway tool use                              | Ctrl+C stops unnecessary token burn                                    |
| **Medium** | **Give explicit paths** (e.g. ``src/logic.py``)                   | Invite vague "find it in the repo" exploration       | Cuts expensive recursive searching                                     |
| **Medium** | **Scope questions** (folder, files, goal)                         | Ask open-ended "what do you think of my project?"    | Unbounded prompts can trigger huge directory reads                     |
| **Medium** | **Keep CLAUDE.md current** with key paths and conventions         | Let repo context drift out of the auto-loaded file   | Auto-loaded context avoids re-reading the same files across sessions   |
| **Low**    | **Use sub-agents** for large isolated reads                       | Dump large files directly into the main conversation | Sub-agents protect the main context window from token bloat            |
| **Low**    | **Run /usage** during a session                                   | Ignore what the session is costing                   | Shows current spend and token count so you can adjust                  |


FIXME:

Daily practices:
□ Use /status to monitor context and cost
□ Compact at 70% context usage
□ Close sessions after task completion
□ Use `permissions.deny` to block sensitive files
Model selection:
□ Default to Sonnet for most work
□ Use Haiku for reviews and simple fixes
□ Reserve Opus for architecture and critical debugging
□ Try OpusPlan mode for strategic work
Context management:
□ Use specific file references (@path/to/file.ts)
□ Batch similar tasks in single session
□ Reuse context for multiple related tasks
□ Create specialized agents with focused context
Team practices:
□ Share cost-effective patterns in team wiki
□ Track spending per project
□ Set budget alerts for high-cost operations
□ Review cost metrics in retrospectives

Notes
-----
Sources:

* <https://docs.anthropic.com/en/docs/claude-code/common-workflows>
* <https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices>
* <https://www.humanlayer.dev/blog/writing-a-good-claude-md>
* <https://github.com/FlorianBruniaux/claude-code-ultimate-guide>
* <https://github.com/anthropics/claude-cookbooks/tree/main>

/effort
CLAUDE_CODE_EFFORT_LEVEL
ultrathink
export MAX_THINKING_TOKENS=10000 — Set a large max output token budget (64k tokens recommended) at medium or high effort to give the model room to think and act

#### Adaptive thinking
	client.messages.create(
	    model="claude-opus-4-6",
	    max_tokens=64000,
	    thinking={"type": "adaptive"},
	    output_config={"effort": "high"},  # or max, medium, low
	    messages=[{"role": "user", "content": "..."}],
	)


#### Claude.md
Frontier thinking LLMs can follow ~ 150-200 instructions with reasonable consistency. Smaller models can attend to fewer instructions than larger models, and non-thinking models can attend to fewer instructions than thinking models.
LLMs bias towards instructions that are on the peripheries of the prompt: at the very beginning (the Claude Code system message and CLAUDE.md), and at the very end (the most-recent user messages)
As instruction count increases, instruction-following quality decreases uniformly.

Keep Claude.md under 50 lines.

Important: Beyond file size, context files containing non-essential information (style
guides, architecture descriptions, general conventions) add +20-23% inference cost per
session regardless of line count — because agents process and act on every instruction.
The same research confirms that LLM-generated context files reduce task success by
~3%, while developer-written files improve it by ~4%. (Gloaguen et al., 2026)

9.16.3 Command Output Optimization with RTK
RTK (Rust Token Killer) filters bash command outputs before they reach Claude’s context,
achieving 60-90% token reduction across git, testing, and development workflows. 446 stars,
38 forks, 700+ upvotes on r/ClaudeAI.

