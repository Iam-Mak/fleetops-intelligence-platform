# FleetOps Intelligence

**An Azure data platform for commercial vehicle operations and fleet analytics.**

## Overview

FleetOps Intelligence is an end-to-end data platform engineering project built around historical vehicle telemetry and fleet operations. It explores how to provision cloud infrastructure, build reliable data pipelines, govern access to data, and deliver analytics ready datasets using Azure.

The platform is organised around two business domains: **Fleet Operations** and **Fleet Maintenance**. The goal is to build a practical, reproducible platform that demonstrates both data engineering and the infrastructure, security, and operational decisions behind it.

## Architecture

```text
               DT-CARGO Dataset
                      |
                      v
             Azure Data Lake Gen2
                      |
            Landing / Source Files
                      |
                      v
              Azure Databricks
             Apache Spark / Delta
                      |
              Bronze → Silver → Gold
                      |
             +--------+--------+
             |                 |
             v                 v
      Fleet Operations   Fleet Maintenance
       Unity Catalog       Unity Catalog
             |                 |
             +--------+--------+
                      |
               Fleet Analytics
```

The two domains are intended to be governed through separate Unity Catalog catalogs: `fleet_operations` and `fleet_maintenance`. Shared infrastructure supports both, while data access and processing are organised around their respective responsibilities.

## Technology Stack

| Area | Technologies |
|---|---|
| Cloud and storage | Microsoft Azure, Azure Data Lake Storage Gen2 |
| Data platform | Azure Databricks, Apache Spark, PySpark, Delta Lake |
| Infrastructure as code | Terraform |
| Governance and security | Unity Catalog, Azure Managed Identity, Azure RBAC |
| Development | Python, SQL, Git |
| Automation and quality | GitHub Actions, automated testing *(planned)* |

## Engineering Scope

- **Infrastructure:** Provision and manage Azure resources with Terraform, keeping the foundation and Databricks infrastructure separate.
- **Data pipelines:** Build ingestion and transformation workflows using the Landing, Bronze, Silver, and Gold layers.
- **Governance:** Configure Unity Catalog storage access, catalogs, schemas, and permissions for the two business domains.
- **Reliability:** Implement data validation, deduplication, safe reruns, and failure recovery.
- **Delivery and operations:** Introduce automated testing, CI/CD, monitoring, and cost-aware resource management.
- **Analytics:** Develop validated fleet utilisation metrics and, where suitable data is available, maintenance and downtime analysis.

## Data and Business Use Case

The initial data source is the historical DT-CARGO research dataset, including fleet metadata, trip records, and detailed speed measurements.

The project will focus initially on vehicle activity, trip volumes, distance travelled, and data quality. Maintenance analytics may be added using suitable public or clearly labelled synthetic data.

DT-CARGO is historical data, not a live feed. Incremental-processing demonstrations will use controlled replay batches and will be documented accordingly.

## Status

The Azure foundation, ADLS Gen2 storage, and initial Azure Databricks workspace have been provisioned with Terraform. The Access Connector and storage permissions have been configured as part of the storage integration work.

Unity Catalog integration, the two domain catalogs, data pipelines, and automated engineering practices are being developed incrementally.

