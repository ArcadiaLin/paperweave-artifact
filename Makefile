# Repository entry point. The system's own targets are in experiments/e09/Makefile.
#
#   make setup   build the shared uv environment (.venv)
#   make test    run the tests that need no database

UV ?= uv

.PHONY: setup test

setup:
	$(UV) sync --all-packages

test:
	$(UV) run pytest -q packages/graph-vc/tests packages/graph-doc/tests experiments/e09/tests
