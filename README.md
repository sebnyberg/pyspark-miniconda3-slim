# pyspark-miniconda3-slim

Simple Docker build for PySpark + MiniConda3

## Quick start

To quickly test the image without a Dockerfile, mount your current directory into the container:

    docker run -it -v $(pwd):/code sebnyberg/pyspark-miniconda3-slim

Run inside the container:

    bash-4.4# cd /code
    bash-4.4# spark-submit test.py

## Example usage with Dockerfile

A more maintainable solution is to create a simple Dockerfile which does package installation, copies over your code and lets you run spark-submit

Example python file:

    # /test_spark.py
    import findspark
    findspark.init()
    from pyspark.sql import SparkSession
    spark = SparkSession.builder.appName('myApp').getOrCreate()

Dockerfile:

    # /Dockerfile
    FROM sebnyberg/pyspark-alpine
    RUN pip install findspark
    COPY . /code
    WORKDIR /code
    CMD ["/bin/bash"]

Build:

    docker build . -t my-spark-app

Run your python file

    docker run my-spark-app spark-submit test_spark.py

## Configuration

Change Spark configuration by copying over your own config files to the folder `$SPARK_HOME/conf`
