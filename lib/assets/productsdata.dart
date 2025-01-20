import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> fruitsData = {
  'Apples': {
    'imageurl':
        'https://drive.google.com/file/d/1H1cR_7ZsWCIE-voovF_SOHgehed7K0k7/view?usp=drive_link',
    'name': 'Apples',
    'price': 5.00,
    'quantity': 'kg',
    'rating': '4.5 (120 Reviews)',
    'description':
        'Fresh, crunchy, and sweet apples, perfect for snacks or desserts.',
    'category': 'Fruits',
    'productid': 'fruit_001'
  },
  'Bananas': {
    'imageurl':
        'https://drive.google.com/file/d/1ANLsNsHEze2-d7BDM7TlhZgx5g8lWQ9g/view?usp=drive_link',
    'name': 'Bananas',
    'price': 3.00,
    'quantity': 'dozen',
    'rating': '4.3 (100 Reviews)',
    'description':
        'Ripe and sweet bananas, great for quick snacks and smoothies.',
    'category': 'Fruits',
    'productid': 'fruit_002'
  },
  'Oranges': {
    'imageurl':
        'https://drive.google.com/file/d/1amfDyolPrx7ijR8ZO-RehWKFx4fkX_Wq/view?usp=drive_link',
    'name': 'Oranges',
    'price': 6.00,
    'quantity': 'kg',
    'rating': '4.7 (95 Reviews)',
    'description':
        'Fresh oranges, full of juice and flavor, ideal for juices and snacks.',
    'category': 'Fruits',
    'productid': 'fruit_003'
  },
  'Mangoes': {
    'imageurl':
        'https://drive.google.com/file/d/1CQrRruwPV2zMySVsZqTZOrcuanZwSKb6/view?usp=drive_link',
    'name': 'Mangoes',
    'price': 7.50,
    'quantity': 'kg',
    'rating': '4.6 (110 Reviews)',
    'description':
        'Sweet and juicy mangoes, perfect for desserts and smoothies.',
    'category': 'Fruits',
    'productid': 'fruit_004'
  },
  'Grapes (Green)': {
    'imageurl':
        'https://drive.google.com/file/d/12N2i-PYuY1MRGoaxU0Q5c9_0E1Givjmj/view?usp=drive_link',
    'name': 'Grapes (Green)',
    'price': 4.50,
    'quantity': '500 g',
    'rating': '4.8 (150 Reviews)',
    'description':
        'Fresh and crispy green grapes, ideal for snacks and desserts.',
    'category': 'Fruits',
    'productid': 'fruit_005'
  },
  'Watermelon': {
    'imageurl':
        'https://drive.google.com/file/d/1HfkmfgBj5hSnmxukthafvirL4YTMz_iN/view?usp=drive_link',
    'name': 'Watermelon',
    'price': 10.00,
    'quantity': 'unit',
    'rating': '4.9 (200 Reviews)',
    'description':
        'Refreshing and sweet watermelon, perfect for hot days and parties.',
    'category': 'Fruits',
    'productid': 'fruit_006'
  },
  'Papaya': {
    'imageurl':
        'https://drive.google.com/file/d/16hUgGLb3piN3js40TUPCfkquSmgGEqQe/view?usp=drive_link',
    'name': 'Papaya',
    'price': 5.00,
    'quantity': 'unit',
    'rating': '4.4 (80 Reviews)',
    'description':
        'Ripe and sweet papaya, excellent for desserts and smoothies.',
    'category': 'Fruits',
    'productid': 'fruit_007'
  },
  'Kiwi': {
    'imageurl':
        'https://drive.google.com/file/d/1l8xhKYEg8KY7nTpLT3uCiEpyNJira-YR/view?usp=drive_link',
    'name': 'Kiwi',
    'price': 3.50,
    'quantity': '250 g',
    'rating': '4.6 (85 Reviews)',
    'description':
        'Fresh and tangy kiwi, perfect to add a special touch to your salads and desserts.',
    'category': 'Fruits',
    'productid': 'fruit_008'
  },
  'Pineapple': {
    'imageurl':
        'https://drive.google.com/file/d/109ihYrcgoOqL-gflEpoI9_icKZIdxdtc/view?usp=drive_link',
    'name': 'Pineapple',
    'price': 8.00,
    'quantity': 'unit',
    'rating': '4.7 (75 Reviews)',
    'description':
        'Sweet and refreshing pineapple, ideal for desserts and juices.',
    'category': 'Fruits',
    'productid': 'fruit_009'
  },
  'Blueberries': {
    'imageurl':
        'https://drive.google.com/file/d/1uarDbx_ANXudieKflFoHtgxYSca34l_M/view?usp=drive_link',
    'name': 'Blueberries',
    'price': 6.00,
    'quantity': '200 g',
    'rating': '4.9 (130 Reviews)',
    'description':
        'Fresh blueberries, full of antioxidants and flavor, perfect for adding to cereals and desserts.',
    'category': 'Fruits',
    'productid': 'fruit_010'
  }
};
Map<String, dynamic> babyProductsData = {
  'Baby Diapers': {
    'imageurl':
        'https://drive.google.com/file/d/1cz1MmhAr5mjpGw21TRWq4E02qQ8g5esh/view?usp=drive_link',
    'name': 'Baby Diapers',
    'price': 15.00,
    'quantity': '24 Pack',
    'rating': '4.8 (250 Reviews)',
    'description':
        'Medium-sized baby diapers, ultra-absorbent and with an excellent fit. Ideal for keeping your baby dry and comfortable for longer.',
    'category': 'Babycare',
    'productid': 'baby_001'
  },
  'Baby Wipes': {
    'imageurl':
        'https://drive.google.com/file/d/1QlLeR_HH-vLuNOc8XXEwiYUpFFIJ7D0B/view?usp=drive_link',
    'name': 'Baby Wipes',
    'price': 5.00,
    'quantity': '80 Sheets',
    'rating': '4.7 (180 Reviews)',
    'description':
        'Fragrance-free baby wipes, soft and safe for the baby\'s sensitive skin.',
    'category': 'Babycare',
    'productid': 'baby_002'
  },
  'Baby Lotion': {
    'imageurl':
        'https://drive.google.com/file/d/1JyRQgNOKzfUIq5jVdgyS9D4oOnqn-ZTS/view?usp=drive_link',
    'name': 'Baby Lotion',
    'price': 7.00,
    'quantity': '200 ml',
    'rating': '4.6 (150 Reviews)',
    'description':
        'Baby moisturizing lotion, gentle and delicate formula to keep your baby\'s skin soft and hydrated.',
    'category': 'Babycare',
    'productid': 'baby_003'
  },
  'Baby Shampoo': {
    'imageurl':
        'https://drive.google.com/file/d/1eJXQEa5Inz98Owbp8QrUtHTTAIGJ_x7S/view?usp=drive_link',
    'name': 'Baby Shampoo',
    'price': 6.00,
    'quantity': '300 ml',
    'rating': '4.9 (220 Reviews)',
    'description':
        'No-tears baby shampoo, perfect for the baby\'s sensitive hair, keeping it soft and easy to comb.',
    'category': 'Babycare',
    'productid': 'baby_004'
  },
  'Baby Feeding Bottles': {
    'imageurl':
        'https://drive.google.com/file/d/1Emi-E-jCdVV_WkW2zXqdSUi1HsWNSlbc/view?usp=drive_link',
    'name': 'Baby Feeding Bottles',
    'price': 10.00,
    'quantity': 'Pack of 2',
    'rating': '4.8 (180 Reviews)',
    'description':
        'Baby feeding bottles, pack of 2. Ergonomic and anti-colic design, ideal for feeding your baby with comfort.',
    'category': 'Babycare',
    'productid': 'baby_006'
  },
  'Pacifiers': {
    'imageurl':
        'https://drive.google.com/file/d/1jRd9V3SxbFYsT-wK9TmiK7u6ED-Dr--e/view?usp=drive_link',
    'name': 'Pacifiers',
    'price': 4.50,
    'quantity': 'Pack of 2',
    'rating': '4.7 (210 Reviews)',
    'description':
        'Silicone pacifiers, pack of 2, ideal for calming the baby and promoting comfort.',
    'category': 'Babycare',
    'productid': 'baby_007'
  },
  'Baby Laundry Detergent': {
    'imageurl':
        'https://drive.google.com/file/d/19eYDrxkIvtYUCumtR5ooUlg-N3nw5A2H/view?usp=drive_link',
    'name': 'Baby Laundry Detergent',
    'price': 8.00,
    'quantity': '1 L',
    'rating': '4.6 (170 Reviews)',
    'description':
        'Gentle and safe detergent for baby clothes, formulated to keep the baby\'s clothes clean and irritation-free.',
    'category': 'Babycare',
    'productid': 'baby_008'
  },
  'Baby Bath Tub': {
    'imageurl':
        'https://drive.google.com/file/d/1TVOcldh7mTarCQXi51dwdYgwKbDryHOY/view?usp=drive_link',
    'name': 'Baby Bath Tub',
    'price': 20.00,
    'quantity': 'unit',
    'rating': '4.8 (160 Reviews)',
    'description':
        'Plastic baby bath tub, comfortable and safe design for bathing your baby with ease and comfort.',
    'category': 'Babycare',
    'productid': 'baby_009'
  },
  'Teething Rings': {
    'imageurl':
        'https://drive.google.com/file/d/1W8sNeEGlolqRK0usAyWxefjwQNioq7T0/view?usp=drive_link',
    'name': 'Teething Rings',
    'price': 6.00,
    'quantity': 'Set of 3',
    'rating': '4.6 (140 Reviews)',
    'description':
        'Baby teething rings, pack of 3, help soothe gum pain as the baby grows.',
    'category': 'Babycare',
    'productid': 'baby_010'
  }
 };
