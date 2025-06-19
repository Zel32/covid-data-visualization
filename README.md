# COVID-19 Data Visualization Project

This project analyzes global COVID-19 trends using **SQL** for data exploration and **Tableau** for creating interactive visualizations. It aims to extract meaningful insights from pandemic-related data, including infection and death rates, vaccination progress, and geographic comparisons.

---

## 📁 Repository Contents

```
📂 datasets/
  ├── CovidDeaths.xlsx
  ├── CovidVaccinations.xlsx

📂 sql/
  └── COVID PORTFOLIO PROJ.sql

📂 outputs/
  ├── GlobalDeathPercentage.xlsx
  ├── DeathsPerContinent.xlsx
  ├── PercentInfectedPerCountry.xlsx
  └── PercentInfectedPerCountry_TimeSeries.xlsx

📂 tableau/
  └── COVID DATA DASHBOARD.twb
```

---

## 🔍 Project Description

* SQL queries were used to clean, transform, and extract insights from raw COVID-19 datasets (cases, deaths, vaccinations).
* Tableau was used to create a dashboard that visually presents these insights in an interactive and intuitive format.

The results provide a clear understanding of:

* Infection and death rates by country and continent
* Percentage of population infected or vaccinated
* Comparisons over time and between regions

---

## 🧰 Tools & Technologies

* **SQL Server** – Data querying and transformation
* **Tableau Desktop** – Data visualization
* **Microsoft Excel** – Intermediate file storage and inspection
* **Data Sources**:

  * [CovidDeaths.xlsx](datasets/CovidDeaths.xlsx)
  * [CovidVaccinations.xlsx](datasets/CovidVaccinations.xlsx)

---

## 📊 SQL Insights & Visualized Metrics

The main SQL script (`COVID PORTFOLIO PROJ.sql`) includes queries such as:

* **Global Metrics**: Total cases, deaths, and death percentage
* **Death Count by Continent**: Aggregated totals
* **Percent of Population Infected**: Both static and time-series
* **Vaccination Progress**: Rolling counts of vaccinated individuals
* **Custom Views**: Created for ease of data visualization in Tableau

These queries generated output Excel files used in Tableau:

| Output File                                 | Description                                |
| ------------------------------------------- | ------------------------------------------ |
| `GlobalDeathPercentage.xlsx`                | Daily death percentage globally            |
| `DeathsPerContinent.xlsx`                   | Total deaths per continent                 |
| `PercentInfectedPerCountry.xlsx`            | Highest infection rate by country          |
| `PercentInfectedPerCountry_TimeSeries.xlsx` | Time-series of infection rates per country |

---

## 📈 Tableau Dashboard

The dashboard (`COVID DATA DASHBOARD.twb`) includes:

* **Global trends over time**: Cases and deaths
* **Infection vs. population comparisons**
* **Top countries by infection rate**
* **Continent-level summaries**
* **Vaccination progress visualized over time**

To use the dashboard:

1. Open `COVID DATA DASHBOARD.twb` in Tableau Desktop or Tableau Public.
2. If necessary, reconnect the data sources to the `.xlsx` files in `/outputs/`.

---

## 🗂️ How to Use This Project

1. Clone the repository:

   ```bash
   git clone https://github.com/Zel32/covid-data-visualization.git
   cd covid-data-visualization
   ```

2. Open and run SQL queries using SQL Server or your preferred SQL environment.

3. Export the result of each query as Excel files (or use the provided ones).

4. Open Tableau dashboard and explore visualizations based on your SQL-generated data.

---

## 📌 Key Learnings

* Structured data analysis through SQL can effectively uncover health-related trends.
* Tableau enhances storytelling by converting raw metrics into meaningful visuals.
* The combination provides an end-to-end portfolio example for data analytics work.

---

## 🙏 Acknowledgements

Special thanks to the [Alex The Analyst YouTube Channel](https://www.youtube.com/@AlexTheAnalyst) for providing guidance and inspiration in building this project.

---

## 👨‍💼 Author

**Zel Calzeta**

* BS Applied Mathematics graduate
* Interested in data analytics, fraud detection, and decision modeling
* GitHub: [Zel32](https://github.com/Zel32)

---

## 📄 License

This project is released under the [MIT License](LICENSE).
