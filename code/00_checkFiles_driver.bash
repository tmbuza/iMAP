## Checking if the foler/file exist and save the output in report folder in a file named checked_files.txt

bash iMAP/code/requirements/iMAP_checkFiles_driver.bash


if [ "$?" != "0" ]; then
    echo "[Error] Some files are missing,!" 1>&2
    exit 1
fi
