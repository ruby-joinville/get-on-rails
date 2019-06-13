module DiscogsRequestsService
  DISCOGS_TOKEN = 'cvxyzWiAjGkjVBIgWBwsnsoWVqckMFwyATbuZRGU'.freeze
  APP_NAME = 'Getonrails'.freeze

  class Client
    def get_artist(name)
      artist_id = resolve_artist_id(name)

      return {} unless artist_id

      client.get_artist(artist_id)
    end

    def search_artist_releases(name, max_results: 10)
      artist_id = resolve_artist_id(name)

      return {} unless artist_id

      client.get_artist_releases(artist_id.to_s, { per_page: max_results})['releases']
    end

    private

    def search_artist_by_name(name, results_per_page: 10)
      client.search(name, per_page: results_per_page, type: :artist)
    end

    def resolve_artist_id(name)
      search = search_artist_by_name(name)
      search['results'].blank? ? nil : search['results'][0]['id']
    end

    def client
      @client ||= Discogs::Wrapper.new(APP_NAME, user_token: DISCOGS_TOKEN)
    end
  end
end
