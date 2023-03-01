import requests
import datetime as dt
import customtkinter
from PIL import ImageTk, Image

customtkinter.set_appearance_mode("System")
customtkinter.set_default_color_theme("dark-blue")

root = customtkinter.CTk()
root.geometry("500x350")

frame = customtkinter.CTkFrame(master=root)
frame.pack(pady=20, padx=60, fill="both", expand=True)

label = customtkinter.CTkLabel(master=frame, text="Which city do you want climate data?", font=("Helvetica Neue", 18))
label.pack(pady=12, padx=10)

entry = customtkinter.CTkEntry(master=frame, placeholder_text="City", font=("Helvetica Neue", 12))
entry.pack(pady=12, padx=10)
cidade = entry.get()

def weatherapp(cidade):
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    API_KEY = open('api_key', 'r').read()
    CITY = cidade

    url = BASE_URL + 'appid=' + API_KEY + "&q=" + CITY
    response = requests.get(url).json()

    temp_kelvin = response["main"]["temp"]
    temp_min_kelvin = response["main"]["temp_min"]
    temp_max_kelvin = response["main"]["temp_max"]
    weather = response["weather"][0]["main"]
    weather_description = response["weather"][0]["description"]
    sunrise_time = dt.datetime.utcfromtimestamp(response['sys']['sunrise'] + response['timezone'])
    sunset_time = dt.datetime.utcfromtimestamp(response['sys']['sunset'] + response['timezone'])

    sunrise_time = str(sunrise_time)
    sunset_time = str(sunset_time)
    sunrise_time = sunrise_time[11:16]
    sunset_time = sunset_time[11:16]

    def kelvin_to_celsius(kelvin):
        celsius = kelvin - 273.15
        return celsius

    temp_celsius = kelvin_to_celsius(temp_kelvin)
    temp_min_celsius = kelvin_to_celsius(temp_min_kelvin)
    temp_max_celsius = kelvin_to_celsius(temp_max_kelvin)

    celsius = ("{:.0f}".format(temp_celsius))
    min_celsius = ("{:.0f}".format(temp_min_celsius))
    max_celsius = ("{:.0f}".format(temp_max_celsius))

    # print(f"Temperature in {CITY}: {celsius}°C")
    # print(f"Minimal: {min_celsius}°C Maximal: {max_celsius}°C")
    # print(f"{weather}, {weather_description}")
    # print(f"Sunrise time: {sunrise_time}, Sunset time: {sunset_time}\n")

    window = customtkinter.CTkToplevel()
    window.geometry("400x200")

    ltemp = customtkinter.CTkLabel(window, text=f"Temperature in {CITY}: {celsius}°C")
    ltemp.pack()

    lminmax = customtkinter.CTkLabel(window, text=f"Minimal: {min_celsius}°C Maximal: {max_celsius}°C")
    lminmax.pack()

    lweather = customtkinter.CTkLabel(window, text=f"{weather}, {weather_description}")
    lweather.pack()

    lsun = customtkinter.CTkLabel(window, text=f"Sunrise time: {sunrise_time}, Sunset time: {sunset_time}")
    lsun.pack()

    if (weather == "Clouds"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/clouds.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    elif (weather == "Mist"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/mist.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    elif (weather == "Rain"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/rain.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    elif (weather == "Snow"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/snow.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    elif (weather == "Clear"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/sun.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    elif (weather == "Thunderstorm"):
        tkimage = ImageTk.PhotoImage(Image.open("icons/thunderstorm.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()
    else:
        tkimage = ImageTk.PhotoImage(Image.open("icons/clouds.png"))
        customtkinter.CTkLabel(window, text="", image=tkimage).pack()



def get_data():
   cidade = entry.get()
   weatherapp(cidade)

button = customtkinter.CTkButton(master=frame, text="Run", font=("Helvetica Neue", 12), command=get_data)
button.pack(pady=12, padx=10)

root.mainloop()