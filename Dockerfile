FROM jodogne/orthanc-plugins:latest

# Copia o arquivo de configuração para dentro do container
COPY orthanc.json /etc/orthanc/orthanc.json

# Garante a porta correta exposta pelo Render
EXPOSE 8042

CMD ["/etc/orthanc/orthanc.json"]
