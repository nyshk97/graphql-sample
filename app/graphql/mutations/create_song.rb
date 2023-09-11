module Mutations
  class CreateSong < Mutations::BaseMutation
    argument :params, Types::SongInputType, required: true

    field :song, Types::SongType, null: false

    def resolve(params:)
      song = Song.create!(params.to_h)

      { song: song }
    rescue => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
