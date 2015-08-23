User.create(first_name: 'James', last_name: 'Bomotti', username: 'jbomotti')
User.first.password = 'lalala'
Language.create(name: 'Japanese')
Language.create(name: 'Spanish')
jpn = Language.first
spn = Language.last
User.first.languages << jpn
User.first.languages << spn
