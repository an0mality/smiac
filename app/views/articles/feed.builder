xml.instruct!
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title "Новости ГБУЗ КО 'МИАЦ Калужской области'"
    xml.description "Новости по медицинской и статистической тематике, касающиеся направлений работы ГБУЗ КО 'МИАЦ Калужской области'"
    xml.link root_url
    xml.language 'ru'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: 'miac.kaluga.ru/rss'

    for article in @articles
      xml.item do
        xml.title article.title.html_safe
        xml.link article_url(article)
        xml.pubDate(article.created_at.rfc2822)
        xml.guid article_url(article)
        xml.description(h(article.body.html_safe))
      end
    end

  end

end