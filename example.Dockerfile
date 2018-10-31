FROM sebnyberg/pyspark-alpine

COPY config ${SPARK_HOME}/conf

RUN pip install findspark

COPY . /code

WORKDIR /code

CMD ["/bin/bash"]
