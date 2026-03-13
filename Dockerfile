FROM python:3.13-slim

WORKDIR /app

# Graphviz system binary is required by some workflows that render DOT files.
RUN apt-get update \
    && apt-get install -y --no-install-recommends graphviz \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir -r requirements.txt

COPY . .

# Override CMD as needed, for example:
# docker run --rm rt-task-gen python task_generator.py --help
CMD ["python", "task_generator.py", "--help"]
