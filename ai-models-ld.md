# AI-Models-LD
Created Thursday 26 March 2026

2026-03-26 Claude Sonnet 4.6 on Overview of Open Source AI Models for Use On A Laptop
-------------------------------------------------------------------------------------

### Reference Hardware: pone (Dell Precision P7510)

* **CPU**: Intel Xeon E3-1535M v5 — 4c/8t Skylake, 2.90/3.80 GHz, DDR4-2133 dual-channel ECC
* **RAM**: 32 GB (2×16 GB SK Hynix HMA82GS7MFR8N-TF) — ~34 GB/s theoretical bandwidth; the primary inference bottleneck
* **GPU**: Quadro M2000M — Maxwell GM107, CC 5.0, 640 CUDA cores, 4 GB GDDR5 @ 80 GB/s; **requires custom llama.cpp build** with ``-DCMAKE_CUDA_ARCHITECTURES=50`` (default minimum is cc52); Vulkan backend is the easier path
* **OS**: Ubuntu 26.04 LTS (Linux)
* **Bottleneck summary**: Memory bandwidth limits TPS more than FLOPS. CPU path: ~34 GB/s DDR4. GPU VRAM path: 80 GB/s but only 4 GB; overflow to CPU RAM collapses throughput 5-30×


### Key Concepts

* **Open weights vs. open source** — Most "open source" LLMs are open-weight only: weights are public, but licenses may restrict commercial use or redistribution (e.g. Llama 3.x non-commercial clauses). True OSI-compliant models include Mistral 7B (Apache 2.0) and Qwen 2.5 (Apache 2.0).
* **Quantization** — Reduces per-parameter storage from FP16 (2 B) to Q8 (1 B), Q4 (~0.5 B), Q2 (~0.25 B). Q4_K_M is the standard sweet spot: near-lossless quality at ~55% size of FP16. GGUF is the de facto standard format for quantized local inference.
* **Memory bandwidth as bottleneck** — TPS scales almost linearly with memory bandwidth, not compute. A higher-bandwidth older GPU (e.g. P40 @ 347 GB/s) outgenerates a slow newer one. For pone, GPU VRAM bandwidth (80 GB/s) is 2.4× CPU RAM bandwidth (34 GB/s).
* **Partial GPU offload** — If the model exceeds VRAM, remaining layers run on CPU. Performance degrades severely (5–30×) once overflow starts. For pone's 4 GB VRAM: full offload only for ≤3.5 GB models; partial helps 7B at modest speedup.
* **MoE (Mixture of Experts)** — Activates only a subset of parameters per token (e.g. DeepSeek-V3 uses 256 experts but activates only a few). MoE reduces compute but still requires all experts in memory, limiting utility for small-VRAM setups.
* **Context window and KV cache** — KV cache grows linearly with context. At 32K context, an 8B model Q4_K_M needs ~5 GB extra VRAM for KV cache; at 4K context, ~0.6 GB. For pone, keep context ≤4K for 7B GPU offload.


### Inference Runtimes

* **llama.cpp — universal C/C++ inference engine**: Gold standard for CPU and hybrid CPU/GPU inference. GGUF format, supports AVX2/AVX-512. For pone, use Vulkan backend (``cmake -DGGML_VULKAN=on``) or CUDA with ``-DCMAKE_CUDA_ARCHITECTURES=50`` patch. Most other tools wrap this.
* **Ollama — one-command model management**: Wraps llama.cpp, provides OpenAI-compatible REST API, auto-downloads GGUF models. Best for quick setup. ``ollama run llama3.2`` starts inference immediately. Supports Vulkan on Linux.
* **LM Studio — GUI model browser**: Desktop app for model discovery, side-by-side comparison, local server. Good for evaluation workflows; less suited for headless/server use.
* **vLLM — GPU-optimized high-throughput backend**: Requires dedicated NVIDIA/AMD GPU and Linux. Overkill for single-user pone use; relevant if pone is used as a shared inference server.
* **Jan — offline assistant platform**: ChatGPT-style UI wrapping Cortex (llama.cpp). Supports hybrid local+cloud switching, MCP for agentic workflows.


