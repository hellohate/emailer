class FormsController < ApplicationController
  def index
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      send_email(@form)
      redirect_to "/forms", notice: 'Form submitted successfully!'
    else
      render 'index'
    end
  end

  private

  def form_params
    params.require(:form).permit(:email, :name, :question)
  end

  def send_email(form)
    require 'mail'

    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :user_name            => "edify.call.centre@gmail.com",
                :password             => "bacqvvxmgymatqao",
                :authentication       => 'plain',
                :enable_starttls_auto => true }

    Mail.defaults do
      delivery_method :smtp, options
    end

    mail = Mail.new do
      from     'edify.call.centre@gmail.com'
      to       form.email
      subject  'New Form Submission'
      body     "Name: #{form.name}\nEmail: #{form.email}\nQuestion: #{form.question}"
    end

    mail.deliver!
  end
end
