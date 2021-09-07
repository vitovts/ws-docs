# --- GitHub 
# --- Get a github account.

 - Download and install git.
 - Set up git with your user name and email.

 - Open a terminal/shell and type:
$ git config --global user.name "Your name here"
$ git config --global user.email "your_email@example.com"

 - I also do:
$ git config --global color.ui true
$ git config --global core.editor emacs

Look to see if you have files ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub.
If not, create such public/private keys: Open a terminal/shell and type:
$ ssh-keygen -t rsa -C "your_email@example.com"
$ pbcopy < ~/.ssh/id_rsa.pub
Paste your ssh public key into your github account settings.

# -- Go to your github Account Settings
Click “SSH Keys” on the left.
Click “Add SSH Key” on the right.

In a terminal/shell, type the following to test it:
$ ssh -T git@github.com
>>
If it says something like the following, it worked:
Hi username! You've successfully authenticated, but Github does
not provide shell access.

# --- Start a new git repository
# -- A new repo from scratch
 - Create a directory to contain the project.
 - Go into the new directory.
 - git init
 - Write some code.
 - Type git add * 
 - Type git commit
The first file to create (and add and commit) is probably a ReadMe file, either as plain text or with Markdown, describing the project.

# -- A new repo from an existing project

mkdir test
cd test
git init 
echo "This repo was created remotely" >> README.md
git add .
git commit -m "first commit"
git remote add origin git@github.com:USER/test.git
curl -u 'USER:TOKEN' https://api.github.com/user/repos -d '{"name":"test"}'
git push -u origin master

USER - ваш логин на гитхабе
TOKEN - токен типа 6ccfd64d55fc1ca1cc26ffe2b9351cc9 сгенерированый по инструкции




