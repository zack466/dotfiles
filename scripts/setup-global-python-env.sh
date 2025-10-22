set -e

# These paths are substituted by Nix during the build process
UV_BIN="@uv@"
PYTHON_BIN="@python@"

# Define static paths
REQUIREMENTS_FILE="$HOME/.config/uv/global-requirements.txt"
GLOBAL_VENV_PATH="$HOME/.local/share/uv/global-python"

# Ensure the base directory exists
mkdir -p "$(dirname "$GLOBAL_VENV_PATH")"

# Create the virtual environment if it doesn't exist
if [ ! -d "$GLOBAL_VENV_PATH" ]; then
  echo "Creating global Python environment with uv..."
  "$UV_BIN" venv "$GLOBAL_VENV_PATH" --python "$PYTHON_BIN"
fi

# Sync packages from the requirements file
echo "Syncing global Python environment..."
"$UV_BIN" pip sync --python "$GLOBAL_VENV_PATH/bin/python" "$REQUIREMENTS_FILE"
