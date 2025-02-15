#!make

# Load local .env file
-include .env
export

DIRS = asynch/ tests/ benchmark/
PY_DEBUG_OPTS = PYTHONDEVMODE=1 PYTHONTRACEMALLOC=1

.PHONY: bench build clean format install lint test update

bench:
	python3 benchmark/main.py

build: clean
	poetry build

clean:
	rm -rf ./dist

format:
	ruff format $(DIRS)
	ruff check --fix $(DIRS)

install:
	poetry install --extras compression

lint:
	ruff check $(DIRS)

test:
	$(PY_DEBUG_OPTS) pytest

update:
	poetry update
