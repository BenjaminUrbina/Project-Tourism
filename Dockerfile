# Usa la imagen oficial de Jupyter con Python 3.11
FROM jupyter/base-notebook:latest

# Usamos root ya que debian me estaba mandando errores de permiso. En OSX funciona correctamente
USER root

RUN python -m pip install "dask[complete]"
RUN pip install pandas
RUN pip install matplotlib

WORKDIR /home/jovyan/work
COPY . /home/jovyan/work

# Abre el puerto 8888 para Jupyter
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
