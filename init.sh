# créer le venv si absent
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# activer le venv
# - Windows (Git Bash) : .venv/Scripts/activate
# - Linux/macOS        : .venv/bin/activate
if [ -f ".venv/Scripts/activate" ]; then
  source .venv/Scripts/activate
else
  source .venv/bin/activate
fi


pip install --upgrade pip

# installer PyTorch explicitement AVANT le reste
python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

# installer le reste
python -m pip install -r requirements.txt

# kernel jupyter
python -m pip install -U ipykernel
python -m ipykernel install --user --name venv-rag --display-name "venv-rag"

pip install -U bitsandbytes
echo "OK: env .venv'"
