module Mutations
  class DeleteSong < Mutations::BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: false

    def resolve(id:)
      Song.find(id).delete

      { id: id }
    rescue => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
