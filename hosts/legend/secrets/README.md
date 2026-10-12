# Secrets Management

This directory contains encrypted secrets for WireGuard configuration.

## Setup

### 1. Generate an age key

```bash
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
```

Copy the public key from the output (starts with `age1...`).

### 2. Encrypt your WireGuard private key

Edit `wireguard.yaml` and replace `REPLACE_WITH_ACTUAL_PRIVATE_KEY_THEN_ENCRYPT` with your actual private key:

```yaml
wg0_private_key: "YOUR_PRIVATE_KEY_HERE"
```

Then encrypt it:

```bash
# Get your age recipient (public key)
AGE_RECIPIENT=$(grep "^#" ~/.config/sops/age/keys.txt | grep -o "age1[a-z0-9]\+")

# Encrypt the file
sops --encrypt --age "$AGE_RECIPIENT" --in-place hosts/legend/secrets/wireguard.yaml
```

### 3. Build and deploy

```bash
nixos-rebuild switch
```

The system will automatically decrypt the key at build time using your age key.
