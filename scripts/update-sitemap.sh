# git ls-tree -r --name-only HEAD | while read filename; do
cat _site/sitemap.txt | while read filename; do
  if [ -n "$filename" ]; then
    # echo "File: $filename."
    token="<lastmod>$filename</lastmod>"
    lastmod="<lastmod>$(git log -1 --format="%ad" --date=format:'%Y-%m-%dT%H:%M:%SZ'  -- $filename)<lastmod>"
    sed -i "s#$token#$lastmod#" _site/sitemap.xml
  fi
done
rm _site/sitemap.txt