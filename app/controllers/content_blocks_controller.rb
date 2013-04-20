class ContentBlocksController < ApplicationController
  before_filter :admin_user_required
  
  def update
    params[:content].keys.each do |key|
      content_block = ContentBlock.find key.match(/content-block-(\d+)/)[1]
      content_block.update_attributes! body: params[:content][key][:value]
    end
    render text: ''
  end

  private

  def admin_user_required
    head :unauthorized unless current_admin_user.present?
  end

end
