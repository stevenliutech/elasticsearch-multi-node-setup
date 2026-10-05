# Elasticsearch & Kibana Local Lab (Windows)

![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=flat&logo=windows)
![Elasticsearch](https://img.shields.io/badge/Elasticsearch-9.5.4-005571?style=flat&logo=elasticsearch)
![Kibana](https://img.shields.io/badge/Kibana-9.5.4-005571?style=flat&logo=kibana)

A streamlined local development lab for orchestrating a multi-node **Elasticsearch** cluster alongside **Kibana** on Windows. This repository provides automated startup scripts, cluster health polling, and performance optimizations.

---

## 📌 Features

* **Automated Batch Launching:** Spins up Node 1, Node 2, and Kibana in individual command windows.
* **Health Check Polling:** Uses PowerShell to poll Elasticsearch port `9200` before launching Kibana.
* **Optimized Boot Times:** Disables background telemetry, newsfeeds, and non-essential startup checks in `kibana.yml`.
* **V8 Heap Tuning:** Boosts Node.js heap allocation (`NODE_OPTIONS`) to prevent memory throttling during Kibana initialization.

---

## 📁 Repository Structure

```text
.
├── config/
│   └── kibana.yml             # Optimized Kibana runtime configuration
├── scripts/
│   └── start-cluster.bat      # Windows batch launcher script
├── .gitignore                 # Prevents committing logs, indices, & binaries
└── README.md                  # Documentation
```

---

## 🚀 Prerequisites & Installation

### Prerequisites
* Windows 10 or 11
* **Elasticsearch 9.5.4** installed locally
* **Kibana 9.5.4** installed locally
* PowerShell 5.1+ (default on Windows)

---

### Setup Instructions

1. **Clone the Repository:**
   ```powershell
   git clone https://github.com/your-username/elasticsearch-kibana-local-lab.git
   cd elasticsearch-kibana-local-lab
   ```

2. **Verify Installation Paths:**
   Open `scripts/start-cluster.bat` and ensure the target paths match your local installation:
   * `C:\ElasticSearch Training\elasticsearch-9.5.4 - 1st Node`
   * `C:\ElasticSearch Training\elasticsearch-9.5.4 - 2nd Node`
   * `C:\ElasticSearch Training\kibana-9.5.4`

3. **Apply Configuration File:**
   Copy the provided `config/kibana.yml` to your Kibana installation directory:
   ```text
   C:\ElasticSearch Training\kibana-9.5.4\config\kibana.yml
   ```

4. **Set Local Credentials:**
   Update `kibana.yml` with your local cluster password:
   ```yaml
   elasticsearch.username: "kibana_system"
   elasticsearch.password: "YOUR_LOCAL_PASSWORD"
   ```

---

## ⚡ Running the Environment

Run the launcher script directly from PowerShell or Command Prompt:

```cmd
.\scripts\start-cluster.bat
```

### Script Execution Flow:
1. Launches **Elasticsearch Node 1** in a new terminal window.
2. Launches **Elasticsearch Node 2** in a new terminal window.
3. Polls `http://localhost:9200` every 3 seconds until the cluster responds.
4. Triggers **Kibana** instantly once the cluster is live.

---

## 🛡️ Security Note

Never commit real cluster passwords or SSL keys to public repositories. Ensure `kibana.yml` contains placeholder text before pushing updates:

```yaml
elasticsearch.password: "YOUR_PASSWORD_HERE"
```
