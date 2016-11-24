class ConvertByDialect
  include HTTParty
  Process::UnexpectedDialect = Class.new(StandardError)

  attr_reader :content, :dialect, :converted_content

  def initialize(content, dialect)
    @content = content
    @dialect = dialect
  end

  def process
    raise Process::UnexpectedDialect unless ['pirate', 'yoda', 'valley_girl'].include?(dialect)
    convert_by(dialect)
    @content
  end

  def convert_by(dialect)
    @content = case dialect
                 when 'pirate'
                   get_pirate_content
                 when 'yoda'
                   get_yoda_content
                 when 'valley_girl'
                   get_valley_girl_content
                 end
  end

# if we would use it anywhere else, or if there would be more logic we should extract those methods
# to separate request-api-related classes
# for now it looks like too easy part of code to make 3 separate classes for that

private
  def get_pirate_content
    response = HTTParty.get('http://isithackday.com/arrpi.php?text='+content+'&format=json')
    JSON.parse(response.body)['translation']['pirate']
  end

  def get_yoda_content
    # tried api.funtranslations.com  but free only for 25 translations per day ;[
    # response = HTTParty.get('http://api.funtranslations.com/translate/yoda.json?text='+content)
    # JSON.parse(response.body)['contents']['translated']

    response = HTTParty.get('http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&url=&w='+content)
    html_doc = Nokogiri::HTML(response.body)
    html_doc.css('p').children.text.squish
  end

  def get_valley_girl_content
    response = HTTParty.get('http://www.degraeve.com/cgi-bin/babel.cgi?d=valley&url=&w='+content)
    html_doc = Nokogiri::HTML(response.body)
    html_doc.css('p').children.text.squish
  end
end

