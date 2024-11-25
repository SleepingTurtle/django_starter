#!/bin/bash

# Check if the folder name argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folder_name>"
    exit 1
fi

FOLDER_NAME=$1

# Create the folder if it doesn't exist
mkdir -p "$FOLDER_NAME"

# Change into the folder
cd "$FOLDER_NAME" || exit

# Create virtual environment with the prompt name set to the folder name
python -m venv --prompt "$FOLDER_NAME" .venv

# Activate the virtual environment

# For Unix/Linux/MacOS
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
# For Windows using Git Bash or Cygwin
elif [ -f ".venv/Scripts/activate" ]; then
    source .venv/Scripts/activate
else
    echo "Could not find the virtual environment activation script."
    exit 1
fi

# Upgrade pip
python -m pip install --upgrade pip

# Install django
pip install django

# Start django project with the project name same as folder name
django-admin startproject ___ .

# Start the main_app
django-admin startapp main_app

echo "Django project '$FOLDER_NAME' with app 'main_app' has been set up successfully!"
