# PaperWeave

Anonymous artifact for the submission *Collaborating without Coordinating: Data
Management for Knowledge Accumulated by LLM Agents*.

PaperWeave is a data management system for knowledge that many LLM agents write
into one long-lived store without coordinating. General-purpose agents connect
to it as an MCP server.

## Layout

| Path | Content |
| --- | --- |
| `packages/graph-vc` | Versioned graph storage on Neo4j: changesets, commit records, revert, past states |
| `packages/graph-doc` | A YAML subgraph format read and written in the same shape, and diffing against the store |
| `experiments/e09/src/e09` | The system: data model, write pipeline, operators, artifacts, version history, MCP server |
| `data/raw/e09-paper-knowledge/docs` | Documents that build the current store |
| `infra/` | Docker Compose files for Neo4j and the embedding service |

## Running

Requires Python 3.12, [uv](https://docs.astral.sh/uv/), and Docker.

```sh
make setup    # build the environment
make test     # tests that need no database
```

Database tests run when `GRAPH_VC_TEST_NEO4J_URI` points to an empty Neo4j
instance (`infra/neo4j-test`); they empty that database. The MCP server is
started with `uv run python -m e09.mcp`.
