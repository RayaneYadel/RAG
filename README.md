# PPD RAG 

## Contenu du dépôt

### Script d'initialisation
- **init.sh**
  - Crée l’environnement Python (venv)
  - Installe les dépendances
  - Décompresse `data.zip` et crée le dossier `data/` (CSV train/validation)
  
### Run
- `bash init.sh`

### Notebooks
- **no_rag_QA.ipynb**
  - Baseline **QA extractif** (RoBERTa SQuAD2) : fine-tuning sur `train` puis inférence sur `validation`.

- **no_rag_Qwen.ipynb**
  - Baselines **No-RAG** : LLM Qwen **7B** et **14B** en *question seule* (sans contexte).

- **rag_naif.ipynb**
  - **RAG naïf (RAG-Concat simplifié)** : retriever dense (Qwen3-Embedding-0.6B) + FAISS, récupération top-k chunks, concaténation, puis génération unique avec un LLM Qwen (7B ou 14B).
  - Permet aussi de tester différentes tailles de chunking via `CHUNK_WORDS` et `CHUNK_OVERLAP`.

- **rag_sequence.ipynb**
  - **RAG-Sequence** : génération par chunk/document récupéré, puis combinaison/marginalisation au niveau séquence.

- **rag_token.ipynb**
  - **RAG-Token** : variante où la combinaison est réalisée au niveau token (décodage contrôlé).

### Résultats
- **results/**
  - Contient les fichiers de sortie (tables de métriques, exports Excel sur 200 questions)
  - **results/full/** : exécutions sur la validation complète (10k) lorsque disponibles.

## Données
- `data/` est généré automatiquement par `init.sh` (à partir de `data.zip`).
