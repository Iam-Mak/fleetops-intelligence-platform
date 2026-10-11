# Docker Runtime

Build the image from the Dockerfile:

```bash
docker build -t local-spark:4.0.1 -f docker/Dockerfile .

docker exec -it local-spark bash
```

Start the container:

```bash
docker run -d \
  --name local-spark \
  -p 8888:8888 \
  -p 4040:4040 \
  -v "$(pwd):/workspace/spark" \
  local-spark:4.0.1 \
  tail -f /dev/null
```

Start Jupyter:

```bash
docker exec -it local-spark \
  jupyter notebook \
  --ip=0.0.0.0 \
  --port=8888 \
  --no-browser
```

Open:

```text
http://localhost:8888
```

Verify Spark:

```bash
docker exec -it local-spark \
  python3 -c "import pyspark; print(pyspark.__version__)"
```

Stop / start:

```bash
docker stop local-spark
docker start local-spark
```

