#7, 10, x

readarray -t images < <(curl http://www.pm10-ambiente.com/strumentazione --silent | awk -F'src="' -F'"' 'BEGIN { FS="src=\"|\""; } /class="instrument_image"/ {print "\"" "http://www.pm10-ambiente.com" $6 "\""}')
readarray -t filenames < <(curl http://www.pm10-ambiente.com/strumentazione --silent | awk -F'src="' -F'"' 'BEGIN { FS="src=\"|\""; } /class="instrument_image"/ {print "\"" $6 "\""}')
cookie_it=$(curl http://www.pm10-ambiente.com/home/italian --head -s | awk -F'Set-Cookie: symfony=|;' '/Set-Cookie: symfony=/ {print $2}')
readarray -t categories_it < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_it" --silent | awk -F'<h3 class="category_title"><a class="toggle_img">|</a><img class="toggle_img"' '/img class="toggle_img"/{print "\"" $2 "\"" }')
readarray -t titles_it < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_it" --silent | awk -F'<h6>|</h6>'  '/<h6>/{print "\"" $2 "\"" }')
readarray -t descriptions_it < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_it" --silent | awk -F'<p>|</p>'  '/<p>/{print "\"" $2 "\"" }')
cookie_en=$(curl http://www.pm10-ambiente.com/home/english --head -s | awk -F'Set-Cookie: symfony=|;' '/Set-Cookie: symfony=/ {print $2}')
readarray -t categories_en < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_en" --silent | awk -F'<h3 class="category_title"><a class="toggle_img">|</a><img class="toggle_img"' '/img class="toggle_img"/{print "\"" $2 "\"" }')
readarray -t titles_en < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_en" --silent | awk -F'<h6>|</h6>'  '/<h6>/{print "\"" $2 "\"" }')
readarray -t descriptions_en < <(curl http://www.pm10-ambiente.com/strumentazione --cookie "symfony=$cookie_en" --silent | awk -F'<p>|</p>'  '/<p>/{print "\"" $2 "\"" }')

tools_count=${#images[@]}
categories_count=${#categories_it[@]}

for (( i=0; i < tools_count; i++ )); do 
    image_file=$(echo ${filenames[$i]} | sed 's/\"\/images\/strumenti\///g' | tr -d '"')
    image_url=$(echo "${images[$i]}" | tr -d '"')
    curl $image_url -o "./media/tools/$image_file" -s
done

echo "# Tools" > ./_data/tools.yaml
echo "categories:" >> ./_data/tools.yaml
for (( i=0; i < categories_count; i++ )); do 
    echo "  -" >> ./_data/tools.yaml
    printf "    key: c%d\n" $i >> ./_data/tools.yaml
    printf "    title:\n"  >> ./_data/tools.yaml
    printf "      en: %s\n" "${categories_en[$i]}" >> ./_data/tools.yaml
    printf "      it: %s\n" "${categories_it[$i]}" >> ./_data/tools.yaml
done
echo "tools:" >> ./_data/tools.yaml
for (( i=0; i < tools_count; i++ )); do 
    image_file=$(echo ${filenames[$i]} | sed 's/\"\/images\/strumenti\///g' | tr -d '"')
    if (( i > 16 )); then
    category="c2"
    elif (( i > 6 )); then
    category="c1"
    else
    category="c0"
    fi
    echo "  -" >> ./_data/tools.yaml
    printf "    image: media/tools/%s\n" "$image_file" >> ./_data/tools.yaml
    printf "    category: $category\n"  >> ./_data/tools.yaml
    printf "    title:\n"  >> ./_data/tools.yaml
    printf "      en: %s\n" "${titles_en[$i]}" >> ./_data/tools.yaml
    printf "      it: %s\n" "${titles_it[$i]}" >> ./_data/tools.yaml
    printf "    description:\n" >> ./_data/tools.yaml
    printf "      en: %s\n" "${descriptions_en[$i]}" >> ./_data/tools.yaml
    printf "      it: %s\n" "${descriptions_it[$i]}" >> ./_data/tools.yaml
done