module Queries
  class Song < Queries::BaseQuery
    argument :id, ID, required: true

    type Types::SongType, null: false

    def resolve(id:)
      ::Song.find(id)
    end
  end
end
