Admin.create(email: 'darenas@softdreams.co', password: '123456789')
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?