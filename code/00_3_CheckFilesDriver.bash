## Checking if the foler/file exist and save the output in report folder in a file named checked_files.txt

bash code/checkFoldersFiles/00_check_folders_and_files.bash

if [ "$?" != "0" ]; then
    echo "[Error] Sorry! Some files are missing, exiting...!" 1>&2
    exit 1
fi