### Model Comparison Table
Quant column: recommended for pone. TPS@pone: CPU-only estimate unless noted; GPU-assist column noted separately. All estimates based on DDR4-2133 dual-channel (~34 GB/s) benchmarks for comparable Xeon/server CPUs and community benchmarks.
| **Model**                     | **Params** | **SizeGB** | **Quant** | **TPS@pone** | **License** | **Strengths**      |
|-------------------------------|------------|------------|-----------|--------------|-------------|--------------------|
| SmolLM2-1.7B-Instruct         | 1.7B       | ~1.1       | Q4_K_M    | 20–30        | Apache 2.0  | Speed, on-device   |
| Gemma 3 1B                    | 1B         | ~0.7       | Q4_K_M    | 25–40        | Gemma ToU   | Tiny footprint     |
| Qwen 2.5 1.5B                 | 1.5B       | ~1.0       | Q4_K_M    | 22–32        | Apache 2.0  | Code, multilingual |
| DeepSeek-R1-Distill-Qwen-1.5B | 1.5B       | ~1.0       | Q4_K_M    | 20–30        | MIT         | Reasoning distill  |
| Phi-4 Mini (3.8B)             | 3.8B       | ~2.4       | Q4_K_M    | 10–16        | MIT         | Reasoning, coding  |
| Gemma 3 4B                    | 4B         | ~2.5       | Q4_K_M    | 9–15         | Gemma ToU   | Multimodal         |
| Qwen 2.5 7B                   | 7B         | ~4.7       | Q4_K_M    | 4–7          | Apache 2.0  | Best 7B overall    |
| Llama 3.1 8B                  | 8B         | ~5.0       | Q4_K_M    | 4–6          | Llama 3 ToU | Ecosystem, tooling |
| Mistral 7B v0.3               | 7B         | ~4.4       | Q4_K_M    | 4–7          | Apache 2.0  | Fully open license |
| DeepSeek-R1-Distill-Llama-8B  | 8B         | ~5.0       | Q4_K_M    | 3–6          | MIT         | Strong reasoning   |
| Gemma 3 12B                   | 12B        | ~7.8       | Q4_K_M    | 2–4          | Gemma ToU   | Best <14B quality  |
| Qwen 2.5 14B                  | 14B        | ~9.0       | Q4_K_M    | 1.5–3        | Apache 2.0  | Strong coding      |

**GPU-assist note (pone Vulkan/CUDA cc50, 4 GB VRAM)**:

* Models ≤3.5 GB (SizeGB): full VRAM offload → 2–3× TPS boost (80 GB/s vs. 34 GB/s bandwidth ratio)
* 7B Q4_K_M (~4.7 GB): partial offload (~15–20 layers in VRAM) → modest gain ~1.3–1.6×, roughly 6–9 TPS
* 8B+: overflow to RAM dominates; partial offload not worth configuring without tuning


### Model Notes

* **SmolLM2-1.7B / Gemma 3 1B / Qwen 2.5 1.5B — sub-2B sweet spot**: These are the fastest usable models on pone, delivering >20 TPS for fluid interaction. SmolLM2 outperforms Llama 3.2-1B and Qwen 2.5-1.5B on several benchmarks despite being the same size class. Gemma 3 1B fits entirely in VRAM with room for KV cache.
* **Phi-4 Mini (3.8B) — best reasoning-per-byte at 4B class**: Microsoft's training on high-quality synthetic reasoning data yields performance disproportionate to size. ~2.4 GB Q4_K_M fits in pone's VRAM with context up to ~8K. Strong for code and math.
* **Qwen 2.5 7B — recommended daily driver for pone**: Apache 2.0 license, strong multilingual and coding capability, available in GGUF from HuggingFace. At ~4.7 GB, fits just over VRAM; run with ``--n-gpu-layers 20`` to partially offload hot layers and achieve ~6–8 TPS.
* **Llama 3.1 8B — ecosystem default**: Best tool/function-calling support, widest compatibility across Ollama/Jan/LM Studio. Non-commercial restriction in Meta's Llama 3 license (commercial use requires agreement). 4–6 TPS CPU-only on pone.
* **Mistral 7B v0.3 — most permissive 7B**: Apache 2.0, no commercial restriction. Slightly behind Qwen 2.5 7B in benchmarks but fully free for any use.
* **DeepSeek-R1 distills (1.5B, 8B) — reasoning on a budget**: Distilled from the 671B DeepSeek-R1 reasoning model via RL data. The 1.5B distill delivers surprisingly strong math/logic output; MIT licensed. The 8B distill outperforms Llama 3.1 8B on reasoning tasks.
* **Gemma 3 12B — quality ceiling for pone**: At ~7.8 GB Q4_K_M, runs entirely in RAM with ~2–4 TPS. Best output quality achievable on pone; use for non-interactive/batch tasks.


