#!/bin/sh

# download images from:
# https://jc.pep.com.cn/

dir=english-g3s2
pages=96

mkdir -p $dir/

for i in `seq 1 $pages`; do
    echo $i
    curl 'https://book.pep.com.cn/1212001302143/files/mobile/'$i'.jpg?240301113733' \
      -H 'accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8' \
      -H 'accept-language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7' \
      -H 'cookie: YWBD_COUNT_U=174132292-a6a538adc9db4ff59940e923f03b69f0; YWBD_COUNT_G=174132292-dc6083959b9d4b1aa3032855cc180711; acw_tc=7d260b1917204043098774260e233507321ccfde71689acadf9adfdca0; cdn_sec_tc=7d260b1917204043098774260e233507321ccfde71689acadf9adfdca0; acw_sc__v3=668b497f30d97df9ff68e1231afcaec1dab1e7ef; tfstk=f-bZwS15dEXIfpjDLpT2ULuwuZ89kUe5mZ9XisfD1dvgDF643p5cfK10Bt72LtKXIhxDxeAviC0MohYHtI9d3nF9hKvVhsj_Oza561LvoKy7PzshPgh1QA0DmSvHMQ2kWAeO61Lx9XM0VMft0PbaC-8cneYH6QYDiCXD-evpMIDMiVVFtpdDoqmMiB0HwIDmSURyY3zeZhVoICi0TP9HbLfUvq02q4tMEKJno8be_rvlspumudFfmG5cn-uXrgBFu3XYu2L1aMYH_MPmxdxPjOOd3zuMIw5GSd_gdV9GW6j5l9VmoKShq3dP-5qkjgB1qH7QQ2plx65XYMFxfKsJitKRl839IsfRygTzujRF46YF4DkvtZyFkGkm0hApTLNUtw0CM7dzzA6IDmKhhBJ761nxDhxwTLNUTmnvxFAeF5CO.' \
      -H 'priority: i' \
      -H 'referer: https://book.pep.com.cn/1212001302143/mobile/index.html' \
      -H 'sec-ch-ua: "Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"' \
      -H 'sec-ch-ua-mobile: ?0' \
      -H 'sec-ch-ua-platform: "macOS"' \
      -H 'sec-fetch-dest: image' \
      -H 'sec-fetch-mode: no-cors' \
      -H 'sec-fetch-site: same-origin' \
      -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36' \
      > $dir/$i.jpg


    # curl 'https://book.pep.com.cn/1221001302141/files/mobile/'$i'.jpg?240229151518' \
    #   -H 'accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8' \
    #   -H 'accept-language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7' \
    #   -H 'cookie: YWBD_COUNT_U=174132292-a6a538adc9db4ff59940e923f03b69f0; YWBD_COUNT_G=174132292-dc6083959b9d4b1aa3032855cc180711; acw_tc=7d260b1917204043098774260e233507321ccfde71689acadf9adfdca0; cdn_sec_tc=7d260b1917204043098774260e233507321ccfde71689acadf9adfdca0; acw_sc__v3=668b497f30d97df9ff68e1231afcaec1dab1e7ef; tfstk=f-bZwS15dEXIfpjDLpT2ULuwuZ89kUe5mZ9XisfD1dvgDF643p5cfK10Bt72LtKXIhxDxeAviC0MohYHtI9d3nF9hKvVhsj_Oza561LvoKy7PzshPgh1QA0DmSvHMQ2kWAeO61Lx9XM0VMft0PbaC-8cneYH6QYDiCXD-evpMIDMiVVFtpdDoqmMiB0HwIDmSURyY3zeZhVoICi0TP9HbLfUvq02q4tMEKJno8be_rvlspumudFfmG5cn-uXrgBFu3XYu2L1aMYH_MPmxdxPjOOd3zuMIw5GSd_gdV9GW6j5l9VmoKShq3dP-5qkjgB1qH7QQ2plx65XYMFxfKsJitKRl839IsfRygTzujRF46YF4DkvtZyFkGkm0hApTLNUtw0CM7dzzA6IDmKhhBJ761nxDhxwTLNUTmnvxFAeF5CO.' \
    #   -H 'priority: i' \
    #   -H 'referer: https://book.pep.com.cn/1221001302141/mobile/index.html' \
    #   -H 'sec-ch-ua: "Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"' \
    #   -H 'sec-ch-ua-mobile: ?0' \
    #   -H 'sec-ch-ua-platform: "macOS"' \
    #   -H 'sec-fetch-dest: image' \
    #   -H 'sec-fetch-mode: no-cors' \
    #   -H 'sec-fetch-site: same-origin' \
    #   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36' \
    #   > $dir/$i.jpg
done


convert $(
for i in `seq 1 $pages`; do
    echo $dir/$i.jpg
done
) $dir.pdf

exit
