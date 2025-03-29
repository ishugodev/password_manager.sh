#!/bin/bash

PASSWORD_FILE="passwords.txt"
ENCRYPTED_FILE="passwords.txt.gpg"
GPG_RECIPIENT="your-email-gpg@gmail.com"

decrypt_file() {
	    if [ -f "$ENCRYPTED_FILE" ]; then
		   gpg --yes --decrypt --quiet --output "$PASSWORD_FILE" "$ENCRYPTED_FILE" 2>/dev/null
	    fi
}

encrypt_file() {
	    if [ -f "$PASSWORD_FILE" ]; then
 	           gpg --yes --encrypt --recipient "$GPG_RECIPIENT" --output "$ENCRYPTED_FILE" "$PASSWORD_FILE"
		   rm -f "$PASSWORD_FILE"
	    fi
}

add_password() {
	    decrypt_file
	    echo -e "\nService:"
       	    read service
	    echo -e "User:"
	    read user
	    echo -e "Password:"
	    read -s password

	    echo "$service:$user:$password" >> "$PASSWORD_FILE"
	    echo -e "\nPassword saved successfully!!\n"
	    encrypt_file
}

get_password() {
	    decrypt_file
	    echo -e "\nEnter service name:"
	    read service

	    if grep -q "^$service:" "$PASSWORD_FILE"; then
		    grep "^$service:" "$PASSWORD_FILE"
	    else
		    echo -e "\nService not found.\n"
	    fi
	    encrypt_file
}

while true; do
	    echo -e "\n================================"
	    echo "====    Password Manager    ===="
	    echo -e "================================\n"
	    echo "Choose option: [1]Add Password / [2]Get Password / [3]Exit"
	    read option
	
   	    case $option in
		    1) add_password ;;
		    2) get_password ;;
		    3) echo -e "Thanks for using this manager!\n" ; exit ;;
		    *) echo -e "Invalid option! Please, try again.\n" ;;
	    esac
done
