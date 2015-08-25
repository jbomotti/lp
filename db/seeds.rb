User.create(first_name: 'James', last_name: 'Bomotti', username: 'jbomotti', password: 'lalala')
# user = User.first
# user.password = 'lalala'
Language.create(name: 'Japanese')
Language.create(name: 'Spanish')
jpn = Language.first
spn = Language.last
User.first.languages << jpn
User.first.languages << spn
