# FleetOps Intelligence

**An Azure data platform for commercial vehicle telemetry and fleet analytics.**

## Overview

FleetOps Intelligence explores the design and implementation of a cloud-based data pipeline using the historical DT-CARGO dataset. It processes vehicle records, trip metadata and speed measurements into structured, analytics-ready data, with an emphasis on reliable ingestion, data quality, governance and repeatable infrastructure.

## Architecture

```text
DT-CARGO Dataset
       |
       v
  ADLS Gen2
    Landing
       |
       v
    Bronze
       |
       v
    Silver
       |
       v
     Gold
       |
       v
 Analytics-ready data
```

**Processing:** Azure Databricks · Apache Spark · Delta Lake  
**Infrastructure:** Terraform · Azure  
**Governance:** Unity Catalog

The data lake separates raw inputs from progressively refined datasets. Unity Catalog managed storage is configured separately from the Landing-to-Gold processing layers.

## Technology Stack

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as code and repeatable provisioning |
| Azure Data Lake Storage Gen2 | Data lake storage and layer separation |
| Azure Databricks | Distributed data processing |
| Delta Lake | Reliable, schema-aware data tables |
| Unity Catalog | Data access control and governance |
| Python / PySpark | Ingestion, transformation and validation |
| Git | Version control and collaboration |

## Repository Structure

```text
FleetOps/
├── infrastructure/
│   └── terraform/
│       ├── foundation/       # Azure resource group and data lake
│       ├── databricks/       # Databricks infrastructure
│       ├── unity_catalog/    # Governance configuration
│       └── sql_database/     # Optional SQL resources
└── local/
    ├── notebooks/            # Exploration and development
    └── src/                  # Reusable processing code
```

Infrastructure is separated into Terraform stacks to keep resource provisioning modular and make dependencies between components explicit.

## Pipeline Design

| Layer | Responsibility |
|---|---|
| **Landing** | Retain incoming source files |
| **Bronze** | Ingest source records with traceability |
| **Silver** | Apply schema enforcement, validation and consistency checks |
| **Gold** | Prepare curated datasets for fleet and trip analysis |

Speed telemetry is the largest dataset component, making batch processing, duplicate prevention and recovery important parts of the ingestion design.

## Status & Next Steps

**Current stage: Azure foundation**

The Terraform foundation has been configured and validated. The initial plan covers an Azure resource group, an ADLS Gen2 storage account and five filesystems.

Next: provision the foundation, integrate Databricks with storage, implement the data pipeline, configure Unity Catalog, and introduce automated testing and deployment.

**Data note:** DT-CARGO is historical research data. Any simulated incremental arrivals will be identified as replayed data, not live telemetry.

