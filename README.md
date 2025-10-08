# statgrid

A concise framework for short‑term electricity demand forecasting in smart grids, combining statistical analysis with modern machine learning.

## Project Overview

This project aims to analyze and forecast short-term electricity demand using the "Smart Grid Electricity Marketing Dataset". The core objective is to understand the key drivers of energy consumption and build a predictive model. The initial phases of the project, documented in the `notebooks/` directory, focus on exploratory data analysis (EDA) and statistical hypothesis testing to validate the importance of various features.

## Exploratory Data Analysis (EDA)

A comprehensive EDA was conducted to understand the dataset's structure, identify patterns, and uncover relationships between variables. Key findings include:

*   **Time-Series Patterns:** The analysis of historical demand over time reveals clear daily and weekly seasonality in energy consumption.
*   **Consumer Type Differences:** Energy demand distribution varies significantly across different consumer types (e.g., residential, commercial, industrial), with industrial consumers showing higher median demand and greater variance.
*   **Correlation with Temperature:** A strong positive correlation was found between temperature and energy demand, highlighting its importance as a predictive feature.
*   **Weekend vs. Weekday Demand:** A noticeable difference in demand patterns exists between weekdays and weekends.

Visualizations such as time-series plots, box plots, and correlation heatmaps were generated to support these findings and are available in the `notebooks/eda.ipynb` and `notebooks/data-exploration.ipynb` notebooks.

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


## Repository Layout

- `blueprint/`: Contains the project planning documents.
- `data/`: Stores the raw and processed datasets.
- `notebooks/`: Contains Jupyter notebooks for data exploration, analysis, and hypothesis testing.
- `papers/`: Contains relevant research papers and literature.

## License

This project is licensed under the MIT License (see `LICENSE`).
