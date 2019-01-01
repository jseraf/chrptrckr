class PaginatingDecorator < Draper::CollectionDecorator
  delegate :offset
end
