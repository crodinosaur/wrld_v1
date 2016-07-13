class StaticPagesController < ApplicationController
  def home
  	puts "the referrer is #{request.referer}\n"
  	puts "new_user_session_url is #{new_user_session_url}"
  	if request.referer == new_user_session_url
  		redirect_to user_fact_path(current_user)
  	end
  	@user = User.new
  end

  def about
  end

  def contact_us
  end

  def faq
  end
end
