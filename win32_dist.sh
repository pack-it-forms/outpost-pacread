# Release packaging script
#
# This script should be run on a system with the bash provided
# by the GitHub git shell.  The system should have the 32-bit
# Python 3.4 with compatible versions of pywin32 and cx_Freeze
# installed and available on the path.
#
# The script should be called from the root directory of a
# checkout of pack-it-forms (the directory in which it resides).

version=$(cat "./VERSION")
forms_version=$(cat "./VERSION_OF_FORMS")
forms_repo="https://github.com/pack-it-forms/pack-it-forms.git"
distfile="pack-it-forms-${version}-win32.zip"

if [ -e "${distfile}" ]; then
    printf "Dist file already exists: %s\n" "${distfile}"
    exit 1
fi

tmpdir=$(mktemp -d -p .)
dest="${tmpdir}/pack-it-forms"
mkdir "${dest}"
git clone --depth 1 --branch "${forms_version}" "${forms_repo}" "${dest}"
rm -r "${dest}/.git" "${dest}/.gitignore"
for f in "README.md" "LICENSE" "AUTHORS"; do
    mv "${dest}/${f}" "${dest}/${f%%.*}_FORMS.${f#*.}"
done
install -D -v "CONFIG" "VERSION" "VERSION_OF_FORMS" "${dest}"
install -D -v "pac-read/{pac-read.py,setup.py}" "${dest}/resources/scripts/pac-read"
(cd "${dest}/resources/scripts/pac-read" && python ./setup.py build)
(cd "${tmpdir}" && powershell Compress-Archive -Path pack-it-forms -DestinationPath "..\\${distfile}")
rm -r ${tmpdir}
