module Queries
  class Songs < Queries::BaseQuery

    type [Types::SongType], null: false

    def resolve
      ::Song.all.order(:id)
    end
  end
end
