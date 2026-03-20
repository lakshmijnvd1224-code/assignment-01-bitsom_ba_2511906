# Design Justification

## Storage Systems

This system was designed around four goals, each requiring a different storage
technology based on its access patterns and performance needs.

**Goal 1 — Predict Patient Readmission Risk:** PostgreSQL was chosen to store
historical treatment data. It is a relational database that supports ACID
transactions, ensuring data consistency and integrity. This is critical because
a machine learning model predicting readmission risk is only as reliable as the
data it is trained on.

**Goal 2 — Plain English Queries by Doctors:** ChromaDB, a vector database,
was selected for this goal. Patient history is stored as vector embeddings, and
when a doctor asks a natural language question, it is converted into a vector
and matched against the most semantically similar records. This allows meaning-
based retrieval rather than exact keyword matching.

**Goal 3 — Monthly Management Reports:** A Data Lake combined with DuckDB was
chosen for analytical reporting. Hospital data is stored as Parquet files and
queried directly by DuckDB using SQL. Its columnar engine makes large
aggregations fast, which is exactly what monthly reporting across departments
requires.

**Goal 4 — Real-Time ICU Vitals Streaming:** Apache Kafka combined with
TimescaleDB handles this goal. Kafka buffers the continuous stream from ICU
devices and TimescaleDB stores it in a time-series optimised format, enabling
the alert engine to detect anomalies in near real-time.

## OLTP vs OLAP Boundary

The OLTP system ends at PostgreSQL and TimescaleDB. These handle all live
operational writes — patient records, treatment entries, and incoming ICU
vitals — prioritising low latency and consistency.

The OLAP system begins at the Data Lake. A scheduled batch job exports records
from PostgreSQL into Parquet files, after which DuckDB handles all reporting
queries. This boundary ensures that heavy analytical workloads never compete
with live hospital systems that clinical staff depend on.

## Trade-offs

The most significant trade-off is **consistency versus simplicity in the
analytical layer**. Because the data lake is populated through batch exports
rather than real-time streaming, management reports may not reflect the most
recent data. For monthly reporting this is acceptable, as hospital management
does not need minute-by-minute updates. To mitigate this, export frequency
could be increased from daily to hourly. For stricter requirements, a change
data capture tool like Debezium could stream changes from PostgreSQL into the
data lake in real-time, eliminating the lag without disrupting the OLTP layer.