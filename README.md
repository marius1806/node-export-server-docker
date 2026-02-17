# node-export-server-docker

## Local test

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

## Improvements over naive Docker builds:
1. Version pinning for reproducibility
2. Reduced image size using slim base image
3. Removed unnecessary packages
4. Non-root execution for improved security
Healthcheck for production monitoring
