# oss-audit-24BAI10083

## Student Information
- **Student Name:** Aditya Kumar  
- **Roll Number:** 24BAI10083

## Chosen Software (for audit focus)
- **Software:** Python (python3 package on Debian/Ubuntu-based Linux)

This repository contains Shell scripts for an Open Source Software (OSS) audit style activity. The scripts collect system details, inspect an installed FOSS package, audit directories/permissions, analyze log files, and generate a short “open source manifesto” text file.

---

## Repository Contents (Scripts)
- `identity.sh` — Script 1: System Identity Report
- `Foss.sh` — Script 2: FOSS Package Inspector (audits `python3`)
- `script3.sh` — Script 3: Disk and Permission Auditor
- `script4.sh` — Script 4: Log File Analyzer
- `script5.sh` — Script 5: Open Source Manifesto Generator

---

## Dependencies (Linux)
These scripts are intended for Linux.

### Required (usually pre-installed)
- `bash`
- Core GNU/Linux utilities: `uname`, `whoami`, `uptime`, `date`, `grep`, `cut`, `tr`, `awk`, `ls`, `du`, `tail`, `sleep`, `cat`

### Required for `Foss.sh`
- `dpkg` (Debian/Ubuntu package manager tooling)

Install on Debian/Ubuntu if needed:
```bash
sudo apt update
sudo apt install -y dpkg
```

### Optional (if you want Python installed for the audit target)
```bash
sudo apt update
sudo apt install -y python3
```

---

## How to Run (Step-by-step on Linux)

### 1) Clone the repository
```bash
git clone https://github.com/Adityakumar618/oss-audit-24BAI10083.git
cd oss-audit-24BAI10083
```

### 2) Make scripts executable
```bash
chmod +x identity.sh Foss.sh script3.sh script4.sh script5.sh
```

### 3) Run each script

---

## Script 1: `identity.sh` — System Identity Report
### What it does
Prints a formatted system report including:
- OS distribution name (from `/etc/os-release`)
- kernel version
- current user
- home directory
- uptime
- current date/time
- a short GPL/free software message

### Run
```bash
./identity.sh
```

### Notes
- No external dependencies beyond standard Linux tools.
- The script contains variables like `STUDENT_NAME` and `SOFTWARE_CHOICE` which you can edit if required by your course.

---

## Script 2: `Foss.sh` — FOSS Package Inspector
### What it does
Checks whether a target package is installed (default: `python3`) using `dpkg -s`.  
If installed, it prints:
- Version
- Description
- Homepage (if present)

It also prints a short “philosophy & purpose” message for some known packages via a `case` statement.

### Run
```bash
./Foss.sh
```

### Notes
- Works best on Debian/Ubuntu systems because it uses `dpkg`.
- To audit a different package, edit this line in the script:
  - `PACKAGE="python3"`

---

## Script 3: `script3.sh` — Disk and Permission Auditor
### What it does
Audits a set of important directories and prints:
- permissions, owner, group (via `ls -ld` and `awk`)
- total size (via `du -sh`)

Default audited directories:
- `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`

It also checks a Python-related footprint directory:
- `/usr/lib/python3`

### Run
```bash
./script3.sh
```

### Notes
- Some directories may require elevated permissions to fully access on certain systems. If you see permission issues, try:
```bash
sudo ./script3.sh
```

---

## Script 4: `script4.sh` — Log File Analyzer
### What it does
Analyzes a log file and counts how many lines match a keyword (case-insensitive).
- Argument 1: log file path (required)
- Argument 2: keyword (optional, default is `"error"`)

After counting, it prints a summary and shows the last 5 matching entries (if any).

### Run (examples)
Analyze `/var/log/syslog` for `python`:
```bash
./script4.sh /var/log/syslog python
```

Use default keyword (`error`):
```bash
./script4.sh /var/log/syslog
```

### Notes
- If the log file requires root permissions:
```bash
sudo ./script4.sh /var/log/syslog error
```
- On some distros, `/var/log/syslog` may not exist (e.g., some use `journalctl` instead). In that case, choose an existing log file under `/var/log/`.

---

## Script 5: `script5.sh` — Open Source Manifesto Generator
### What it does
Prompts you for 3 answers and generates a text file named:
- `manifesto_<your-username>.txt`

The file includes:
- a title line (uppercase username)
- generation date
- a short manifesto paragraph based on your inputs

### Run
```bash
./script5.sh
```

### Output
After completion, you should see a new file in the same directory, for example:
- `manifesto_aditya.txt`

To view it again:
```bash
cat manifesto_$(whoami).txt
```

---

## Troubleshooting
- **“Permission denied” when running a script**
  ```bash
  chmod +x <scriptname>.sh
  ```
- **`dpkg: command not found`**
  You’re likely not on Debian/Ubuntu, or dpkg isn’t installed. Use Debian/Ubuntu, or adapt the script to your distro’s package manager.
- **Log file not found**
  Verify the path:
  ```bash
  ls -l /var/log/
  ```

---

## License
This repository is for educational/audit purposes. 
