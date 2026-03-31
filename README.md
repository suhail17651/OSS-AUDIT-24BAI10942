# Open Source Software Audit Capstone Project
### Open Source Software Capstone Project

**Student Name:** Shaik Mohammed Suhail

**Registration Number:** 24BAI10942

**Course:** Open Source Software (NGMC)  

*Chosen Software:** Git (GPL v2)  

**Repository Name:** oss-audit-24BAI10942

---

## About This Project

This repository contains five shell scripts written as part of the Open Source Software capstone project. The chosen software is Git — a distributed version control system released under the GNU General Public License version 2 (GPL v2), created by Linus Torvalds in April 2005.

---

## Scripts Overview

| Script | Filename | Purpose |
|--------|----------|---------|
| Script 1 | `1_system_identity.sh` | Displays a system welcome screen with kernel, user, uptime, and license info |
| Script 2 | `2_package_inspector.sh` | Checks if Git is installed, shows version and license, prints a philosophy note |
| Script 3 | `3_disk_auditor.sh` | Audits key Linux directories for permissions, ownership, and disk usage |
| Script 4 | `4_log_analyzer.sh` | Reads a log file line by line and counts keyword occurrences |
| Script 5 | `5_manifesto.sh` | Interactively generates a personalised open source philosophy statement |

---

## Dependencies

All scripts run on standard Linux systems. The following tools must be available (they are pre-installed on most distributions):

- `bash` — shell interpreter
- `git` — required for Script 2 (the package being inspected)
- `lsb_release` — used in Script 1 to detect the Linux distribution
- `dpkg` or `rpm` — used in Script 2 for package detection
- `awk`, `cut`, `grep`, `du`, `df` — standard text processing tools
- `uptime`, `uname`, `whoami`, `date` — standard system info commands

To install any missing tools on Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install git lsb-release
```

To install on Fedora/RHEL:
```bash
sudo dnf install git redhat-lsb-core
```

---

## How to Run Each Script

### Step 1 — Make all scripts executable

After cloning or downloading this repository, run the following command inside the project folder:

```bash
chmod +x 1_system_identity.sh
chmod +x 2_package_inspector.sh
chmod +x 3_disk_auditor.sh
chmod +x 4_log_analyzer.sh
chmod +x 5_manifesto.sh
```

Or make all of them executable in one command:

```bash
chmod +x *.sh
```

---

### Script 1 — System Identity Report

```bash
./1_system_identity.sh
```

**What it does:** Prints a formatted welcome screen showing the Linux distribution name, kernel version, logged-in user, home directory, system uptime, current date and time, and a note about the GPL v2 license covering the OS.

**Expected output:** A formatted display block with all system details filled in automatically.

---

### Script 2 — FOSS Package Inspector

```bash
./2_package_inspector.sh
```

**What it does:** Detects whether Git is installed, prints its version and license information, shows where the binary is located, and uses a case statement to print a philosophy note about Git and other known FOSS packages.

**Expected output:** Installation status, version number, binary path, and a philosophy statement about Git.

---

### Script 3 — Disk and Permission Auditor

```bash
./3_disk_auditor.sh
```

**What it does:** Loops through seven standard Linux directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/var`, `/usr/share`) and prints the permissions, owner, group, and disk size of each. Also checks Git's specific config file locations.

**Expected output:** A formatted table of directory permissions and sizes, followed by Git config file details.

---

### Script 4 — Log File Analyzer

```bash
./4_log_analyzer.sh /var/log/syslog error
```

**What it does:** Reads the specified log file line by line, counts how many lines contain the keyword, and prints the last 5 matching lines. If no matches are found, it retries with the keyword "warn".

**Arguments:**
- `$1` — path to the log file (required)
- `$2` — keyword to search for (optional, defaults to "error")

**Alternative test if `/var/log/syslog` does not exist on your system:**

```bash
# Create a test log file first
echo "system started successfully" > test.log
echo "error: disk quota exceeded" >> test.log
echo "warning: memory usage high" >> test.log
echo "error: failed to write file" >> test.log
echo "normal operation continuing" >> test.log

# Then run the script against it
./script4_log_analyzer.sh test.log error
```

**Other log files to try depending on your distribution:**

```bash
./4_log_analyzer.sh /var/log/messages error      # Fedora/RHEL
./4_log_analyzer.sh /var/log/auth.log error      # Ubuntu
./4_log_analyzer.sh /var/log/kern.log error      # Kernel log
```

---

### Script 5 — Open Source Manifesto Generator

```bash
./5_manifesto.sh
```

**What it does:** Asks you three interactive questions, then composes a personalised open source philosophy paragraph using your answers and saves it to a file named `manifesto_[yourusername].txt`. The file is also printed to the terminal.

**What you will be asked:**
1. One open-source tool you use every day
2. One word that describes what freedom means to you
3. One thing you would build and share freely

**Output file:** `manifesto_[yourusername].txt` — saved in the same directory as the script.

---

## Troubleshooting

**Permission denied when running a script:**
```bash
chmod +x scriptname.sh
```

**`lsb_release: command not found` on Script 1:**
```bash
sudo apt-get install lsb-release       # Ubuntu/Debian
sudo dnf install redhat-lsb-core       # Fedora/RHEL
```

**Script 4 — log file not found:**  
Try `/var/log/messages` instead of `/var/log/syslog`, or create a test log file as shown above.

**Running on a system without `dpkg` or `rpm`:**  
Script 2 will detect which package manager is available automatically. If neither is found, install one of them or run the script on a standard Linux distribution.

---

## Project Report

The full project report (PDF) is submitted separately on the VITyarthi portal. It covers:

- Part A — Origin and Philosophy of Git (Units 1 & 2)
- Part B — Linux Footprint of Git (Unit 2)
- Part C — The FOSS Ecosystem around Git (Units 3 & 4)
- Part D — Git vs Perforce: Open Source vs Proprietary (Critical Analysis)
