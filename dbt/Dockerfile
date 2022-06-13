FROM python:3.8.5

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get install sudo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sudo apt update -y && sudo apt install -y build-essential libpq-dev

# Install DBT
RUN pip install -U pip
RUN pip install psycopg2-binary --no-binary psycopg2-binary
RUN pip install dbt-core==1.1.0
RUN pip install dbt-postgres

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

CMD ["/bin/bash"]
