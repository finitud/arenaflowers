module ArenaFlowers
  class LogParser
    attr_accessor :log, :views, :unique_views

    def initialize(log)
      self.log ||= log
    end

    def page_views
      return views if views

      views = {}
      log.each do |hit|
        url, _ = hit
        views[url] = views.fetch(url, 0) + 1
      end
      views
    end

    def unique_page_views
      return unique_views if unique_views

      unique_views = {}
      log.each do |hit|
        url, source_ip = hit
        unique_views[url] ||= {}
        unique_views[url][source_ip] = unique_views[url].fetch(source_ip, 0) + 1
      end
      unique_views
    end
  end
end
