# End-to-end Agentic Planning with LLMs and PDDL

## Disclaimer
I would like this tool to improve over time.
I am happy to consider self-improvement, so an agentic tool like Codex that improves the general structure and proposes changes that are integrated as long as they improve the performance on salient tasks.
If anyone is interested in making this tool work with a wide range of planning problems, please clone it and pull request any changes.
In my mind, this can become a sort of open-source Planning Copilot.

Check the discussion (feel free to open a New Discussion!)
[Discussions](https://github.com/EmanueleLM/MultiAgentPlanning/discussions)

Check the Vision Issue:
[Vision](https://github.com/EmanueleLM/MultiAgentPlanning/issues/18)

If you want to contact me, send an email at emanuele.lamalfa@cs.ox.ac.uk


## Intro
This repository combines large language models with classical PDDL solvers to deliver an end-to-end agentic planning stack. Use it to experiment with automated planning workflows, integrate multiple planners/validators, and visualise executions through LangGraph + LangChain tooling.

If you want to better understand how the framework works, please read our article "An End-to-end Planning Framework with Agentic LLMs and PDDL", available <a href="https://arxiv.org/pdf/2512.09629">here</a>.

If you need to cite it, use this bibtex:
```
@misc{lamalfa2025endtoendplanningframeworkagentic,
      title={An End-to-end Planning Framework with Agentic LLMs and PDDL}, 
      author={Emanuele La Malfa and Ping Zhu and Samuele Marro and Sara Bernardini and Michael Wooldridge},
      year={2025},
      eprint={2512.09629},
      archivePrefix={arXiv},
      primaryClass={cs.AI},
      url={https://arxiv.org/abs/2512.09629}, 
}
```

The points of interest in this folder are the following:
- Folder ``src/`` contains the core implementation of our framework; you can read the details in the paper: <link>.
- Folder ``results/`` contains all the results for GPT-5-mini. 
- File ``script/plan.sh`` runs experiments (via ``./plan_benchmark.py`` for PDDL and ``./baseline.py`` for vanilla LLMs).
- File ``script/evaluate.sh`` evaluates the results with an LLM-as-a-judge (via ``./evaluate_pddl.py`` for PDDL and ``./evaluate_vanilla.py`` for vanilla LLMs).

## Index

- [Bootstrap Setup (Recommended)](#bootstrap-setup-recommended)
- [Environment Setup (Linux)](#environment-setup-linux)
  - [Python Environment](#python-environment)
  - [Fast Downward](#fast-downward)
  - [Universal Planning Validator (uVAL)](#universal-planning-validator-uval)
  - [VAL Plan Validator](#val-plan-validator)
  - [POPF2 Planner](#popf2-planner)
- [LangGraph and LangChain](#langgraph-and-langchain)
  - [Environment Variables](#environment-variables)
  - [LangGraph Definition](#langgraph-definition)
  - [LangChain Studio (Recommended)](#langchain-studio-recommended)
  - [Running the LangGraph Workflow](#running-the-langgraph-workflow)
- [Interactive Planning App](#interactive-planning-app)

## Bootstrap Setup (Recommended)

Prefer the automated bootstrap when targeting Linux:

1. Ensure the OS already has the build tooling used in the manual section below (git, wget, cmake, build-essential, gcc/g++, etc.).
2. From the project root run:
   ```bash
   python3 bootstrap.py
   ```
3. The script creates `.venv`, installs `requirements.txt`, downloads/builds Fast Downward, POPF2, uVAL, and VAL, and updates `config.json` so all solver/validator paths line up with the freshly built artifacts.
4. Activate the virtual environment whenever needed via `source .venv/bin/activate`.

If the bootstrap fails because of missing system packages or limited network access, continue with the manual instructions in the next section.

## Environment Setup (Linux)

### Python Environment
1. From the project root create and activate a virtual environment:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```
2. Install the Python requirements (includes `pytest` for testing):
   ```bash
   pip install -r requirements.txt
   ```
3. Whenever you open a new shell, re-run `source .venv/bin/activate` to enable the environment.

### Fast Downward

> **Config note:** If you install a release whose directory name differs from the default, update `solver_fd_binary` in `config.json` to point at the new `fast-downward.py` path.

1. Install prerequisites:
   ```bash
   sudo apt update
   sudo apt install -y build-essential cmake g++ python3 python3-venv wget
   ```
2. Create a solver directory and download the latest release:
   ```bash
   mkdir -p solvers && cd solvers
   wget https://www.fast-downward.org/latest/files/release24.06/fast-downward-24.06.1.tar.gz
   tar -xvzf fast-downward-24.06.1.tar.gz
   rm -f fast-downward-24.06.1.tar.gz
   cd fast-downward-24.06.1
   ```
3. Build Fast Downward:
   ```bash
   ./build.py
   ```
4. Try a sample plan (adjust paths to your domain/problem files):
   ```bash
   ./fast-downward.py --alias lama-first \
     ./../../results/StaticAgentsVault/preliminary/pddl-orchestrator/domain.pddl \
     ./../../results/StaticAgentsVault/preliminary/pddl-orchestrator/problem.pddl
   ```
   A successful run creates a `sas_plan` file alongside `fast-downward.py`. Example contents:
   ```
   (open-vault agent-a vault)
   (enter-vault agent-b vault)
   (grab-object agent-b obj1 vault)
   ; cost = 3 (unit cost)
   ```

### Universal Planning Validator (uVAL)

> **Config note:** When the repository path changes, adjust `universal_validator` and `universal_validator_bin` in `config.json` so the workflow launches the correct binaries.

1. Clone the validator inside `./solvers`:
   ```bash
   cd solvers
   git clone https://github.com/aig-upf/universal-planning-validator.git
   ```
2. Install `scons`:
   ```bash
   sudo apt install -y scons
   ```
3. Build:
   ```bash
   cd universal-planning-validator
   ./build.sh
   ```
4. Run the bundled tests to ensure the binary works:
   ```bash
   ./tests/test.bin
   ```
5. Validate a plan:
   ```bash
   ./solvers/universal-planning-validator/validator/validate.bin \
     -c domain_file.pddl problem_file.pddl plan_file
   ```

### VAL Plan Validator

> **Config note:** Point `validator` and `validator_bin` in `config.json` to the directory and binary you just extracted so plan validation can run.

1. Open https://dev.azure.com/schlumberger/ai-planning-validation/_build?definitionId=2 and download the most recent Linux artifact.
2. Unzip and extract the binaries, e.g.:
   ```bash
   unzip linux64.zip
   cd linux64/
   tar -xvzf Val-20211204.1-Linux.tar.gz
   cd Val-20211204.1-Linux/bin/
   ```
3. Run VAL:
   ```bash
   ./Validate domain.pddl problem.pddl plan
   ```
   If you run into `libVAL.so` issues, add `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.` to your shell rc file and execute `Validate` from its own directory.

### POPF2 Planner

> **Config note:** Update `solver_popf2_binary` within `config.json` if the compiled binary path differs from the default (`./solvers/popf2/compile/popf2/popf3-clp`).

1. Install dependencies:
   ```bash
   sudo apt update
   sudo apt install -y git cmake bison flex \
     coinor-libcbc-dev coinor-libclp-dev coinor-libcoinutils-dev \
     coinor-libosi-dev coinor-libcgl-dev
   ```
2. Clone POPF2:
   ```bash
   cd ~
   git clone https://github.com/Minstoll/popf2.git
   cd popf2
   ```
3. Build with modern compilers:
   ```bash
   chmod +x build
   CXX=g++-11 CC=gcc-11 ./build
   ```
4. Run:
   ```bash
   cd compile/popf2/
   ./popf3-clp domain.pddl problem.pddl    # optionally redirect to a file
   ```

## LangGraph and LangChain

### Environment Variables
Create a `.env` (add it to `.gitignore`) in the project root:
```
LANGSMITH_API_KEY="<your-api-key-here>"
LANGSMITH_TRACING_V2="true"
LANGSMITH_PROJECT="<project-name>"
OPENAI_API_KEY="<your-api-key-here>"
GEMINI_API_KEY="<your-api-key-here>"
```
Obtain API keys from LangSmith/LangChain and your chosen LLM providers.

### LangGraph Definition
Ensure `src/llm_plan/langgraph.json` exists:
```json
{
  "dockerfile_lines": [],
  "graphs": {
    "workflow": "./workflow.py:graph"
  },
  "env": "../../.env",
  "python_version": "3.12",
  "dependencies": [
    "."
  ]
}
```
The `"env"` field points to the `.env` file defined above.

### LangChain Studio (Recommended)
1. `cd src/llm_plan`.
2. Run `langgraph dev` to launch the local LangChain Studio server; a browser window opens automatically.
3. Studio visualises node-level execution, lets you replay from any node, and exposes per-LLM traces.

### Running the LangGraph Workflow
- **With LangChain Studio**: After the server launches, use the GUI to define the initial graph state. The fields `messages`, `multi_agent`, `mode`, `refinement_iters`, `enable_clarifications`, and `WSL` must be set. You can also use `graph_interface.ipynb`: set `initial_description`, set `REMOTE=True`, run the server-config cell, then stream execution and inspect the thread in the Studio UI.
- **Without LangChain Studio**: Use `graph_interface.ipynb` with `REMOTE=False`. Populate `initial_description`, initialise the state/config, skip the server-config cell, and run the execution cell directly. (TODO: add a notebook cell that invokes the graph without streaming.)

### Interactive Planning App
1. Activate your virtual environment (or install `requirements.txt` globally).
2. Launch the Flask app:
   ```bash
   python3 webapp/app.py
   ```
3. Open your browser at `http://127.0.0.1:5000/`.
4. Describe a planning task, click **Plan**, and inspect the live logs plus the final natural-language plan.
