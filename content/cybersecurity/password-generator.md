---
title: "Secure Password Generator"
date: 2025-01-10
tags: ["python", "cryptography", "tool"]
---

## Scenario

Weak passwords remain one of the most common causes of account compromise and unauthorized access. Many users continue to rely on predictable passwords that can be easily guessed, reused across multiple services, or cracked through brute-force attacks.

To promote stronger authentication practices and deepen my understanding of secure randomization techniques, I developed a **Secure Password Generator** using Python. The application generates complex passwords based on configurable security requirements, including password length, character diversity, and randomness.

The project explored concepts related to cryptographic randomness, secure coding practices, and user-focused security design. The resulting tool provides a simple method for generating strong passwords that align with modern password security recommendations and organizational security policies.

---

### Code Example

```python
import secrets
import string

def generate_password(length=16, use_upper=True, use_lower=True, 
                     use_digits=True, use_symbols=True):
    
    characters = ""
    if use_upper: characters += string.ascii_uppercase
    if use_lower: characters += string.ascii_lowercase
    if use_digits: characters += string.digits
    if use_symbols: characters += "!@#$%^&*"
    
    password = ''.join(secrets.choice(characters) for _ in range(length))
    return password

# Example
password = generate_password(20, use_symbols=True)
print(f"Generated: {password}")
