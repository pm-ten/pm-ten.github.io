SITEMAP_FILES=${1:-_site/sitemap.txt}
SITEMAP_OUTPUT=${2:-_site/sitemap.xml}
cat $SITEMAP_FILES | while read filename; do
  if [ -n "$filename" ]; then
    # echo "File: $filename."
    token="<lastmod>$filename</lastmod>"
    lastmod="<lastmod>$(git log -1 --format="%ad" --date=format:'%Y-%m-%dT%H:%M:%SZ'  -- $filename)</lastmod>"
    sed -i "s#$token#$lastmod#" $SITEMAP_OUTPUT
  fi
done
rm $SITEMAP_FILES