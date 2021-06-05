npm install -g purgecss
rm -r published && mkdir published
cp -r html/ published/
purgecss --css "html/**/*.css" --content "html/**/*.html" "src/**/*.js" --output published/
s1=$(du -shc html/*.css | sed -n '$s/\t.*//p')
s2=$(du -shc published/*.css | sed -n '$s/\t.*//p')
echo "Css purged from $s1 to $s2"
