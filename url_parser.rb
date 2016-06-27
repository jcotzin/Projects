class UrlParser
  def initialize(new_url)
    @new_url=new_url
  end

  def scheme
    @new_url.split(':')[0]
  end

  def domain
    @new_url.split('/')[2].split(':')[0]
  end

  def port
    port = @new_url.split('/')[2].split(':')[1]
    if !port && scheme == "http"
       "80"
    elsif !port && scheme == "https"
       "443"
    else
      port
    end
  end

  def path
    path = @new_url.split('/')[3].split('?')[0]
    if path == ""
      nil
    else
      path
    end
  end

  def query_string
    query_string = @new_url.split('?')[1].split('#')[0].split('&')
    query_string.map!{|i| i.split('=')}
    query_string.flatten!
    query_string = Hash[*query_string]
  end

  def fragment_id
    @new_url.split('#').last
  end


end
@new_url = UrlParser.new "http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
