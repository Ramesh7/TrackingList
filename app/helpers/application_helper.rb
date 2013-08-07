module ApplicationHelper
	def unique_errors(errors)
      messages = []
      errors.keys.each do|key|
        messages << errors.full_message(key,errors.get(key).first) #key.to_s+' '+errors.get(key).first
      end
      messages
    end

    def render_flash_message(class_name=nil)
      if  flash[:error] || flash[:message] ||  flash[:notice]
        css_class = class_name.nil? ? 'caution' : class_name
        return [:error,:message, :notice].map{|key| flash[key] }.join('')
      end
    end
end
