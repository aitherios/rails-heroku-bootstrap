class MercuryContentsController < ApplicationController
  before_filter :admin_user_required
  
  def update
    params[:content].keys.each do |key|
      model_class = key.match(/([a-zA-Z_]+)-(\d+)/)[1].classify.constantize
      model = model_class.find key.match(/([a-zA-Z_]+)-(\d+)/)[2]
      hash = {}
      hash[key.match(/([a-zA-Z_]+)-(\d+)-(.+)/)[3].to_sym] = params[:content][key][:value]
      model.update_attributes! hash
    end
    render text: ''
  end

  private

  def admin_user_required
    head :unauthorized unless current_admin_user.present?
  end

end
