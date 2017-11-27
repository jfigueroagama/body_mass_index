require 'csv'

namespace :setting do
  task :bmi => :environment do
    puts "\nLoading BMI. This may take a few minutes..."
    file_path = Rails.root.join("db/setting_bmi.csv")
    CSV.foreach(file_path, headers: true) do |row|
      begin
        bmi_category = row[0]
  			bmi_from = row[1]
  			bmi_to = row[2]
        if bmi_from == nil then bmi_from = 0 end
        if bmi_to == nil then bmi_to = 500 end
        bmi = Bmi.new(category: bmi_category, from: bmi_from, to: bmi_to)
        bmi.save!
        puts "BMI #{bmi.category} => (#{bmi.from} #{bmi.to}) added."
      rescue Exception => e
  		    puts "ERROR: a row has failed, exception is: #{e.message}"
      end
    end
  end
end
