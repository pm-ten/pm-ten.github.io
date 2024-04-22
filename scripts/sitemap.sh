git ls-tree -r --name-only HEAD | while read filename; do
  token="$filename"
  lastmod="$(git log -1 --format="%ad" --date=format:'%Y-%m-%dT%H:%M:%SZ'  -- $filename)"
  sed -i "s#$token#$lastmod#" _site/files.xml
done