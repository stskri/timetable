# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedを作成します。"


# adminの設定
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = 'a@a'
  admin.password = 'aaaaaa'
  admin.password_confirmation = 'aaaaaa'
end
# adminの設定ここまで

subjects = [
  { id: 1, name: "国語", color: "#c32148" },
  { id: 2, name: "算数", color: "#4169e1" },
  { id: 3, name: "理科", color: "#3cb737" },
  { id: 4, name: "社会", color: "#8b4513" },
  { id: 5, name: "英語", color: "#ffa500" }
]
subjects.each do |subject_data|
  Subject.find_or_create_by(id: subject_data[:id]) do |subject|
    subject.name = subject_data[:name]
    subject.color = subject_data[:color]
  end
end

puts "seedの作成が完了しました。"