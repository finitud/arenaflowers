require_relative '../lib/arena_flowers/log_parser.rb'

RSpec.describe ArenaFlowers::LogParser do
  let(:log) do
    [
      ['/home', '1.1.1.1'],
      ['/home', '1.2.3.4'],
      ['/page/2', '1.1.1.1'],
      ['/home', '1.1.1.1'],
      ['/home', '1.1.1.1'],
      ['/home', '1.1.1.1'],
      ['/home', '1.1.1.1'],
      ['/page/2', '2.3.4.5'],
      ['/page/2', '2.3.4.8'],
    ]
  end

  let(:expected_views) do
    {
      '/home' => 6,
      '/page/2' => 3
    }
  end

  let(:expected_unique_views) do
    {
      "/home" => { "1.1.1.1" => 5, "1.2.3.4" => 1 },
      "/page/2" => { "1.1.1.1" => 1, "2.3.4.5" => 1, "2.3.4.8" => 1 }
    }
  end

  it 'provides page view count' do
    page_views = ArenaFlowers::LogParser.new(log).page_views
    expect(page_views).to eq(expected_views)
  end

  it 'provides unique page view count' do
    unique_page_views = ArenaFlowers::LogParser.new(log).unique_page_views
    expect(unique_page_views).to eq(expected_unique_views)
  end
end
