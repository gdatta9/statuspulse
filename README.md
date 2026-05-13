# StatusPulse — Production-Grade DevOps Deployment

## Overview

StatusPulse is a production-style monitoring and incident management platform deployed using modern DevOps practices.

This project demonstrates:

* Containerized application deployment
* Infrastructure hardening
* Monitoring and observability
* Reverse proxy configuration
* Database backup and recovery
* DevSecOps vulnerability scanning
* Production-style Linux server administration

---

# Architecture

```text
Users
  ↓
Caddy Reverse Proxy
  ↓
FastAPI Application (StatusPulse)
  ↓
PostgreSQL Database
Redis Cache

Monitoring Stack:
Prometheus → Metrics Collection
Grafana → Dashboards
Node Exporter → VM Metrics
cAdvisor → Container Metrics
Uptime Kuma → Availability Monitoring
```

---

# Tech Stack

| Component              | Technology              |
| ---------------------- | ----------------------- |
| Backend API            | FastAPI                 |
| Application Server     | Gunicorn + Uvicorn      |
| Database               | PostgreSQL              |
| Cache                  | Redis                   |
| Containerization       | Docker                  |
| Orchestration          | Docker Compose          |
| Reverse Proxy          | Caddy                   |
| Monitoring             | Prometheus              |
| Visualization          | Grafana                 |
| Uptime Monitoring      | Uptime Kuma             |
| Container Metrics      | cAdvisor                |
| Infrastructure Metrics | Node Exporter           |
| Security Scanning      | Trivy                   |
| Operating System       | Ubuntu Server 22.04 LTS |
| Virtualization         | Oracle VirtualBox       |

---

# Features

## Application Features

* Health check endpoints
* Service management
* Incident management
* REST API documentation
* Swagger UI support

## Infrastructure Features

* Dockerized deployment
* Reverse proxy architecture
* Firewall hardening
* SSH remote administration
* Swap memory optimization
* Automatic security updates

## Monitoring Features

* Real-time infrastructure monitoring
* Container monitoring
* Uptime monitoring
* Public status page
* Metrics dashboards
* Prometheus instrumentation

## Security Features

* UFW firewall
* Fail2Ban protection
* Container vulnerability scanning
* Isolated Docker networking
* Non-root deployment practices

---

# Project Structure

```text
statuspulse/
│
├── app/
│   ├── main.py
│   ├── requirements.txt
│   └── ...
│
├── monitoring/
│   └── prometheus/
│       └── prometheus.yml
│
├── caddy/
│   └── Caddyfile
│
├── backups/
│
├── tests/
│   └── test_integration.sh
│
├── docker-compose.yml
├── Dockerfile
├── backup.sh
├── restore.sh
├── .env
├── .env.example
└── README.md
```

---

# Deployment Process

## 1. Clone Repository

```bash
git clone https://github.com/gdatta9/statuspulse.git
cd statuspulse
```

## 2. Configure Environment Variables

Create `.env` file:

```env
DB_HOST=postgres
DB_PORT=5432
DB_NAME=statuspulse
DB_USER=statuspulse
DB_PASSWORD=supersecretpassword

REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=
```

## 3. Build and Deploy

```bash
docker compose up -d --build
```

## 4. Verify Deployment

```bash
docker compose ps
```

---

# Reverse Proxy Configuration

Caddy is used as the reverse proxy layer.

## Features

* HTTP routing
* Gzip compression
* Centralized request handling
* Container-to-container networking

## Access URLs

| Service     | URL                     |
| ----------- | ----------------------- |
| API Docs    | `http://SERVER_IP/docs` |
| Prometheus  | `http://SERVER_IP:9090` |
| Grafana     | `http://SERVER_IP:3000` |
| Uptime Kuma | `http://SERVER_IP:3001` |
| cAdvisor    | `http://SERVER_IP:8080` |

---

# Monitoring Stack

## Prometheus

Prometheus collects:

* FastAPI metrics
* Container metrics
* Infrastructure metrics

Metrics endpoint:

```text
/metrics
```

---

## Grafana Dashboards

Imported dashboards:

| Dashboard          | ID   |
| ------------------ | ---- |
| Node Exporter Full | 1860 |
| Docker Monitoring  | 193  |

---

## Uptime Kuma

Configured monitors:

* StatusPulse Health
* PostgreSQL
* Redis
* StatusPulse Docs

Features:

* Public status page
* Uptime history
* Availability monitoring
* Incident visualization

---

# Security Hardening

## Implemented Security Measures

* UFW firewall rules
* Fail2Ban intrusion prevention
* Docker network isolation
* Automatic security updates
* Vulnerability scanning using Trivy

## Open Ports

| Port | Purpose     |
| ---- | ----------- |
| 22   | SSH         |
| 80   | HTTP        |
| 443  | HTTPS       |
| 3000 | Grafana     |
| 3001 | Uptime Kuma |
| 8080 | cAdvisor    |
| 9090 | Prometheus  |

---

# Backup and Recovery

## Backup Script

```bash
./backup.sh
```

Creates PostgreSQL database backups inside:

```text
backups/
```

---

## Restore Script

```bash
./restore.sh backups/backup-file.sql
```

---

# Vulnerability Scanning

Trivy was used to scan container images.

## Scan Command

```bash
trivy image statuspulse-app
```

## Result Summary

| Severity | Count |
| -------- | ----- |
| Critical | 0     |
| High     | 6     |
| Medium   | 4     |
| Low      | 1     |

---

# DevOps Concepts Demonstrated

This project demonstrates practical understanding of:

* Linux server administration
* Docker containerization
* Infrastructure hardening
* Reverse proxy architecture
* Monitoring and observability
* DevSecOps practices
* Database backup strategies
* Production deployment workflows
* Metrics instrumentation
* Infrastructure troubleshooting

---

# Screenshots

Add screenshots for:

* Swagger API Docs
* Docker Compose containers
* Grafana dashboards
* Prometheus targets
* Uptime Kuma status page
* Trivy vulnerability scan
* VM terminal deployment

Recommended folder:

```text
screenshots/
```

---

# Future Improvements

Potential future enhancements:

* HTTPS certificates with Let's Encrypt
* Kubernetes deployment
* CI/CD pipeline using GitHub Actions
* Alertmanager integration
* Log aggregation using Loki
* Horizontal scaling
* Blue-green deployments
* Infrastructure as Code using Terraform

---

# Learning Outcomes

This project provided hands-on experience with:

* Production-style Linux administration
* Docker networking
* Multi-container orchestration
* Monitoring stack deployment
* Infrastructure troubleshooting
* Reverse proxy configuration
* Vulnerability management
* Observability engineering

---

# Conclusion

StatusPulse demonstrates a complete end-to-end DevOps deployment pipeline including:

* application deployment
* infrastructure setup
* observability
* monitoring
* security hardening
* backup management
* vulnerability scanning

The project follows production-inspired DevOps practices and simulates real-world infrastructure engineering workflows.
