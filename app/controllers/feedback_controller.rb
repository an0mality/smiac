class FeedbackController < ApplicationController

  autocomplete :organization, :name, :full => true

  def create
    @feedback = Feedback.create(params_feed)
    respond_to do |format|
      if verify_recaptcha(model: @feedback) && @feedback.save
        FeedbackMailer.new_feedback(@feedback).deliver_now
        format.html {redirect_to(root_path, notice: 'Спасибо за обращение')}
      else
        format.html {redirect_to(root_path, notice: 'Возможно вы не прошли тест на спам или некорректно заполнили поля')}
      end
    end
  end

private

  def params_feed
    params.require(:feedback).permit!
  end

end

