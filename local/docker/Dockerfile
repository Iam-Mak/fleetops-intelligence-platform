FROM apache/spark:4.0.1

USER root

RUN mkdir -p /home/spark/.ivy2 && \
    chown -R spark:spark /home/spark

ENV HOME=/home/spark
ENV IVY_HOME=/home/spark/.ivy2
ENV SPARK_SUBMIT_OPTS="-Divy.home=/home/spark/.ivy2"

ENV PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.10.9.9-src.zip

RUN pip3 install --no-cache-dir \
    --default-timeout=300 \
    jupyter \
    delta-spark==4.0.0

USER spark

WORKDIR /workspace/spark