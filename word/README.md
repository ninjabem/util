This is a simple, local, password manager that attempts to adhere to Unix design philosophy.

It composes your preferred text editor and gpg to write encrypted files.

To use it, create a file ~/.assconfig containing the following config keys:
 - DIR
 - EDITOR
 - KEY_ID

The file should look like:
```bash
DIR=~/.assword
EDITOR=ed
KEY_ID=myself@me.com
```

Note: set the `KEY_ID` to your own gpg key id (usually your email address)

Then, copy the following scripts into a directory on your PATH:
 - pw-new
 - pw
 - pw-full
 - pw-edit

### pw-new ###
Requires one argument, the service name: `pw somesite`

Execute your preferred EDITOR, encrypt the results to the recipient
KEY_ID, and save the result as `somesite.asc`.

### pw ###
With no arguments, it will list all services in your `DIR`.

With one argument, it will decrypt the associated file and grep for the `pw` line.

### pw-full ###
With no arguments, it will list all services in your `DIR`.

With one argument, it will decrypt the associated file and show you the full contents.

### pw-edit ###
Make a timestamp'd backup copy of the original encrypted file,
then edit a decrypted version, and finally overwrite the original
encrypted file.

