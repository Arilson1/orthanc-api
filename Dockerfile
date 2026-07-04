FROM jodogne/orthanc-plugins:latest

# Orthanc não tem suporte a CORS embutido (decisão de design do projeto) — um
# proxy nginx na frente é quem adiciona os headers que o navegador exige para
# o MedView falar direto com este servidor a partir de outra origem.
RUN apt-get update && apt-get install -y --no-install-recommends nginx \
    && rm -rf /var/lib/apt/lists/*

# Copia os arquivos de configuração para dentro do container
COPY orthanc.json /etc/orthanc/orthanc.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Porta exposta pelo Render — atendida pelo nginx, que repassa para o Orthanc
# (porta interna 8043, ver orthanc.json)
EXPOSE 8042

# A imagem base fixa ENTRYPOINT ["Orthanc"], então sem isso o CMD abaixo
# seria passado como argumento pro binário Orthanc (ele tentaria interpretar
# "/start.sh" como se fosse o JSON de configuração).
ENTRYPOINT []
CMD ["/start.sh"]
