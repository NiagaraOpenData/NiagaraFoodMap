class ImporterController < ApplicationController

  def foodbanks
    #@foodbanks = Foodbank.all

    rawFoodbanks = JSON.parse(HTTParty.get('https://raw.githubusercontent.com/NiagaraOpenData/niagara-food-banks/master/index.json'))

    rawFoodbanks.each do |foodbank|

      foodbank_key = foodbank['Id']

      currentFoodbank = Foodbank.where(info_key: foodbank_key).first

      if currentFoodbank.blank?
        newFoodbank = Foodbank.new(
            info_key: foodbank_key,
            latitude: foodbank['Latitude'].to_f,
            longitude: foodbank['Longitude'].to_f,
            info: foodbank
        )
        newFoodbank.save
      else
        currentFoodbank.info = foodbank
        #currentFoodbank.latitude = foodbank['Latitude'],
        #currentFoodbank.longitude = foodbank['Longitude'],
        currentFoodbank.save
      end
    end

    @foodbanks = Foodbank.all

    respond_to do |format|
      format.json { render json: @foodbanks }
    end
  end

end