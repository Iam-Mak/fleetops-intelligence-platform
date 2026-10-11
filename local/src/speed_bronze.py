import argparse

from pyspark.sql import SparkSession
from pyspark.sql.functions import input_file_name, regexp_extract
from pyspark.sql.types import StructType, StructField, DoubleType


def main(vehicle_id):

    print(f"Starting Speed Bronze ingestion for vehicle: {vehicle_id}")

    spark = (
        SparkSession.builder.appName("DT-CARGO Speed Bronze")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config(
            "spark.sql.catalog.spark_catalog",
            "org.apache.spark.sql.delta.catalog.DeltaCatalog",
        )
        .config("spark.jars.packages", "io.delta:delta-spark_2.13:4.0.0")
        .getOrCreate()
    )

    print(f"Spark version: {spark.version}")

    speed_schema = StructType(
        [
            StructField("epoch", DoubleType(), True),
            StructField("speed", DoubleType(), True),
            StructField("hdop", DoubleType(), True),
        ]
    )

    speed_path = f"/workspace/spark/local/data/raw/speed/{vehicle_id}/*.csv"

    print(f"Reading: {speed_path}")

    speed_df = (
        spark.read.schema(speed_schema)
        .option("header", True)
        .csv(speed_path)
        .withColumn("source_file", input_file_name())
        .withColumn(
            "vehicle_id", regexp_extract("source_file", r"/speed/(\d+)/", 1).cast("int")
        )
        .withColumn(
            "track_id", regexp_extract("source_file", r"/(\d+)\.csv$", 1).cast("int")
        )
    )

    print(f"Input partitions: {speed_df.rdd.getNumPartitions()}")

    print("Writing to Bronze...")

    speed_df.write.format("delta").mode("overwrite").option(
        "replaceWhere", f"vehicle_id = {vehicle_id}"
    ).partitionBy("vehicle_id").save("/workspace/spark/local/data/bronze/speed")

    print(f"Vehicle {vehicle_id} Bronze ingestion completed.")

    spark.stop()

    print("Spark stopped.")


if __name__ == "__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument("vehicle_id", type=int)

    args = parser.parse_args()

    main(args.vehicle_id)
