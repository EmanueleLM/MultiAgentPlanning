### How to run tests

1. Install the dependencies, including pytest.

2. Run:
- ``pytest``

### Install GPT-OSS-20B via Ollama -- Tested on MacBook Pro M2 Sequoia 15.5 

1. Install Ollama on your laptop:
https://ollama.com/download/windows

2. Pull GPT-OSS-20B
https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama

3. Clone this repo

4. Install dependencies:
- cd to the project folder
- ``python3 -m venv .venv``
- ``source .venv/bin/activate``
- ``pip3 install -r requirements.txt``

5. You can play with GPT now and call it via the APIs. Check playground.ipynb and /test

### Run the interactive planning app

1. Activate your virtual environment (or install the requirements listed in `requirements.txt`).
2. From the project root launch the Flask app:
   ```
   python3 webapp/app.py
   ```
3. Open your browser at http://127.0.0.1:5000/ (or the host/port shown in the console).
4. Describe a planning task, press **Plan**, and watch the live logs and final natural-language solution.

### Install Fast Downward -- Tested on MacBook Pro M2 Sequoia 15.5 

1. Install XCode and Homebrew:

- ``xcode-select --install``

- ``/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``

- ``echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile``

- ``eval "$(/opt/homebrew/bin/brew shellenv)"``

2. Install GNU Make:

- ``brew install cmake`` 

(If this gives an error of permissions, run this ``sudo chown -R $(whoami):admin /opt/homebrew``)

3. Install CMake:

- ``brew install cmake``

4. Download FastForward

- Create create a folder named ``solvers`` inside the root folder of the project
- cd the folder
- ``wget https://www.fast-downward.org/latest/files/release24.06/fast-downward-24.06.1.tar.gz``
- ``tar -xvzf fast-downward-24.06.1.tar.gz``
- (optional) remove the tar.gz
- ``cd fast-downward-24.06.1``
- ``./build.py``

Now, you should be able to try some plans.
You can try:

``./fast-downward.py --alias lama-first ./../../results/StaticAgentsVault/preliminary/pddl-orchestrator/domain.pddl ./../../results/StaticAgentsVault/preliminary/pddl-orchestrator/problem.pddl``

If it works, you should see the correct result in the same folder of ./fast-downward.py, named ``sas_plan`` with this content:

``(open-vault agent-a vault)``

``(enter-vault agent-b vault)``

``(grab-object agent-b obj1 vault)``

``; cost = 3 (unit cost)``

### Install Universal Planning Validator (similar to VAL) -- Tested on MacBook Pro M2 Sequoia 15.5 

1. Clone this repo inside ``./solvers``:

- ``git clone https://github.com/aig-upf/universal-planning-validator.git``

2. Install scons on Mac

- ``brew install scons``

3. Install Universal Planning Validator:

- ``cd ./universal-plan-validator``
- ``./build.sh``

4. Execute the tests:

- ``./tests/test.bin``

5. Usage:
- ``./solvers/universal-planning-validator/validator/validate.bin -c domain_file.pddl probelm_file.pddl plan_file``
### Install VAL plan validator
The VAL repository is https://github.com/KCL-Planning/VAL. However, for this project only the binaries are required.
1. Navigate to https://dev.azure.com/schlumberger/ai-planning-validation/_build?definitionId=2 and select the most recent successful run.
2. Scroll down to `Jobs` and click the one for your OS.
3. Click the line with `<number> artifacts produced` to see the artifacts.
4. Click the three dots on the right for your artifact and download it.
5. Unzip and extract
  Depending on your system, this step might differ. Here is an example on linux/WSL:
```bash
unzip linux64.zip
cd linux64/
tar -xvzf Val-20211204.1-Linux.tar.gz
cd Val-20211204.1-Linux/bin/
```
6. Run VAL
To see options, simply do `./Validate`. To validate, do
```bash
./Validate domain.pddl problem.pddl plan
```
If you run into problems with `libVAL.so`, try adding `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.` to your `.bashrc` file and make sure you `cd` to the directory containing `Validate` before running it.

