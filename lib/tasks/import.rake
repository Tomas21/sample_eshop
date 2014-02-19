namespace :import do
  
  task products: :environment do
    require 'csv'

    csv_text = File.read('lib/assets/products.csv')
    csv = CSV.parse(csv_text, headers: true, col_sep: ';')

    csv.each do |row|
      puts "-> Vytvaram produkt #{row.to_hash['name']}..."
      Product.where(row.to_hash).first_or_create!
    end
  end

end
