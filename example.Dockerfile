FROM sebnyberg/pyspark-alpine

RUN pip install findspark

COPY . /code

WORKDIR /code

CMD ["/bin/bash"]
