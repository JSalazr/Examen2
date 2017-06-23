namespace :active_rents do
  desc "Active ones"
  task active: :environment do
    Rent.connection
    Car.connection
    Owner.connection
    Rent.find_each do |f|
      if Date.today <=  f.rent_end_at
        puts "ID: #{f.id} - MODELO: #{Car.find_by(id: f.car_id).modelo} - OWNER: #{Owner.find_by(id: Car.find_by(id: f.car_id).owner_id).name} - FECHA INICIO: #{f.rent_start_at} - FECHA FINAL: #{f.rent_end_at}"
      end
    end

  end
end