### Install POPF2 Planner
These instructions are for installing the POPF2 planner from IPC 2011. There are several versions of POPF2 and original repository appears to be https://github.com/fmrico/popf, but the instructions here pertain to a fork https://github.com/Minstoll/popf2 of https://github.com/mortacious/popf2 for more modern systems. 
1. Install dependencies:
   Run the following in your linux terminal:
```bash
sudo apt update
sudo apt install -y git cmake bison flex \
  coinor-libcbc-dev coinor-libclp-dev coinor-libcoinutils-dev \
  coinor-libosi-dev coinor-libcgl-dev
```
2. Clone the repository:
```bash
cd ~
git clone https://github.com/Minstoll/popf2.git
cd popf2
```
3. Build POPF with appropriate versions
```bash
chmod +x build
CXX=g++-11 CC=gcc-11 ./build
```
4. Running
At this point the binary should have been built successfully. Navigate to it to run, and simply do `./popf3-clp` to see a list of options. For example:
```bash
cd popf2/compile/popf2/
./popf3-clp domain.pddl problem.pddl
```
POPF outputs the plan or any messages in standard out. You can redirect the output as follows:
```bash
./popf3-clp domain.pddl problem.pddl &> plan.txt
```

### Set up langgraph
1. Set up environment variables
Define a `.env` file in the root folder (remember to add this to .gitignore) as follows:
```
LANGSMITH_API_KEY="<your-api-key-here>"
LANGSMITH_TRACING_V2="true"
LANGSMITH_PROJECT="<project-name>"
OPENAI_API_KEY="<your-api-key-here>"
GEMINI_API_KEY="<your-api-key-here>"
```
Add the appropriate API keys for the LLM. You can get an API key for langsmith for free: https://docs.langchain.com/langsmith/create-account-api-key
2. Define langgraph JSON
Ensure `langgraph.json` exists in `/src/llm_plan/` with contents
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
The "env" field points to the `.env` file defined in step 1.

### Set up langchain studio (recommended)
Setting up langchain studio allows you to visualise the per-node graph execution and dynamically re-run from any node as well as view individual llm runs among many other features, making it super helpful to trace errors and to debug. However, if you prefer not to use this, you can still invoke the graph via graph_interface.ipynb, with or without streaming outputs.
1. Navigate to path containing `langgraph.json`
For this project, this will be in `/src/llm_plan`.
2. Lauch the server
In your terminal, run `langgraph dev`. After you run this, a window should open in your default browser with langsmith studio.

### How to run experiments with langgraph workflow
#### I. With langchain studio
There are two ways to invoke the graph. After launching langsmith studio, you can directly interact with the GUI to define an initial state to pass to the graph and press submit. The fields `messages`, `multi_agent`, `mode`, `refinement_iters`, `enable_clarifications` and `WSL` *must* be specified.
\n
Alternatively, you can use `graph_interface.ipynb`. Populate `initial_description` with the natural language description of the planning problem and set `REMOTE=True`. Run the cell that configues the server and the following cell to stream execution stages. You can open the browser window and select the thread to interact with/view the execution through studio.
#### II. Without langchain studio
If you do not want to use studio, use `graph_interface.ipynb` and set `REMOTE=False` (don't forget to populate `initial_description` and initialize the initial state and config). Do not run the cell that configures the server, and directly continue to the next cell.

TODO: Will put instructions in graph_interface too, and make a cell that invokes the graph without streaming.

### IGNORE THIS, WILL EDIT LATER: Configuring for Windows via WSL -- Tested on Windows 11
##
...
change solver_binary, universal_validator and universal_validator_bin in config.json. For example:
and set WSL=True in the initial graph state. Then universal_validator and universal_validator_bin and solver_binary should be *wsl_paths* e.g. home/user/...
