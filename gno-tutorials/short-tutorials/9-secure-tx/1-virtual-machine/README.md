# Airgapped VM for Secure Transactions

This project provides a portable, airgapped virtual machine environment for securely signing cryptocurrency transactions offline. The VM has all networking capabilities permanently disabled to ensure complete isolation from online threats.

## Features

- 🛡️ **True airgap** - All network interfaces disabled
- 📦 **Portable** - Easy to share and deploy via single `.box` file
- 🏗️ **Pre-configured** - Includes essential security tools
- 🪶 **Lightweight** - Based on Alpine Linux (~60MB)

## Prerequisites

- [Vagrant](https://www.vagrantup.com/) (v2.2+)
- [VirtualBox](https://www.virtualbox.org/) (v6.0+) or [libvirt](https://libvirt.org/)

## Quick Start

1. **Clone the repository**:
   ```bash
   git clone git@github.com:samouraiworld/peerdev.git
   cd short-tutorials/9-secure-tx/1-virtual-machine
   ```

2. **Start the VM**:
   ```bash
   vagrant up
   ```

3. **Access the airgapped environment**:
   ```bash
   vagrant ssh
   ```

## Usage

### Inside the VM:
- Verify network isolation:
  ```bash
  ping 8.8.8.8  # Should fail
  ip a          # Should only show loopback interface
  ```

- Sign transactions securely (example with gnokey):
  ```bash
  gnokey sign --home ~/.gnokey unsigned_tx.json > signed_tx.json
  ```

### Transferring Files:
Use one of these secure methods:

1. **VirtualBox Shared Folder** (read-only recommended):
   ```bash
   # On host: Add to Vagrantfile
   config.vm.synced_folder "./shared", "/mnt/shared", readonly: true
   ```

2. **USB Passthrough**:
   ```bash
   vagrant halt
   # Configure USB device in VirtualBox GUI
   vagrant up
   ```

3. **QR Codes** (most secure):
   - Display QR on host, scan from VM using `qrencode`/`zbarimg`

## Security Verification

1. Network isolation:
   ```bash
   cat /etc/network/interfaces  # Should only contain loopback config
   ```

2. No open ports:
   ```bash
   netstat -tuln  # Should show no listening ports
   ```

3. Verify installed packages:
   ```bash
   apk info  # Review installed packages
   ```

## Customization

Edit the `Vagrantfile` to:

- Add additional security tools:
  ```ruby
  config.vm.provision "shell", inline: <<-SHELL
    apk add --no-cache gnupg openssl
  SHELL
  ```

- Adjust resources:
  ```ruby
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end
  ```

## Sharing Your Airgapped VM

1. Package the VM:
   ```bash
   vagrant package --output airgap-vm.box
   ```

2. Share the `.box` file and `Vagrantfile`

## Best Practices

- 🔒 Always verify transaction details on the VM before signing
- 🗑️ Destroy the VM after sensitive operations:
  ```bash
  vagrant destroy
  ```
- 🔄 Use fresh clones for critical transactions
- 🖨️ For maximum security, transfer data via QR codes or dedicated USB drives

## License

MIT License - see [LICENSE](LICENSE) file for details

---

**Warning**: While this provides strong isolation, always verify your specific security requirements. Consider dedicated hardware for high-value transactions.