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
            info: foodbank
        )
        newFoodbank.save
      else
        currentFoodbank.info = foodbank
        currentFoodbank.save
      end
    end

    @foodbanks = Foodbank.all

    respond_to do |format|
      format.json { render json: @foodbanks }
    end
  end

end