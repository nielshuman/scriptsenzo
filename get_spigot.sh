#! /bin/bash
# gemaakt door niels huisman ofzo

if [ -z "$1" ]
  then
    echo "No argument supplied."
    echo "Usage: get_spigot <output_file> [version]"
    exit 2
fi


dir="$(pwd)"
outputfile="$( realpath $1 )"
version="$2"
tempdir="$( mktemp -d )"

cd "$tempdir"

wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

mkdir out
java -jar BuildTools.jar --rev ${version:-latest} --output-dir out

cd out
yes | rm "$outputfile"
mv spigot*.jar "$outputfile"

cd "$dir"
yes | rm -r -v "$tempdir"