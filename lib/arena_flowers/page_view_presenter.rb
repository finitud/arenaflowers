module ArenaFlowers
  class PageViewPresenter
    attr_accessor :page_views, :sorted_views

    def initialize(log)
      self.page_views = log
    end

    def sort
      self.sorted_views ||= page_views.sort_by { |k, v| v }.reverse
      self.sorted_views
    end
  end
end
