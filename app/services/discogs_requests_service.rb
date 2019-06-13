module DiscogsRequestsService
  DISCOGS_TOKEN = 'cvxyzWiAjGkjVBIgWBwsnsoWVqckMFwyATbuZRGU'.freeze
  APP_NAME = 'Getonrails'.freeze

  class Client
    def get_artist(name)
      artist_id = resolve_artist_id(name)
      client.get_artist(artist_id)
    end

    private

    def search_artist_by_name(name, results_per_page: 10)
      client.search(name, per_page: results_per_page, type: :artist)
    end

    def resolve_artist_id(name)
      search = search_artist_by_name(name)
      search['results'][0]['id']
    end

    def client
      @client ||= Discogs::Wrapper.new(APP_NAME, user_token: DISCOGS_TOKEN)
    end
  end
end
