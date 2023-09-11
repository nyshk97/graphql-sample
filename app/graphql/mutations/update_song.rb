module Mutations
  class UpdateSong < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :params, Types::SongInputType, required: true

    field :song, Types::SongType, null: false

    def resolve(id:, params:)
      song = Song.find(id)
      song.update!(params.to_h)

      { song: song }
    rescue => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
