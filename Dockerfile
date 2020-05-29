FROM python:3.7.0

# Update and install system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    git libpq-dev python-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install DBT
RUN pip install dbt==0.17.0

# Set environment variables

ENV DBT_PROFILES_DIR=/profile

ENV DBT_DIR=/ditto

# Set working directory

WORKDIR $DBT_DIR 

# Run dbt
CMD ["dbt"]
