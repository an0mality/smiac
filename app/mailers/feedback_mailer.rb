class FeedbackMailer < ApplicationMailer
  default from: 'rm@xxx.ru'

  def new_feedback(feedback)
    @feedback = feedback
    mail to: %w(),
         subject: '[МИАЦ] Обратная связь'
  end

  def subscribe(record)
    @unsubscribe = record.confirm_token
    @mail = record.mail
    mail(to: "#{record.mail}",
        subject: 'Подписка на новости ГБУЗ КО МИАЦ Калужской области')
  end

  def unsubscribe(record)
    @unsubscribe = record.confirm_token
    @mail = record.mail
    mail(to: "#{record.mail}",
        subject: 'Отказ от подписки на новости ГБУЗ КО МИАЦ Калужской области')
  end

  def send_subscribes(documents, articles, subscribe)
    
    @documents = subscribe.documents ? documents : nil
    @articles = subscribe.articles ? articles : nil
    
      mail(to: "#{subscribe.mail}",
      subject: 'Рассылка новостей с сайта ГБУЗ КО МИАЦ Калужской области')
  end


end
