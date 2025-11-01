# statgrid

A concise framework for short‑term electricity demand forecasting in smart grids, combining statistical analysis with modern machine learning.

## Hypothesis Testing

To statistically validate the observations from the EDA, a formal hypothesis test was conducted.

### Hypothesis A: Impact of Time of Week on Energy Demand

*   **Objective:** To determine if there is a statistically significant difference between the mean energy demand on weekdays and weekends.
*   **Methodology:** An Independent Samples *t*-test and a non-parametric Mann-Whitney U test were performed.
*   **Conclusion:** Both tests yielded a p-value of 0.0000, leading to the rejection of the null hypothesis. This provides strong statistical evidence that a significant difference in energy demand exists between weekdays and weekends, confirming that `is_weekend` is a critical feature for forecasting.

The detailed analysis for this hypothesis can be found in `notebooks/hypo-A.ipynb`.

## Getting Started

### Download dataset
```bash
chmod +x get-dataset.sh
./get-dataset.sh
```

- Requirements: Python 3.10+ and Jupyter.
- uv package manager [docs](https://docs.astral.sh/uv/)

Jupyter
- Install dependencies from `requirements.txt`:
  ```bash
  pip install -r requirements.txt
  ```

### Setup with uv

**Install project dependencies** (uv will create and manage a virtual environment):
```bash
uv sync
```

**Run Python scripts or Jupyter notebooks inside uv**:
```bash
uv run python main.py
uv run jupyter notebook
```

**Optional: add uv kernel to Jupyter** (if using VS Code or want to select kernel manually):
```bash
uv run python -m ipykernel install --user --name=statgrid-uv
```
### Benchmarks:
| Model | RMSE | MAE | MAPE |
|---|---:|---:|---:|
| ARIMA Baseline | 0.3462 | 0.2983 | 60.37% |
| CNN-BiLSTM (Proposed) | 0.0894 | 0.0735 | 16.62% |

## License

This project is licensed under the MIT License (see `LICENSE`).
