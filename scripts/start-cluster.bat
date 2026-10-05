set NODE_OPTIONS=--max-old-space-size=4096
@echo off
title ElasticSearch Cluster Launcher

echo Starting ElasticSearch Node 1...
start "ElasticSearch Node 1" "C:\ElasticSearch Training\elasticsearch-9.5.4 - 1st Node\bin\elasticsearch.bat"

echo Starting ElasticSearch Node 2...
start "ElasticSearch Node 2" "C:\ElasticSearch Training\elasticsearch-9.5.4 - 2nd Node\bin\elasticsearch.bat"

echo Waiting for Elasticsearch cluster to respond on HTTP port 9201...
:wait_loop
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:9201' -UseBasicParsing -ErrorAction Stop; exit 0 } catch { exit 1 }"
if %errorlevel% neq 0 (
    timeout /t 3 /nobreak > nul
    goto wait_loop
)

echo Elasticsearch is live! Starting Kibana immediately...
start "Kibana" "C:\ElasticSearch Training\kibana-9.5.4\bin\kibana.bat"