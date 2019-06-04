#!/bin/bash
#URL=$1
NAME=`echo $URL | cut -d '/' -f 7`
curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" $URL > $NAME
LAST=`cat $NAME | grep "card chapters" -A 40 | grep Capítulo | awk -F 'Capítulo ' '{print $2 FS "."}' | cut -d '.' -f1`
URL2=`cat $NAME | grep "card chapters" -A 40 | grep goto | awk -F 'href="' '{print $2 FS "."}' | cut -d '"' -f1`
curl -s -e $URL -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Versio n/5.0.2 Mobile/8J2 Safari/6533.18.5" $URL2 > $NAME
URL2=`cat $NAME | grep url | head -1 | awk -F 'url=' '{print $2 FS "."}' | cut -d '"' -f1`
CHECK=`echo $URL2 | cut -d '/' -f6`
if [ $CHECK != cascade ]; then
   URL2=`echo $URL2 | sed 's/paginated/cascade/g'`
fi
curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" $URL2 > $NAME
cat $NAME | grep .jpg | grep viewer-image | awk -F 'src="' '{print $2 FS "."}' | cut -d '"' -f1 | awk '{for(x=1;x<=NF;x++)if($x~/^/){sub(/^/,++i)}}1' | sed 's/http/.jpg -q http/g' | sed 's/^/wget -O /g' > list.txt
bash list.txt
rm list.txt && rm $NAME
mkdir -p Downloads/$NAME/$NAME\_$LAST && mv *.jpg Downloads/$NAME/$NAME\_$LAST/