### Practical Setup for pone (Ubuntu 26.04)

* **Fastest path**: Install Ollama (``curl -fsSL https://ollama.com/install.sh | sh``), then ``ollama run qwen2.5:7b``. Ollama auto-selects Vulkan or CPU backend.
* **Vulkan build for GPU acceleration**:

  ``cmake -B build -DGGML_VULKAN=on && cmake --build build --config Release -j8``
  Vulkan works on Maxwell (CC 5.0) without the CUDA cc52 minimum issue.

* **CUDA build (non-standard, requires patch)**:

  Add ``-DCMAKE_CUDA_ARCHITECTURES=50`` to cmake args; Maxwell CC 5.0 is supported but not the default minimum (52) in llama.cpp CMakeLists. Use CUDA ≤12 (Maxwell dropped from some CUDA 12.x libs).

* **Recommended quantization**: Q4_K_M for 7B+; Q8_0 for 1–4B models where quality matters and RAM allows.
* **Context window**: Limit to 4096 for 7B models on pone to keep KV cache ≤0.7 GB and stay within manageable RAM.
* **Recommended model for daily use on pone**: ``qwen2.5:7b-instruct-q4_K_M`` via Ollama (Vulkan offload). Fallback to phi4-mini:3.8b for faster response.


### Limitations and Caveats

* TPS@pone figures are estimates derived from comparable CPU/memory-bandwidth benchmarks (Xeon server CPUs at DDR4-2133 quad/dual channel, community llama.cpp benchmarks). Actual results vary with thermal throttling, background load, and context length.
* pone's ECC RAM adds ~3–5% latency overhead vs. non-ECC; negligible for LLM TPS.
* Ubuntu 26.04 (LTS) is assumed to carry Mesa Vulkan drivers supporting Maxwell; verify with ``vulkaninfo | grep deviceName``.
* Models >13B are impractical on pone for interactive use (<2 TPS) but can run overnight or in batch mode.
* The open-weights model landscape evolves rapidly; model quality at each size class improves roughly every 6 months.


2026-03-26 Claude Sonnet 4.6 on Optimal Usage of Models on Linux
----------------------------------------------------------------

### Strengths, Weaknesses and Best Use Cases by Model
No model dominates all use cases. The key axes of variation are: reasoning depth vs. speed, code-specific training, context length, multilingual training data, and instruction-following fidelity. Larger models win on quality; smaller models win on TPS and interactivity.
**Use case key**: F4Research (research/synthesis), F4Strategizing (reasoning/analysis), F4Coding (code/dev), F4Text (writing/editing/docs), F4Translation (translation/summarization), F4Ops (filesystem/CLI/computer-use assistance)
**Rating scale**: ★★★ excellent / ★★ adequate / ★ weak / — not recommended
| **Model**                     | F4Research | F4Strat | F4Coding | F4Text | F4Trans | F4Ops |
|-------------------------------|------------|---------|----------|--------|---------|-------|
| SmolLM2-1.7B                  | ★          | ★       | ★        | ★★     | ★       | ★★    |
| Gemma 3 1B                    | ★          | ★       | ★        | ★★     | ★       | ★     |
| Qwen 2.5 1.5B                 | ★          | ★       | ★★       | ★★     | ★★      | ★★    |
| DeepSeek-R1-Distill-Qwen-1.5B | ★          | ★★      | ★★       | ★      | ★       | ★     |
| Phi-4 Mini (3.8B)             | ★★         | ★★★     | ★★★      | ★★     | ★       | ★★    |
| Gemma 3 4B                    | ★★         | ★★      | ★★       | ★★★    | ★★      | ★★    |
| Qwen 2.5 7B                   | ★★         | ★★      | ★★★      | ★★★    | ★★★     | ★★★   |
| Llama 3.1 8B                  | ★★         | ★★      | ★★       | ★★★    | ★★      | ★★★   |
| Mistral 7B v0.3               | ★★         | ★★      | ★★       | ★★★    | ★★      | ★★    |
| DeepSeek-R1-Distill-Llama-8B  | ★★         | ★★★     | ★★★      | ★★     | ★       | ★★    |
| Gemma 3 12B                   | ★★★        | ★★★     | ★★★      | ★★★    | ★★      | ★★★   |
| Qwen 2.5 14B                  | ★★★        | ★★★     | ★★★      | ★★★    | ★★★     | ★★★   |


### Per-Use-Case Analysis

* **F4Research — large-context synthesis and retrieval**: Requires long context window, strong instruction following, and factual coherence across many pages. Sub-4B models lose coherence and hallucinate on dense documents. Best: Gemma 3 12B (128K context), Qwen 2.5 14B. Practical on pone: Qwen 2.5 7B with 4K context chunks, fed iteratively via a RAG pipeline (e.g. llama-index + Ollama). Chunking compensates for small context limits.
* **F4Strategizing — multi-step reasoning and analysis**: Chain-of-thought and structured

  argumentation quality correlates strongly with both model size and reasoning-specific training. DeepSeek-R1 distills punch above their weight here: the 8B distill matches Llama 3.1 70B on MATH and AIME benchmarks. Phi-4 Mini (3.8B) is exceptional for its size on logic tasks. All sub-2B models are inadequate for non-trivial reasoning chains.

* **F4Coding — code generation, debugging, refactoring**: Code quality correlates with: (1) code-specific pretraining volume, (2) instruction tuning on dev workflows. Qwen 2.5 trained on ~trillion code tokens and leads the 7B class on HumanEval/MBPP. Phi-4 Mini is the best ≤4B coder. DeepSeek-R1 distills excel at algorithmic/competitive coding over conversational coding. Llama 3.1 8B has the richest tooling ecosystem (code-interpreter support, function calling).
* **F4Text — writing, editing, documentation**: Requires stylistic fluency, coherent long-form output, and format instruction following. Gemma 3 models (Google's RLHF pipeline) lead on prose quality at each size class. Llama 3.1 8B and Qwen 2.5 7B are also strong. DeepSeek-R1 distills are weaker here: reasoning training degrades prose fluency ("thinking tokens" leak into output). Sub-2B models are usable for short editing but drift on documents >500 words.
* **F4Translation — multilingual translation and summarization**: Depends entirely on multilingual pretraining data volume. Qwen 2.5 was trained on 29 languages with strong coverage of CJK, Arabic, and European languages; it leads this category at every size. Gemma 3 models (Google translate heritage) are the second-best option. Llama 3.1 and Mistral have weaker non-English training. For Finnish (relevant to pone's location), Qwen 2.5 7B and Gemma 3 4B+ are viable; sub-2B models are unreliable for morphologically complex languages like Finnish.
* **F4Ops — filesystem ops, CLI assistance, shell scripting, computer-use**: Requires strong function/tool-calling, JSON output fidelity, and practical sysadmin knowledge. Llama 3.1 8B has the best native tool-calling support (Meta's function-call training). Qwen 2.5 7B is close and also supports structured JSON outputs. For agentic shell/file tasks, combine any capable 7B+ model with a tool-use framework (e.g. Open Interpreter, Aider, or shell-gpt). Sub-3B models are unreliable for structured outputs required by tool-calling pipelines.
* **Is better in one = better in all?** No — the tradeoff is real: * DeepSeek-R1 distills outperform same-size models on F4Strategizing/F4Coding but underperform   on F4Text and F4Translation (reasoning training corrupts prose style). * Qwen 2.5 leads F4Translation at every size but its reasoning depth trails Phi-4 Mini at 3–4B. * Gemma 3 leads F4Text prose quality but lags Qwen 2.5 on code at equivalent sizes. * Phi-4 Mini is anomalously strong on F4Strategizing/F4Coding for 3.8B but weak on translation   and long-document research due to limited multilingual and long-context training. * For a single all-rounder on pone: **Qwen 2.5 7B** is the most balanced choice across all six   use cases, with no critical weaknesses.


2026-03-26 Claude Sonnet 4.6 on CLI and GUI Tools for Using Local Models on Linux
---------------------------------------------------------------------------------

### Inference Backends (must install first)

* **Ollama — the default starting point**: Single binary, manages model downloads and serving. Provides OpenAI-compatible REST API at ``localhost:11434``. Auto-detects Vulkan/CUDA/CPU. Install: ``curl -fsSL https://ollama.com/install.sh | sh`` — then ``ollama serve`` as a daemon. Most CLI/GUI tools below can point to Ollama as their backend.
* **llama.cpp (direct)**: Maximum control; needed when Ollama's abstraction is limiting. Build with Vulkan: ``cmake -B build -DGGML_VULKAN=on && cmake --build build -j8`` Run: ``./build/bin/llama-cli -m model.gguf -p "prompt" --n-gpu-layers 20`` Supports server mode (``llama-server``) for OpenAI-compatible API without Ollama overhead.


### CLI Tools

* **shell-gpt (sgpt) — pipe-native LLM in the terminal**: ``sgpt "explain this error" < log.txt`` or ``sgpt --shell "list large files"`` to generate and optionally execute shell commands. Supports Ollama backend via ``--base-url``. Best tool for F4Ops on pone. Install: ``pip install shell-gpt``
* **Aider — AI pair programmer in the terminal**: Operates directly on git repos; reads and edits files with model assistance. Supports Ollama backend (``aider --model ollama/qwen2.5:7b``). Best F4Coding tool for terminal workflows. Install: ``pip install aider-chat``
* **Open Interpreter — natural language shell agent**: Executes Python, shell, and JS code in a sandboxed loop. Supports Ollama via ``--api_base``. Use for F4Ops automation pipelines. Install: ``pip install open-interpreter``
* **llm (Simon Willison's CLI) — universal model client**: Minimal, composable; supports Ollama via plugin (``llm install llm-ollama``). Ideal for scripting and piping: ``cat file.txt | llm -m ollama/qwen2.5:7b "summarize"``. Good for F4Research batch workflows.
* **fabric — prompt pattern library + pipeline tool**: Collection of curated prompts for research synthesis, summarization, analysis, and writing. Integrates with Ollama. ``fabric --pattern summarize < article.txt``. Strong F4Research and F4Text companion. Install: ``go install github.com/danielmiessler/fabric@latest``


### GUI / Desktop Tools

* **Open WebUI — full-featured self-hosted chat UI**: Browser-based; connects to Ollama or any OpenAI-compatible backend. Supports RAG (document upload), tools, image generation, and multi-model switching. Best all-round local GUI. Docker: ``docker run -d --network=host -v open-webui:/app/backend/data ghcr.io/open-webui/open-webui:main``
* **Jan — offline desktop assistant (Electron)**: ChatGPT-style UI; bundles Cortex (llama.cpp). Supports MCP tool plugins for agentic use. Feels native; good for non-developer users. Download: ``jan.ai``. Less config than Open WebUI; less powerful for pipelines.
* **LM Studio — model browser and local server**: Polished GUI for downloading HuggingFace GGUF models, comparing outputs side-by-side, and running a local OpenAI API server. Best for model evaluation and discovery. Linux version available as AppImage.
* **Chatbox — lightweight cross-platform client**: Connects to Ollama or remote APIs. Minimal install, supports conversation history export. Good for F4Text and F4Translation daily use.


### Agentic / RAG Frameworks

* **llama-index + Ollama**: Python RAG framework. Index local files (PDF, markdown, code) into a vector store; query with local model. Best F4Research setup on pone. ``pip install llama-index llama-index-llms-ollama llama-index-embeddings-ollama``
* **LangChain / LangGraph**: More complex orchestration; supports multi-step agent loops. Heavier than llama-index for pure RAG; better for multi-tool agentic F4Ops workflows.
* **AnythingLLM**: Docker-based all-in-one: RAG + chat UI + Ollama integration. Good if Open WebUI + llama-index feels too fragmented.


### Recommended pone Toolchain by Use Case

* F4Research: Open WebUI (RAG mode) + Qwen 2.5 7B via Ollama; or llama-index + llm CLI
* F4Strategizing: Aider or Open WebUI + DeepSeek-R1-Distill-Llama-8B or Phi-4 Mini
* F4Coding: Aider + Qwen 2.5 7B (or 14B overnight batch)
* F4Text: Jan or Open WebUI + Gemma 3 4B (fast) or 12B (quality)
* F4Translation: Open WebUI + Qwen 2.5 7B; ``llm`` CLI for batch file translation
* F4Ops: shell-gpt + Ollama (Llama 3.1 8B for tool-calling); Open Interpreter for automation


TODO
----

* ☑ Install qwen2.5:7b with ``ollama pull qwen2.5:7b``
* ☐ Install Aider
* ☐ Install Open WebUI