Map<String, dynamic> groceryProductsData = {
  'Rice': {
    'imageurl':
        'https://drive.google.com/file/d/1K7YuBfAi111XMLhKr4qpwgKeEiHSEgM0/view?usp=drive_link',
    'name': 'Rice',
    'price': 20.00,
    'quantity': '5 kg',
    'rating': '4.8 (200 Reviews)',
    'description': 'High quality rice, ideal for delicate and tasty dishes.',
    'category': 'Grocery',
    'productid': 'grocery_001'
  },
  'Wheat Flour': {
    'imageurl':
        'https://drive.google.com/file/d/1Zimk0j79WIiDfyayNoHszh9q6dBJ5NXi/view?usp=drive_link',
    'name': 'Wheat Flour',
    'price': 8.00,
    'quantity': '2 kg',
    'rating': '4.7 (150 Reviews)',
    'description':
        'Whole wheat flour, rich in fiber and perfect for healthy breads and cakes.',
    'category': 'Grocery',
    'productid': 'grocery_002'
  },
  'Sugar': {
    'imageurl':
        'https://drive.google.com/file/d/1Zaa3bYl05lfd-11lTDlJsLXDrfNqTBlb/view?usp=drive_link',
    'name': 'Sugar',
    'price': 2.50,
    'quantity': '1 kg',
    'rating': '4.6 (180 Reviews)',
    'description':
        'Refined sugar, ideal for sweetening drinks, desserts and other recipes.',
    'category': 'Grocery',
    'productid': 'grocery_003'
  },
  'Salt': {
    'imageurl':
        'https://drive.google.com/file/d/1B8eKsxMfJXcZslRlm3dovt685iMcGZHg/view?usp=drive_link',
    'name': 'Salt',
    'price': 1.50,
    'quantity': '1 kg',
    'rating': '4.5 (120 Reviews)',
    'description':
        'High quality iodized salt, perfect for seasoning your dishes.',
    'category': 'Grocery',
    'productid': 'grocery_004'
  },
  'Lentils': {
    'imageurl':
        'https://drive.google.com/file/d/1RbKX8GQ8cG4cYQuAs-JVnVIocDktXauv/view?usp=drive_link',
    'name': ' Red Lentils',
    'price': 4.00,
    'quantity': '1 kg',
    'rating': '4.7 (140 Reviews)',
    'description':
        'Red lentils rich in protein and fiber, perfect for soups and vegan dishes.',
    'category': 'Grocery',
    'productid': 'grocery_005'
  },
  'Pasta': {
    'imageurl':
        'https://drive.google.com/file/d/1FvYluoOJ12f0Y31UDku2-WFZO4tWAK2i/view?usp=drive_link',
    'name': 'Spaghetti',
    'price': 3.00,
    'quantity': '500 g',
    'rating': '4.6 (200 Reviews)',
    'description':
        'High quality spaghetti, ideal for your favorite Italian recipes.',
    'category': 'Grocery',
    'productid': 'grocery_006'
  },
  'Oats': {
    'imageurl':
        'https://drive.google.com/file/d/1obahAMkw9A-kGg9lImORNuF8_Z9MSdiW/view?usp=drive_link',
    'name': 'Oats',
    'price': 5.00,
    'quantity': '1 kg',
    'rating': '4.8 (170 Reviews)',
    'description':
        'Rolled oats, rich in fiber, perfect for porridge and smoothies.',
    'category': 'Grocery',
    'productid': 'grocery_007'
  },
  'Baking Powder': {
    'imageurl':
        'https://drive.google.com/file/d/1GF4z6F72Q9YQtrSF7g6ZzA48Irp-AtmN/view?usp=drive_link',
    'name': 'Baking Powder',
    'price': 2.00,
    'quantity': '250 g',
    'rating': '4.6 (130 Reviews)',
    'description':
        'Baking powder, ideal for giving lightness to your cakes and breads.',
    'category': 'Grocery',
    'productid': 'grocery_008'
  },
  'Corn Flakes': {
    'imageurl':
        'https://drive.google.com/file/d/1dIjVXjgzdjRfQZzWUqOLfXi2wlsBY3pV/view?usp=drive_link',
    'name': 'Corn Flakes',
    'price': 4.00,
    'quantity': '500 g',
    'rating': '4.7 (160 Reviews)',
    'description': 'Healthy, crunchy cornflakes, perfect for breakfast.',
    'category': 'Grocery',
    'productid': 'grocery_009'
  },
  'Instant Noodles': {
    'imageurl':
        'https://drive.google.com/file/d/1dJPbBl9Tl22t0X_-Q6d4F1FyziLO7aC6/view?usp=drive_link',
    'name': 'Instant Noodles',
    'price': 3.50,
    'quantity': 'Pack of 6',
    'rating': '4.5 (190 Reviews)',
    'description':
        'Instant noodles, quick to prepare and tasty, ideal for a quick snack.',
    'category': 'Grocery',
    'productid': 'grocery_010'
  }
};
Map<String, dynamic> oilsProductsData = {
  'Sunflower Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1y6EbgxTahJEjIc3V0tjfvlqUCePktCAs/view?usp=drive_link',
    'name': 'Sunflower Oil',
    'price': 5.00,
    'quantity': '1 L',
    'rating': '4.6 (150 Reviews)',
    'description':
        'High quality sunflower oil, ideal for cooking and frying with a neutral flavor.',
    'category': 'Oils',
    'productid': 'oils_001'
  },
  'Olive Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1YzppphLLR3RZQTNYKzV41iPP6kBpWD4Q/view?usp=drive_link',
    'name': 'Olive Oil',
    'price': 12.00,
    'quantity': '500 ml',
    'rating': '4.9 (200 Reviews)',
    'description':
        'Extra virgin olive oil, cold pressed, perfect for dressing salads and healthy cooking.',
    'category': 'Oils',
    'productid': 'oils_002'
  },
  'Mustard Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1Z4KdpThNtBcV6vZO2SCXmt67Sh_hhI8D/view?usp=drive_link',
    'name': 'Mustard Oil',
    'price': 7.00,
    'quantity': '1 L',
    'rating': '4.5 (130 Reviews)',
    'description':
        'Mustard oil with a spicy flavor and strong aroma, ideal for seasoning and frying.',
    'category': 'Oils',
    'productid': 'oils_003'
  },
  'Coconut Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1KWR3Mko7nvgg3Kf4sQ4ZKlPMKtZpiVEg/view?usp=drive_link',
    'name': 'Coconut Oil',
    'price': 9.00,
    'quantity': '500 ml',
    'rating': '4.8 (160 Reviews)',
    'description':
        'Pure and natural coconut oil, excellent for cooking, baking or using in cosmetics.',
    'category': 'Oils',
    'productid': 'oils_004'
  },
  'Sesame Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1781gSzcuCTcxCxbosCpCrDyWxEpFTgOq/view?usp=drive_link',
    'name': 'Sesame Oil',
    'price': 10.00,
    'quantity': '1 L',
    'rating': '4.7 (140 Reviews)',
    'description':
        'Toasted sesame oil with a unique flavor, perfect for seasoning Asian dishes.',
    'category': 'Oils',
    'productid': 'oils_005'
  },
  'Soybean Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1MyxUxoik235-DXgRrXso3aZlkpu6jrUQ/view?usp=drive_link',
    'name': 'Soybean Oil',
    'price': 4.00,
    'quantity': '1 L',
    'rating': '4.4 (120 Reviews)',
    'description':
        'Refined soybean oil, ideal for cooking, frying and preparing a wide variety of dishes.',
    'category': 'Oils',
    'productid': 'oils_006'
  },
  'Canola Oil': {
    'imageurl':
        'https://drive.google.com/file/d/1gyMA2VjLrdReGD_LCugdCelCB3O3VxMg/view?usp=drive_link',
    'name': 'Canola Oil',
    'price': 6.00,
    'quantity': '1 L',
    'rating': '4.6 (180 Reviews)',
    'description':
        'Canola oil, light and low in saturated fat, ideal for cooking and frying.',
    'category': 'Oils',
    'productid': 'oils_007'
  }
};
Map<String, dynamic> vegetablesData = {
  'Tomatoes': {
    'imageurl':
        'https://drive.google.com/file/d/1TJSu5Ocy2jrO6FxvMjpeVCIRH1Sx7uTo/view?usp=drive_link',
    'name': 'Tomatoes',
    'price': 4.00,
    'quantity': '1 kg',
    'rating': '4.8 (180 Reviews)',
    'description':
        'Fresh, juicy tomatoes perfect for sauces, salads and stir-fries.',
    'category': 'Vegetables',
    'productid': 'vegetable_001'
  },
  'Potatoes': {
    'imageurl':
        'https://drive.google.com/file/d/1Qcv5DztHkmk_ic9NGGkvObhhiG51eyjD/view?usp=drive_link',
    'name': 'Potatoes',
    'price': 3.50,
    'quantity': '1 kg',
    'rating': '4.7 (220 Reviews)',
    'description': 'Fresh potatoes, ideal for frying, baking or mashing.',
    'category': 'Vegetables',
    'productid': 'vegetable_002'
  },
  'Onions': {
    'imageurl':
        'https://drive.google.com/file/d/1YsOTARhu6zfxH69LQeBHm-DixWQUTv76/view?usp=drive_link',
    'name': 'Onions',
    'price': 2.50,
    'quantity': '1 kg',
    'rating': '4.6 (210 Reviews)',
    'description':
        'Fresh onions, perfect for seasoning and adding flavor to your dishes.',
    'category': 'Vegetables',
    'productid': 'vegetable_003'
  },
  'Carrots': {
    'imageurl':
        'https://drive.google.com/file/d/17jpvLnO41Y5Q_t0-zvnbplD2Ba0kG_R0/view?usp=drive_link',
    'name': 'Carrots',
    'price': 3.00,
    'quantity': '500 g',
    'rating': '4.7 (170 Reviews)',
    'description':
        'Fresh, crunchy, naturally sweetened carrots, great for salads and soups.',
    'category': 'Vegetables',
    'productid': 'vegetable_004'
  },
  'Spinach': {
    'imageurl':
        'https://drive.google.com/file/d/1SyHUfDlHYowV5VzLXGZV62tWRUS6h7PH/view?usp=drive_link',
    'name': 'Spinach',
    'price': 2.80,
    'quantity': '250 g',
    'rating': '4.5 (160 Reviews)',
    'description': 'Fresh spinach, ideal for stir-fries, salads and soups.',
    'category': 'Vegetables',
    'productid': 'vegetable_005'
  },
  'Bell Peppers': {
    'imageurl':
        'https://drive.google.com/file/d/1Owfopqxw-DPG6jNmbTZb-bJWZqRi9mtS/view?usp=drive_link',
    'name': 'Bell Peppers',
    'price': 5.00,
    'quantity': '500 g',
    'rating': '4.6 (140 Reviews)',
    'description':
        'Colorful, fresh and crunchy bell peppers, perfect for salads and grilling.',
    'category': 'Vegetables',
    'productid': 'vegetable_006'
  },
  'Broccoli': {
    'imageurl':
        'https://drive.google.com/file/d/1I9RzFvDGrmH-ZwrdsrZvJm-y-XgRZERJ/view?usp=drive_link',
    'name': 'Broccoli',
    'price': 6.00,
    'quantity': 'unit',
    'rating': '4.8 (190 Reviews)',
    'description':
        'Fresh broccoli, rich in nutrients, ideal for stir-fries, salads and soups.',
    'category': 'Vegetables',
    'productid': 'vegetable_007'
  },
  'Cabbage': {
    'imageurl':
        'https://drive.google.com/file/d/1GJO9QJIKquwzjqwia7YYs2wMpiavB4wr/view?usp=drive_link',
    'name': 'Cabbage',
    'price': 4.00,
    'quantity': 'unit',
    'rating': '4.5 (130 Reviews)',
    'description': 'Fresh cabbage, great for salads and stir-fries.',
    'category': 'Vegetables',
    'productid': 'vegetable_008'
  },
  'Cauliflower': {
    'imageurl':
        'https://drive.google.com/file/d/1hSL5ARrQ9mZWRzri_tqNYOYdI-G45iiH/view?usp=drive_link',
    'name': 'Cauliflower',
    'price': 5.50,
    'quantity': 'unit',
    'rating': '4.6 (150 Reviews)',
    'description':
        'Cauliflower fresh, ideal for stir-fries, soups and as a substitute for rice.',
    'category': 'Vegetables',
    'productid': 'vegetable_009'
  },
  'Garlic': {
    'imageurl':
        'https://drive.google.com/file/d/1FZ2ZteFzZq6TrPivD3pCNHccjH2t83NS/view?usp=drive_link',
    'name': 'Garlic',
    'price': 3.00,
    'quantity': '250 g',
    'rating': '4.7 (200 Reviews)',
    'description': 'Fresh garlic, essential to add flavor to your dishes.',
    'category': 'Vegetables',
    'productid': 'vegetable_010'
  }
};
Map<String, dynamic> beveragesData = {
  'Orange Juice': {
    'imageurl':
        'https://drive.google.com/file/d/10WzhG2e8PnmShc1Pp5-j9HOX-EH2Eeo5/view?usp=drive_link',
    'name': 'Orange Juice',
    'price': 6.00,
    'quantity': '1 L',
    'rating': '4.7 (190 Reviews)',
    'description':
        'Fresh orange juice, ideal for breakfast and full of vitamin C.',
    'category': 'Beverages',
    'productid': 'beverages_001'
  },
  'Coconut Water': {
    'imageurl':
        'https://drive.google.com/file/d/1_ywRPdHPNBpSsV6K3iPB-DCKHk14Fn5e/view?usp=drive_link',
    'name': 'Coconut Water',
    'price': 4.00,
    'quantity': '500 ml',
    'rating': '4.8 (220 Reviews)',
    'description':
        'Natural coconut water, perfect for hydration and refreshing at any time of the day.',
    'category': 'Beverages',
    'productid': 'beverages_002'
  },
  'Cola Drink': {
    'imageurl':
        'https://drive.google.com/file/d/14v7D5RWODuDDY0NUqg-rjw_Wzv1vMXBH/view?usp=drive_link',
    'name': 'Cola Drink',
    'price': 3.50,
    'quantity': '500 ml',
    'rating': '4.5 (250 Reviews)',
    'description':
        'Cola soft drink, with a sweet and refreshing flavor, perfect to accompany your meals.',
    'category': 'Beverages',
    'productid': 'beverages_003'
  },
  'Green Tea': {
    'imageurl':
        'https://drive.google.com/file/d/1kkXj7G5wOyDWZZ55PKtCsZPHopJS36aW/view?usp=drive_link',
    'name': 'Green Tea',
    'price': 8.00,
    'quantity': '100 g',
    'rating': '4.9 (300 Reviews)',
    'description':
        'Premium green tea, ideal for those looking for a healthy drink full of antioxidants.',
    'category': 'Beverages',
    'productid': 'beverages_004'
  },
  'Black Coffee Powder': {
    'imageurl':
        'https://drive.google.com/file/d/1zIVNf3X9tlv9tsNTpSJpiGdRvsy-I3-m/view?usp=drive_link',
    'name': 'Black Coffee Powder',
    'price': 10.00,
    'quantity': '250 g',
    'rating': '4.8 (180 Reviews)',
    'description':
        'Powdered coffee, ideal for those who prefer a strong, sugar-free coffee.',
    'category': 'Beverages',
    'productid': 'beverages_005'
  },
  'Energy Drink': {
    'imageurl':
        'https://drive.google.com/file/d/1uUvmMrcUmjkn2X8wY1jueBwLTZ0CIMWN/view?usp=drive_link',
    'name': 'Energy Drink',
    'price': 5.00,
    'quantity': '250 ml',
    'rating': '4.6 (220 Reviews)',
    'description':
        'Energy drink, ideal for those who need a boost of energy during the day.',
    'category': 'Beverages',
    'productid': 'beverages_006'
  },
  'Sparkling Water': {
    'imageurl':
        'https://drive.google.com/file/d/12UWv0EIlR_4Ln0_BOBBD-SQ7FyUnFFMs/view?usp=drive_link',
    'name': 'Sparkling Water',
    'price': 3.00,
    'quantity': '500 ml',
    'rating': '4.7 (150 Reviews)',
    'description':
        'Sparkling water, refreshing and ideal for those looking for an alternative to soft drinks.',
    'category': 'Beverages',
    'productid': 'beverages_007'
  },
  'Lemonade': {
    'imageurl':
        'https://drive.google.com/file/d/1EfK-EAi7CZIGztrih5T7nQMNUWbTi7zL/view?usp=drive_link',
    'name': 'Lemonade',
    'price': 4.50,
    'quantity': '1 L',
    'rating': '4.6 (160 Reviews)',
    'description':
        'Fresh lemonade, ideal for a hot day, with a refreshing and sweet flavor.',
    'category': 'Beverages',
    'productid': 'beverages_008'
  }
};
Map<String, dynamic> cleaningProductsData = {
  'Dishwashing Liquid': {
    'imageurl':
        'https://drive.google.com/file/d/1zhh5ezmH8pca6Qm5po-vXS5765rUKpGq/view?usp=drive_link',
    'name': 'Dishwashing Liquid',
    'price': 3.5,
    'quantity': '500ml',
    'rating': '4.6 (190 Reviews)',
    'description':
        'Liquid dishwashing detergent, effective in removing grease and with a refreshing scent.',
    'category': 'Cleaning',
    'productid': 'cleaning_001'
  },
  'Laundry Detergent': {
    'imageurl':
        'https://drive.google.com/file/d/1JOLiqRdxV1j7gkGYLPjHNK66l5aQfDbp/view?usp=drive_link',
    'name': 'Laundry Detergent',
    'price': 6.00,
    'quantity': '1kg',
    'rating': '4.7 (210 Reviews)',
    'description':
        'Powder laundry detergent, effective in removing stubborn stains and dirt.',
    'category': 'Cleaning',
    'productid': 'cleaning_002'
  },
  'Toilet Cleaner': {
    'imageurl':
        'https://drive.google.com/file/d/1lpbBtAdOtGQ_ulUkc4r33BsHHGGzjWqN/view?usp=drive_link',
    'name': 'Toilet Cleaner',
    'price': 4.50,
    'quantity': '750 ml',
    'rating': '4.8 (180 Reviews)',
    'description':
        'Disinfectant and toilet bowl cleaner, eliminates odors and leaves a fresh scent.',
    'category': 'Cleaning',
    'productid': 'cleaning_003'
  },
  'Vacuum Cleaner': {
    'imageurl':
        'https://drive.google.com/file/d/1l3yLRwNyVgbt_120pUv736MRpbsosbfX/view?usp=drive_link',
    'name': 'Vacuum Cleaner',
    'price': 150.00,
    'quantity': 'unit',
    'rating': '4.5 (100 Reviews)',
    'description':
        'Powerful vacuum cleaner, ideal for deep cleaning of carpets and floors.',
    'category': 'Cleaning',
    'productid': 'cleaning_004'
  },
  'Garbage Bags': {
    'imageurl':
        'https://drive.google.com/file/d/1o7W-ZUYZWilK6CHs3wULfLPm_VDutEum/view?usp=drive_link',
    'name': 'Garbage Bags',
    'price': 7.00,
    'quantity': 'Pack of 30',
    'rating': '4.7 (220 Reviews)',
    'description':
        'Large, sturdy garbage bags ideal for household waste disposal.',
    'category': 'Cleaning',
    'productid': 'cleaning_005'
  },
  'Sponges': {
    'imageurl':
        'https://drive.google.com/file/d/1JTTuFxdTaTRNAQb_N86pjHcIIAt5y78F/view?usp=drive_link',
    'name': 'Sponges',
    'price': 2.50,
    'quantity': 'Pack of 5',
    'rating': '4.6 (180 Reviews)',
    'description':
        'Highly durable sponges, ideal for washing dishes and surfaces.',
    'category': 'Cleaning',
    'productid': 'cleaning_006'
  },
  'Aluminum Foil': {
    'imageurl':
        'https://drive.google.com/file/d/1mmF7R8rK7zpnsvTcijtAqL78l-K7CZpn/view?usp=drive_link',
    'name': 'Aluminum Foil',
    'price': 4.00,
    'quantity': '10 m roll',
    'rating': '4.7 (170 Reviews)',
    'description':
        'Aluminum foil for culinary use, ideal for wrapping food and lining baking trays.',
    'category': 'Cleaning',
    'productid': 'cleaning_007'
  },
  'Paper Towels': {
    'imageurl':
        'https://drive.google.com/file/d/1fqkIj3VE3amYT8co97oGhWt76jERe9AJ/view?usp=drive_link',
    'name': 'Paper Towels',
    'price': 3.00,
    'quantity': '2 Rolls',
    'rating': '4.8 (200 Reviews)',
    'description':
        'Highly absorbent paper towels, ideal for cleaning surfaces and drying hands.',
    'category': 'Cleaning',
    'productid': 'cleaning_008'
  }
};

Future<void> uploadProductsToFirestore({String collectionName = 'products'}) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (var product in babyProductsData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in beveragesData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in cleaningProductsData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in fruitsData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in groceryProductsData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in oilsProductsData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }
    for (var product in vegetablesData.values) {
      String productId = product['productid'];
      await firestore
          .collection(collectionName)
          .doc(productId)
          .set(product, SetOptions(merge: true));
    }

    print('Produtos enviados para o Firestore com sucesso!');
  } catch (e) {
    print('Erro ao enviar produtos para o Firestore: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreExample(),
    );
  }
}

class FirestoreExample extends StatefulWidget {
  const FirestoreExample({super.key});

  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  bool isUploading = false;

  void _uploadProducts() async {
    setState(() {
      isUploading = true;
    });

    await uploadProductsToFirestore();

    setState(() {
      isUploading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Produtos enviados para o Firestore!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: Center(
        child: isUploading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _uploadProducts,
                child: Text('Enviar Produtos para o Firestore'),
              ),
      ),
    );
  }
}
