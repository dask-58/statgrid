# statgrid

A concise framework for short‑term electricity demand forecasting in smart grids, combining statistical analysis with modern machine learning.

https://github.com/dask-58/statgrid

## Project Structure

The repository is organized as follows:

- `article/`: Contains the LaTeX source code and figures for the final article along with the PDF {}.
- `literature/`: Contains the literature review documentation and related figures along with the PDF.
- `data/`: Stores the dataset.
- `models/`: Saved model artifacts, including feature and target scalers.
- `notebooks/`: Jupyter notebooks for various stages of the project:
  - `eda.ipynb` & `data-exploration.ipynb`: Exploratory Data Analysis.
  - `hypo-A.ipynb`, `Hypo_B.ipynb`, `Hypo_C.ipynb`: Hypothesis testing notebooks.
  - `baseline-ARIMA.ipynb`: Baseline ARIMA model implementation.
  - `cnn-biLTSM.ipynb`: Proposed CNN-BiLSTM model implementation.
  - `model_processing.ipynb`: Data preprocessing steps.
- `src/`: Source code for utility functions (`data_utils.py`).
- `get-dataset.sh`: Script to download the dataset.


## Hypothesis Testing

To statistically validate the observations from the EDA, a formal hypothesis test was conducted.

### Hypothesis A: Impact of Time of Week on Energy Demand

- **Objective:** To determine if there is a statistically significant difference between the mean energy demand on weekdays and weekends.
- **Methodology:** An Independent Samples _t_-test and a non-parametric Mann-Whitney U test were performed.
- **Conclusion:** Both tests yielded a p-value of 0.0000, leading to the rejection of the null hypothesis. This provides strong statistical evidence that a significant difference in energy demand exists between weekdays and weekends, confirming that `is_weekend` is a critical feature for forecasting.

The detailed analysis for this hypothesis can be found in `notebooks/hypo-A.ipynb`.

### Hypothesis B: Impact of Consumer Type on Energy Demand

- **Objective:** To determine if there are statistically significant differences in mean energy demand across different consumer types (residential, commercial, industrial).
- **Methodology:** One-Way ANOVA and Kruskal-Wallis H test (non-parametric alternative) were performed, along with post-hoc pairwise comparisons.
- **Conclusion:** Both tests yielded p-values < 0.0001, leading to the rejection of the null hypothesis. The ANOVA test (F=79.60) and Kruskal-Wallis test (H=123.56) provide strong statistical evidence that consumer type significantly impacts energy demand. Industrial consumers show the highest demand, followed by commercial and residential consumers. This confirms that `consumer_type` is a critical feature for forecasting.

The detailed analysis for this hypothesis can be found in `notebooks/Hypo_B.ipynb`.

### Hypothesis C: Relationship between Temperature and Energy Demand

- **Objective:** To determine if there is a statistically significant positive correlation between temperature and energy demand.
- **Methodology:** Pearson correlation coefficient test and Spearman rank correlation test (non-parametric alternative) were performed.
- **Conclusion:** Both tests yielded p-values < 0.0001, leading to the rejection of the null hypothesis. The Pearson correlation (r=0.60) and Spearman correlation (ρ=0.61) demonstrate a moderate positive correlation between temperature and energy demand. Approximately 36% of the variance in demand can be explained by temperature. This confirms that `temperature` is an important predictive feature for energy demand forecasting.

The detailed analysis for this hypothesis can be found in `notebooks/Hypo_C.ipynb`.

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

| Model                 |   RMSE |    MAE |   MAPE |
| --------------------- | -----: | -----: | -----: |
| ARIMA Baseline        | 0.3462 | 0.2983 | 60.37% |
| CNN-BiLSTM (Proposed) | 0.0894 | 0.0735 | 16.62% |

## License

This project is licensed under the MIT License (see `LICENSE`).
