#7, x

readarray -t urls < <(curl http://www.pm10-ambiente.com/link --silent | awk -F'<dd class="link_anchor"><a href="' -F'" target="_blank"' 'BEGIN { FS="src=\"|\""; } /class="link_anchor"/ {print "\"" $4 "\""}')
cookie_it=$(curl http://www.pm10-ambiente.com/home/italian --head -s | awk -F'Set-Cookie: symfony=|;' '/Set-Cookie: symfony=/ {print $2}')
readarray -t categories_it < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_it" --silent | awk -F'<h3 class="category_title"><a class="toggle_img">|</a><img class="toggle_img"' '/img class="toggle_img"/{print "\"" $2 "\"" }')
readarray -t titles_it < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_it" --silent | awk -F'<dt name="search_link_[0-9]+" >|</dt>'  '/dt name="search_link/{print "\"" $2 "\"" }')
readarray -t descriptions_it < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_it" --silent | awk -F'<dd>|</dd>'  '/<dd>/{print "\"" $2 "\"" }')
cookie_en=$(curl http://www.pm10-ambiente.com/home/english --head -s | awk -F'Set-Cookie: symfony=|;' '/Set-Cookie: symfony=/ {print $2}')
readarray -t categories_en < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_en" --silent | awk -F'<h3 class="category_title"><a class="toggle_img">|</a><img class="toggle_img"' '/img class="toggle_img"/{print "\"" $2 "\"" }')
readarray -t titles_en < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_en" --silent | awk -F'<dt name="search_link_[0-9]+" >|</dt>'  '/dt name="search_link/{print "\"" $2 "\"" }')
readarray -t descriptions_en < <(curl http://www.pm10-ambiente.com/link --cookie "symfony=$cookie_en" --silent | awk -F'<dd>|</dd>'  '/<dd>/{print "\"" $2 "\"" }')

links_count=${#urls[@]}
categories_count=${#categories_it[@]}

echo "# Links" > ./_data/links.yaml
echo "categories:" >> ./_data/links.yaml
for (( i=0; i < categories_count; i++ )); do 
    echo "  -" >> ./_data/links.yaml
    printf "    key: c%d\n" $i >> ./_data/links.yaml
    printf "    title:\n"  >> ./_data/links.yaml
    printf "      en: %s\n" "${categories_en[$i]}" >> ./_data/links.yaml
    printf "      it: %s\n" "${categories_it[$i]}" >> ./_data/links.yaml
done
echo "links:" >> ./_data/links.yaml
for (( i=0; i < links_count; i++ )); do 
    if (( i > 6 )); then
    category="c1"
    else
    category="c0"
    fi
    echo "  -" >> ./_data/links.yaml
    printf "    category: $category\n"  >> ./_data/links.yaml
    printf "    url: ${urls[$i]}\n"  >> ./_data/links.yaml
    printf "    title:\n"  >> ./_data/links.yaml
    printf "      en: %s\n" "${titles_en[$i]}" >> ./_data/links.yaml
    printf "      it: %s\n" "${titles_it[$i]}" >> ./_data/links.yaml
    printf "    description:\n" >> ./_data/links.yaml
    printf "      en: %s\n" "${descriptions_en[$i]}" >> ./_data/links.yaml
    printf "      it: %s\n" "${descriptions_it[$i]}" >> ./_data/links.yaml
done