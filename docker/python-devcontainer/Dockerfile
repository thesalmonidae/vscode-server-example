ARG         PYTHON_TAG="3.10.14"
FROM        python:${PYTHON_TAG}

ARG         VSCODE_SERVER_VERSION=4.90.3
RUN         apt update && \
            apt -y install \
                sudo \
                software-properties-common && \
                curl -fsSL https://code-server.dev/install.sh | sh -s -- --version ${VSCODE_SERVER_VERSION}

ARG     APACHE_AIRFLOW_VERSION="2.9.2"
ARG     AVRO_VERSION="1.11.3"
ARG     BEHAVE_VERSION="1.2.6"
ARG     CONFLUENT_KAFKA_VERSION="2.4.0"
ARG     DATASETS_VERSION="2.20.0"
ARG     FASTAVRO_VERSION="1.9.4"
ARG     HUGGINGFACE_HUB_VERSION="0.23.4"
ARG     GRPCIO_VERSION="1.62.2"
ARG     GRPCIO_TOOLS_VERSION="1.62.2"
ARG     IPYKERNEL_VERSION="6.29.4"
ARG     KERAS_VERSION="3.3.3"
ARG     LANGCHAIN_VERSION="0.2.5"
ARG     LIGHTGBM_VERSION="4.4.0"
ARG     LITELLM_VERSION="1.40.14"
ARG     MATPLOTLIB_VERSION="3.9.0"
ARG     NLTK_VERSION="3.8.1"
ARG     NOTEBOOK_VERSION="7.2.1"
ARG     NUMPY_VERSION="1.26.4"
ARG     OLLAMA_VERSION="0.2.1"
ARG     OPENAI_VERSION="1.34.0"
ARG     OPTUNA_VERSION="3.6.1"
ARG     PANDAS_VERSION="2.2.2"
ARG     PLOTLY_VERSION="5.22.0"
ARG     PSYCOPG_VERSION="3.1.19"
ARG     PYLINT_VERSION="3.2.3"
ARG     PYTEST_VERSION="8.2.2"
ARG     PYTORCH_LIGHTNING_VERSION="2.3.0"
ARG     REQUESTS_VERSION="2.32.3"
ARG     SCAPY_VERSION="2.5.0"
ARG     SCIKIT_LEARN_VERSION="1.5.0"
ARG     SCIPY_VERSION="1.13.1"
ARG     SEABORN_VERSION="0.13.2"
ARG     STATSMODELS_VERSION="0.14.2"
ARG     TENSORFLOW_VERSION="2.16.1"
ARG     TOKENIZERS_VERSION="0.19.1"
ARG     TORCH_VERSION="2.3.1"
ARG     TRANSFORMERS_VERSION="4.41.2"
ARG     QTCONSOLE_VERSION="5.5.2"
ARG     XGBOOST_VERSION="2.0.3"
RUN     pip install \
            apache-airflow==${APACHE_AIRFLOW_VERSION} \
            avro==${AVRO_VERSION} \
            behave==${BEHAVE_VERSION} \
            confluent-kafka==${CONFLUENT_KAFKA_VERSION} \
            datasets==${DATASETS_VERSION} \
            fastavro==${FASTAVRO_VERSION} \
            huggingface-hub==${HUGGINGFACE_HUB_VERSION} \
            grpcio==${GRPCIO_VERSION} \
            grpcio-tools==${GRPCIO_TOOLS_VERSION} \
            ipykernel==${IPYKERNEL_VERSION} \
            keras==${KERAS_VERSION} \
            langchain==${LANGCHAIN_VERSION} \
            lightgbm==${LIGHTGBM_VERSION} \
            litellm==${LITELLM_VERSION} \
            matplotlib==${MATPLOTLIB_VERSION} \
            nltk==${NLTK_VERSION} \
            notebook==${NOTEBOOK_VERSION} \
            numpy==${NUMPY_VERSION} \
            ollama==${OLLAMA_VERSION} \
            openai==${OPENAI_VERSION} \
            optuna==${OPTUNA_VERSION} \
            pandas==${PANDAS_VERSION} \
            plotly==${PLOTLY_VERSION} \
            psycopg==${PSYCOPG_VERSION} \
            pylint==${PYLINT_VERSION} \
            pytest==${PYTEST_VERSION} \
            pytorch-lightning==${PYTORCH_LIGHTNING_VERSION} \
            requests==${REQUESTS_VERSION} \
            scapy==${SCAPY_VERSION} \
            scikit-learn==${SCIKIT_LEARN_VERSION} \
            scipy==${SCIPY_VERSION} \
            seaborn==${SEABORN_VERSION} \
            statsmodels==${STATSMODELS_VERSION} \
            tensorflow==${TENSORFLOW_VERSION} \
            tokenizers==${TOKENIZERS_VERSION} \
            torch==${TORCH_VERSION} \
            transformers==${TRANSFORMERS_VERSION} \
            qtconsole==${QTCONSOLE_VERSION} \
            xgboost==${XGBOOST_VERSION}

ARG         USER=${USER}
ARG         UID=${UID}
ARG         GID=${GID}
RUN         groupadd -g ${GID} ${USER} && \
                useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USER} && \
                echo "${USER}:${USER}" | chpasswd && adduser ${USER} sudo

USER        ${USER}

EXPOSE      8080

ENTRYPOINT  ["code-server", "--auth", "none", "--host", "0.0.0.0"]

RUN         mkdir -p "/home/${USER}/extensions" && \
            mkdir -p "/home/${USER}/workspace" && \
            mkdir -p "/home/${USER}/.local/share/code-server/User" && \
            mkdir -p "/home/${USER}/.local/share/code-server/coder-logs" && \
            chown -R "${USER}:${USER}" "/home/${USER}/.local" && \
            chmod -R 755 "/home/${USER}/.local"

RUN         code-server --install-extension "ms-python.python" && \
            code-server --install-extension "ms-toolsai.jupyter"

WORKDIR     "/home/${USER}/workspace"