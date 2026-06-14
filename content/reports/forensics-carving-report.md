---
title: "Digital Forensics File Carving Report"
date: 2026-03-27
tags: ["forensics", "file-carving", "python", "evidence-recovery"]
type: "report"
---

## Digital Forensics File Carving Report

**Candidate:** Titus Kamau
**Case Role:** Junior Digital Forensics Analyst
**Source Image:** 84cc34c1-ef90-4b58-ac73-cd4d8a71967d
**Recovered Valid Files:** 17 fully recovered files

---

### Executive Summary

The binary image was examined for known file signatures and carved using a repeatable Python workflow. The examination produced **17 complete and readable files**:

| Type | Count |
|------|-------|
| JPEG Images | 12 |
| PNG Images | 3 |
| PDF Document | 1 |
| OOXML Word Document | 1 |

Each recovered file was validated for readability and hashed with MD5 to preserve integrity evidence.

---

### Tools and Techniques Used

- Python 3 script for automated scanning, carving, hashing, and metadata logging
- Known file signature matching for JPG, PNG, GIF, PDF, and ZIP/OOXML
- Pillow image validation for carved image files
- pdffinfo to confirm PDF readability
- ZIP/OOXML structure validation for Word document

---

### Methodology

1. **Signature Scanning:** Search binary byte stream for supported file headers
2. **Carving:** Pair headers with footers or logical end markers
3. **Validation:** Test each candidate using format-specific tools
4. **Hashing:** Generate MD5 for integrity evidence
5. **Documentation:** Record offsets, sizes, and hashes

### Recovery Results

| File | Type | Size (bytes) |
|------|------|--------------|
| recovered_01.jpg | JPEG | 44,077 |
| recovered_02.jpg | JPEG | 31,689 |
| recovered_03.jpg | JPEG | 13,907 |
| recovered_01.pdf | PDF | 52,317 |
| recovered_01.docx | DOCX | 246,133 |
| recovered_01.png | PNG | 120,279 |
| (plus 11 additional images) | | |

### Challenges Addressed

- False positives (headers present inside other file formats)
- Overlapping candidates requiring validation filtering
- Duplicate files with identical MD5 hashes

### Skills Demonstrated

- File signature analysis
- Python automation for forensic workflows
- Evidence integrity preservation (hashing)
- Comprehensive documentation

[View Full Report](/reports/Forensics-File-Carving-Report.pdf)
