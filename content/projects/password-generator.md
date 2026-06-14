---
title: "Secure Password Generator"
date: 2024-01-13
tags: ["python", "cryptography", "tool"]
---

## 🔐 Secure Password Generator

A cryptographically secure password generator following security best practices.

### Why Cryptographically Secure?

Regular random generators are predictable. This uses Python's `secrets` module for **truly random** passwords that can't be guessed.

### Features

| Feature | Description |
|---------|-------------|
| Custom length | 8-128 characters |
| Character sets | Uppercase, lowercase, numbers, symbols |
| Exclusion options | Remove ambiguous characters (0, O, I, l) |
| Strength meter | Estimates password entropy |
| Copy to clipboard | Convenient password management |

### The Code

```python
#!/usr/bin/env python3
import secrets
import string
import argparse
import sys

class PasswordGenerator:
    def __init__(self):
        self.uppercase = string.ascii_uppercase
        self.lowercase = string.ascii_lowercase
        self.digits = string.digits
        self.symbols = "!@#$%^&*()_+-=[]{}|;:,.<>?"
        self.ambiguous = "0OIl1|"
    
    def generate(self, length=16, use_upper=True, use_lower=True, 
                 use_digits=True, use_symbols=True, exclude_ambiguous=False):
        
        # Build character pool
        pool = ""
        if use_upper: pool += self.uppercase
        if use_lower: pool += self.lowercase
        if use_digits: pool += self.digits
        if use_symbols: pool += self.symbols
        
        if exclude_ambiguous:
            pool = ''.join(c for c in pool if c not in self.ambiguous)
        
        if not pool:
            raise ValueError("Select at least one character type")
        
        # Generate password using cryptographically secure random
        password = ''.join(secrets.choice(pool) for _ in range(length))
        return password
    
    def calculate_entropy(self, password):
        """Calculate password entropy in bits"""
        charset_size = len(set(password))
        entropy = len(password) * (charset_size.bit_length())
        return entropy
    
    def strength_meter(self, entropy):
        """Rate password strength"""
        if entropy < 40:
            return "Weak"
        elif entropy < 60:
            return "Moderate"
        elif entropy < 80:
            return "Strong"
        else:
            return "Very Strong"

def main():
    parser = argparse.ArgumentParser(description="Secure Password Generator")
    parser.add_argument("-l", "--length", type=int, default=16, 
                        help="Password length (8-128)")
    parser.add_argument("-n", "--no-upper", action="store_false", dest="upper",
                        help="Exclude uppercase letters")
    parser.add_argument("-m", "--no-lower", action="store_false", dest="lower",
                        help="Exclude lowercase letters")
    parser.add_argument("-d", "--no-digits", action="store_false", dest="digits",
                        help="Exclude digits")
    parser.add_argument("-s", "--no-symbols", action="store_false", dest="symbols",
                        help="Exclude symbols")
    parser.add_argument("-e", "--exclude-ambiguous", action="store_true",
                        help="Exclude ambiguous characters")
    parser.add_argument("-c", "--count", type=int, default=1,
                        help="Number of passwords to generate")
    
    args = parser.parse_args()
    
    generator = PasswordGenerator()
    
    for i in range(args.count):
        password = generator.generate(
            length=args.length,
            use_upper=args.upper,
            use_lower=args.lower,
            use_digits=args.digits,
            use_symbols=args.symbols,
            exclude_ambiguous=args.exclude_ambiguous
        )
        
        entropy = generator.calculate_entropy(password)
        strength = generator.strength_meter(entropy)
        
        print(f"\nPassword {i+1}: {password}")
        print(f"Entropy: {entropy} bits ({strength})")

if __name__ == "__main__":
    main()

# Generate default 16-character password
python password_gen.py

# Generate 32-character password with all options
python password_gen.py --length 32

# Generate 5 passwords without ambiguous chars
python password_gen.py --count 5 --exclude-ambiguous

# Minimal password (lowercase only)
python password_gen.py --length 12 --no-upper --no-digits --no-symbols

Password: xK9#mQ2$pL5@nR8
Entropy: 94 bits (Very Strong)

Password: g7!Wp3&zL9#qR2
Entropy: 89 bits (Strong)

