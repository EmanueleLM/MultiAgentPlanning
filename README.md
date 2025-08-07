### Install GPT-OSS-20B via Ollama -- Tested on MacBook Pro M2 Sequoia 15.5 

1. Install Ollama on your laptop:
https://ollama.com/download/windows

2. Pull GPT-OSS-20B
https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama

3. Clone this repo

4. Install dependencies:
- cd to the project folder
- ``python3 -m venv .env``
- ``source .env/bin/activate``
- ``pip3 install -r requirements.txt``

5. You can play with GPT now and call it via the APIs. Check playground.ipynb and /test

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