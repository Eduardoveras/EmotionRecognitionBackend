# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

begin
  s= Setting.new(
      id:1,
      joy_enabled:true,
      sadness_enabled:true,
      anger_enabled:true,
      surprise_enabled:true,
      fear_enabled:true,
      contempt_enabled:true,
      disgust_enabled:true
  )
  s.save!
rescue
  puts "There is already a setting set, if you have questions ask Eduardo :)"
ensure
  puts "Seeding done, goodbye."
end


FaceVideoAnalysis.all.each do |thing|
  thing.set_summary_data
  thing.save!
  end
