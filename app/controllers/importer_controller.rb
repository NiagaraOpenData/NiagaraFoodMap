class ImporterController < ApplicationController

  def foodbanks
    rawFoodbanks = JSON.parse(HTTParty.get('https://raw.githubusercontent.com/NiagaraOpenData/niagara-food-banks/master/index.json'))

    stats = { added: 0, updated: 0, skipped: 0, failed: 0 }
    rawFoodbanks.each do |foodbank|
      #skip foodbank if there is no lat/lng
      if foodbank['Latitude'].blank? or foodbank['Longitude'].blank?
        stats[:skipped] = stats[:skipped] + 1
        next #break out of loop
      end

      foodbank_key = foodbank['Id']

      currentFoodbank = Foodbank.where(info_key: foodbank_key).first

      if currentFoodbank.blank?
        newFoodbank = Foodbank.new(
            info_key: foodbank_key,
            latitude: foodbank['Latitude'],
            longitude: foodbank['Longitude'],
            info: foodbank
        )
        if newFoodbank.save
          stats[:added] = stats[:added] + 1
        else
          stats[:failed] = stats[:failed] + 1
        end
      else
        currentFoodbank.info = foodbank
        currentFoodbank.latitude = foodbank['Latitude']
        currentFoodbank.longitude = foodbank['Longitude']
        if currentFoodbank.save
          stats[:updated] = stats[:updated] + 1
        else
          stats[:failed] = stats[:failed] + 1
        end
      end
    end

    @foodbanks = Foodbank.all

    respond_to do |format|
      format.json { render json: { meta: stats, data: @foodbanks } }
    end
  end

end
