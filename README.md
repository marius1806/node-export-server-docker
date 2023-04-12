# node-export-server-docker

# Local test

1. Clone this repository
2. Build Docker image

```bash
docker build -t highcharts-server .
```

3. Run the server

```bash
docker run --rm -p 7801:80 --name hc highcharts-server
```

4. Test (in a separate console)

```bash
curl -H "Content-Type: application/json" -X POST -d '{"infile":{"title": {"text": "Steep Chart"}, "xAxis": {"categories": ["Jan", "Feb", "Mar"]}, "series": [{"data": [29.9, 71.5, 106.4]}]}}' 127.0.0.1:7801 -o mychart.png
 ```
