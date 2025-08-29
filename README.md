# statgrid

A concise framework for short‑term electricity demand forecasting in smart grids, combining statistical analysis with modern machine learning.

## Objectives

- Build and compare baseline and advanced forecasting models.
- Evaluate models using standard metrics (e.g., MAE, R²).
- Deliver a simple prediction script using the best model.

## Methodology

The project proceeds in three phases (see `logs/v0.md` for details):

1. Data understanding and preparation (EDA, cleaning, feature engineering).
2. Modeling and evaluation (baseline vs. advanced models).
3. Application and reporting (prediction script, interpretation, final report).

## Getting Started

### Download dataset
```bash
chmod +x get-dataset.sh
./get-dataset.sh
```

- Requirements: Python 3.10+ and Jupyter.
- Recommended: create and activate a virtual environment.
- Install dependencies as needed for your environment (e.g., `pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`, `jupyter`).

## Repository Layout

- `logs/` planning and phase notes (see `logs/v0.md`).

## Deliverables

- Clean, processed dataset and EDA notebook.
- Trained baseline and advanced models with evaluation.
- A Python script that loads the best model and produces forecasts.
- A brief report summarizing methods, results, and conclusions.

## License

This project is licensed under the MIT License (see `LICENSE`).