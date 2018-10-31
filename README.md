# pyspark-alpine

Simple Docker build for PySpark + Python3 with Alpine

## Quick start

To quickly test the image without a Dockerfile, mount your current directory into the container:

```bash
$ docker run -it -v $(pwd):/code sebnyberg/pyspark-alpine

# inside the container:
bash-4.4# cd /code
bash-4.4# spark-submit test.py
```

## Example usage with Dockerfile

A more maintainable solution is to create a simple Dockerfile which does package installation, copies over your code and let's you run spark-submit

```python
# test_spark.py
import findspark

findspark.init()

from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('myApp').getOrCreate()
```

```Dockerfile
FROM sebnyberg/pyspark-alpine

RUN pip install findspark

COPY . /code

WORKDIR /code

CMD ["/bin/bash"]
```

```bash
$ docker build . -t my-spark-app

$ docker run my-spark-app spark-submit test.py
```

