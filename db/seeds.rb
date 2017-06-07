# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com" #可以ga改成自己的 email
u.password = "123456"      #至少要六码
u.password_confirmation = "123456" #最少要六码

u.is_admin = true
u.save

#上传本地的产品到七牛
# Initialize Admin User
if User.find_by(email: "a@a.com").nil?
  u = User.new
  u.email = "a@a.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Initialize Product
Product.create!(
  id: 1, # 第二個商品id:2, Product_id:2, 以此類推
  title: "品名",
  description: "商品說明",
  price: 70,
  quantity: 45,
  )
# Initialize Product Photos
# 先將照片上傳到iPic或其他位置
Photo.create!(product_id:1,avatar: open(http://位置1.jpg))
Photo.create!(product_id:1,avatar: open(http://位置2.jpg))
#如照片在本地，先把照片放在 /app/assets/images/products 裡面，但git push heroku完要馬上跑seed.否則圖會被heroku刪
Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-1.jpg")))
Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-2.jpg")))
