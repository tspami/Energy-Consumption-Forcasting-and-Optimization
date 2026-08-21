# Energy Consumption Forecasting and Optimization Using Machine Learning

## Overview

This project is a machine learning-based system designed to forecast energy consumption, analyze usage patterns, and provide recommendations for energy optimization and cost reduction.

Real-world survey data is stored and queried using SQL, processed and analyzed using Python, and visualized through interactive Power BI dashboards.

## Objectives

* Predict monthly energy consumption using Machine Learning.
* Analyze energy consumption patterns and influencing factors.
* Identify opportunities for energy optimization.
* Generate recommendations based on predicted consumption.
* Estimate potential cost savings.
* Present insights through interactive dashboards.

## Technologies Used

* Python – Data preprocessing, analysis, and Machine Learning
* SQL (MySQL) – Data storage, cleaning, and querying
* Power BI – Interactive dashboards and visualization
* Excel – Data preparation and validation
* Google Colab – Model development and experimentation

## Machine Learning Models

The project evaluates multiple regression models:

* Linear Regression
* Ridge Regression
* Lasso Regression
* Decision Tree
* Random Forest
* Gradient Boosting

An ensemble of Random Forest and Gradient Boosting is used to generate the final monthly energy consumption prediction.

## Project Workflow

```text
Survey Data
    ↓
SQL Database
    ↓
Data Cleaning and Preprocessing
    ↓
Feature Encoding and Scaling
    ↓
Machine Learning Models
    ↓
Energy Consumption Prediction
    ↓
Optimization Recommendations
    ↓
Power BI Dashboard
```

## Key Outputs

* Predicted monthly energy consumption
* Energy consumption level
* Energy optimization recommendation
* Prediction confidence level
* Estimated cost savings
* Interactive energy and cost analysis dashboards

## Project Structure

```text
Energy-Consumption-Forecasting/
│
├── Dataset/
├── SQL/
├── Python/
├── PowerBI/
└── README.md
```

## Project Purpose

This project demonstrates the integration of Machine Learning, SQL, and Business Intelligence to transform energy consumption data into actionable insights for improved energy planning, efficiency, and cost management.
