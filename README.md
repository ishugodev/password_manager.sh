# Password Manager by ishugodev

This repository contains a Bash script for managing passwords securely using GPG encryption. The script allows adding, retrieving, and encrypting/decrypting service passwords, keeping them safe and protected.

## Features

- **Add Password**: Saves a password for a service, along with the username and password, encrypted.
- **Get Password**: Retrieves the password associated with a specific service.
- **GPG Encryption**: Passwords are encrypted with GPG for security and privacy.
- **Local Storage**: Passwords are stored in a text file and encrypted when needed.

## Requirements

- **GPG (GNU Privacy Guard)**: Required to encrypt and decrypt files.
- **Bash**: The script is written in Bash and must be run in a compatible environment.

## How to Use

1. **Initial Setup**:
    - Replace `your-email-gpg@example.com` in the `password_manager.sh` file with your GPG key associated email.

2. **Run the Script**:
    - Make the script executable:
      ```bash
      chmod +x password_manager.sh
      ```
    - Execute the script:
      ```bash
      ./password_manager.sh
      ```

3. **Available Operations**:
    - **[1]Add Password**: Choose "1" to add a new password.
    - **[2]Get Password**: Choose "2" to search for a service password.
    - **[3]Exit**: Choose "3" to quit the program.

## How It Works

### Encryption

- The script uses GPG to encrypt and decrypt the file containing the passwords (`passwords.txt.gpg`). The encryption key is linked to the email configured at the beginning of the script.
- When a password is added or retrieved, the file is temporarily decrypted, the operation is performed, and then the file is re-encrypted.

### File Structure

- **passwords.txt**: Contains the passwords in a simple format (`service:username:password`).
- **passwords.txt.gpg**: Contains the encrypted version of the `passwords.txt` file.

## Example Usage

```bash
============================
====  Password Manager  ====
============================

Choose option: [1]Add Password / [2]Get Password / [3]Exit
1

Service:
Twitter
Username:
example@twitter.com
Password:
********

Password saved successfully!

============================
====  Password Manager  ====
============================

Choose option: [1]Add Password / [2]Get Password / [3]Exit
2

Enter the service name:
Twitter

Twitter:example@twitter.com:********
```

## Security
- Privacy: Passwords are never stored in plain text. They are encrypted with the GPG key to ensure only the key owner can access them.

- Backup: It is recommended to back up the encrypted file (passwords.txt.gpg) to avoid data loss.
