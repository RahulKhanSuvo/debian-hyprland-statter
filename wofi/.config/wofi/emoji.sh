#!/usr/bin/env bash
chosen=$(cat <<'EOF' | wofi --dmenu -p "Pick emoji" -i
😀 Grinning Face
😂 Face with Tears of Joy
🤣 Rolling on the Floor Laughing
😊 Smiling Face with Smiling Eyes
🥰 Smiling Face with Hearts
😍 Smiling Face with Heart-Eyes
🤔 Thinking Face
😴 Sleeping Face
😎 Smiling Face with Sunglasses
🙌 Raising Hands
👏 Clapping Hands
🎉 Party Popper
❤️ Red Heart
🔥 Fire
⭐ Star
✅ Check Mark
❌ Cross Mark
👍 Thumbs Up
👎 Thumbs Down
👋 Waving Hand
🤝 Handshake
✊ Raised Fist
🙏 Folded Hands
💀 Skull
👀 Eyes
✨ Sparkles
🌟 Glowing Star
🌈 Rainbow
☀️ Sun
🌙 Moon
⭐ Star
☁️ Cloud
🌧️ Rain
❄️ Snowflake
⚡ Lightning
🌈 Rainbow
🌸 Cherry Blossom
🌻 Sunflower
🌹 Rose
🌺 Hibiscus
🌴 Palm Tree
🍀 Four Leaf Clover
🍁 Maple Leaf
🍂 Fallen Leaf
🍎 Red Apple
🍊 Orange
🍋 Lemon
🍌 Banana
🍉 Watermelon
🍇 Grapes
🍓 Strawberry
🍑 Peach
🥑 Avocado
🌽 Corn
🥕 Carrot
🍕 Pizza
🍔 Hamburger
🌭 Hot Dog
🌮 Taco
🌯 Burrito
🥗 Salad
🍦 Ice Cream
🍩 Doughnut
🍪 Cookie
🎂 Birthday Cake
☕ Hot Beverage
🍺 Beer
🍷 Wine
🥂 Clink Glasses
🍸 Cocktail
🎵 Musical Note
🎶 Musical Notes
🎤 Microphone
🎧 Headphone
🎮 Video Game
🎬 Clapper Board
📷 Camera
📸 Camera with Flash
💻 Laptop
📱 Mobile Phone
⌚ Watch
⏰ Alarm Clock
📌 Pin
📍 Round Pushpin
🔗 Link
🔒 Locked
🔓 Unlocked
🔑 Key
💡 Light Bulb
📖 Open Book
✉️ Envelope
📫 Mailbox
🗑️ Wastebasket
🔔 Bell
🔕 Bell with Slash
💬 Speech Balloon
♻️ Recycling Symbol
🚀 Rocket
🛸 Flying Saucer
🚗 Car
🚕 Taxi
🚌 Bus
🚲 Bicycle
🚆 Train
✈️ Airplane
🚢 Ship
🏠 House
🏢 Office
🏫 School
🏥 Hospital
🏦 Bank
⛪ Church
🎪 Circus Tent
🎭 Performing Arts
🎨 Artist Palette
🖌️ Paintbrush
🧵 Thread
🧶 Yarn
🧊 Ice
🦴 Bone
🦷 Tooth
🐶 Dog
🐱 Cat
🐼 Panda
🐨 Koala
🐸 Frog
🦊 Fox
🐻 Bear
🐯 Tiger
🦁 Lion
🐮 Cow
🐷 Pig
🐵 Monkey
🐔 Chicken
🐧 Penguin
🐦 Bird
🦉 Owl
🦅 Eagle
🐍 Snake
🐢 Turtle
🐠 Fish
🐙 Octopus
🦋 Butterfly
🐝 Bee
🐜 Ant
🦀 Crab
🦞 Lobster
🌍 Globe
🗺️ World Map
🏔️ Mountain
🏖️ Beach
🏜️ Desert
🌲 Evergreen Tree
🌳 Deciduous Tree
🌊 Water Wave
🔥 Fire
🌪️ Tornado
🏁 Chequered Flag
🚩 Triangular Flag
🏳️ White Flag
🏴 Black Flag
🇺🇸 United States
🇬🇧 United Kingdom
🇯🇵 Japan
🇰🇷 South Korea
🇩🇪 Germany
🇫🇷 France
🇪🇸 Spain
🇮🇹 Italy
🇨🇳 China
🇮🇳 India
🇧🇷 Brazil
🇨🇦 Canada
🇦🇺 Australia
🇷🇺 Russia
🇵🇹 Portugal
🇳🇱 Netherlands
🇸🇪 Sweden
🇳🇴 Norway
🇩🇰 Denmark
🇫🇮 Finland
🇵🇱 Poland
🇨🇿 Czech Republic
🇦🇹 Austria
🇨🇭 Switzerland
🇧🇪 Belgium
🇬🇷 Greece
🇹🇷 Turkey
🇮🇱 Israel
🇦🇪 UAE
🇸🇦 Saudi Arabia
🇿🇦 South Africa
🇲🇽 Mexico
🇧🇩 Bangladesh
🇦🇷 Argentina
🇻🇳 Vietnam
🇹🇭 Thailand
🇵🇭 Philippines
🇮🇩 Indonesia
🇲🇾 Malaysia
🇸🇬 Singapore
🇭🇰 Hong Kong
🇹🇼 Taiwan
🇳🇿 New Zealand
🇮🇪 Ireland
🏴󠁧󠁢󠁥󠁮󠁧󠁿 England
🏴󠁧󠁢󠁳󠁣󠁴󠁿 Scotland
🏴󠁧󠁢󠁷󠁬󠁳󠁿 Wales
EOF
)

emoji=$(echo "$chosen" | awk '{print $1}')
if [ -n "$emoji" ]; then
    echo -n "$emoji" | wl-copy
    notify-send "Emoji" "$emoji copied to clipboard"
fi
