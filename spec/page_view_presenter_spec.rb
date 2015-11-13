require_relative '../lib/arena_flowers/page_view_presenter.rb'

RSpec.describe ArenaFlowers::PageViewPresenter do
  let(:page_views) do
    ArenaFlowers::PageViewPresenter.new({
      "/example/2" => 1,
      "/home" => 20,
      "/example/1" => 25,
      "/login" => 10
    })
  end

  let(:sorted_views) do
    [
      ["/example/1", 25],
      ["/home", 20],
      ["/login", 10],
      ["/example/2", 1],
    ]
  end

  it 'provides a sorted page view list' do
    expect(page_views.sort).to eq(sorted_views)
  end
end
