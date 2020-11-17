class Api::AllotedNumbersController < ApplicationController

    def phone
        number = params[:number]
        exist = true
        if !number.nil?
            exist = AllotedNumber.find_by(phone_number: number).present?
        end

        if !exist 
            an = AllotedNumber.new(phone_number: number, special: true)
        else
            data = AllotedNumber.group(:special).having('created_at = MAX(created_at)').first
            telephone = data.phone_number unless data.special
            num = (telephone || "111111110").succ
            an = AllotedNumber.new(phone_number: num)
        end

        if an.save
            render json: {status: "success", message: "phone_number alloted successfully", telephone_number: an.phone_number}
        else
            render json: {status: "failed", message: "allocation failed", error: an.errors}
        end
    end
end