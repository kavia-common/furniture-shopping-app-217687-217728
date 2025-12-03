#!/bin/bash
cd /home/kavia/workspace/code-generation/furniture-shopping-app-217687-217728/BackendAPI
source venv/bin/activate
flake8 .
LINT_EXIT_CODE=$?
if [ $LINT_EXIT_CODE -ne 0 ]; then
  exit 1
fi

