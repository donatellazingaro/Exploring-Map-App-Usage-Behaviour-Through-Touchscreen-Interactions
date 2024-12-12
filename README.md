# Exploring Map App Usage Behaviour Through Touchscreen Interactions

This repository supports the paper presented at the **12th International Conference on Geographic Information Science (GIScience 2023)**. 

**Publication Details:**
- **Editors**: Roger Beecham, Jed A. Long, Dianna Smith, Qunshan Zhao, and Sarah Wise
- **Article No.**: 95
- **Pages**: 95:1–95:6
- **Series**: Leibniz International Proceedings in Informatics (LIPIcs)
- **Publisher**: Schloss Dagstuhl – Leibniz-Zentrum für Informatik, Dagstuhl Publishing, Germany

## Repository Overview

This repository contains pre-processed data and analysis scripts used for clustering, archetype analyses, and exploratory analyses of touchscreen interactions with mobile map and travel apps. The datasets have been aggregated into 200 bins to facilitate detailed behavioral analyses.

### Files Included:

#### Data Files
1. **`Aggregated_all_200bins.csv`**
   - Contains taps data from both map and travel apps, aggregated into 200 bins.
   - Used for clustering analyses to understand combined usage patterns.

2. **`CLustering_Data_bin200_map.csv`**
   - Contains taps data specifically from map apps, aggregated into 200 bins.
   - Used for clustering analyses to explore map-specific usage behaviors.

3. **`CLustering_Data_bin200_travel.csv`**
   - Contains taps data specifically from travel apps, aggregated into 200 bins.
   - Used for clustering analyses to explore travel-specific usage behaviors.

#### Analysis Scripts
4. **`aa.R`**
   - R script for performing **archetype analyses** on the datasets for both map and travel apps.
   - Provides a framework to identify representative usage patterns (archetypes) based on the data.
   - Can be customized for additional analyses or applied to similar datasets.

5. **`Hierarchical_Clustering.ipynb`**
   - Jupyter Notebook for performing hierarchical clustering on the pre-processed datasets.
   - Visualizes clustering results and helps identify patterns in touchscreen interaction data.

6. **`Preprocessing_.ipynb`**
   - Jupyter Notebook containing the pre-processing steps applied to raw data.
   - Includes data cleaning, aggregation, and binning (200 bins) to prepare datasets for clustering and analyses.

7. **`Exploratory_Analysis_GIScience_Leeds.ipynb`**
   - Jupyter Notebook for exploratory data analysis.
   - Explores patterns and trends in the data, including descriptive statistics and initial visualizations.

## Usage Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository-link.git
