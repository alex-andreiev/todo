# frozen_string_literal: true

require 'pagy'

module Paginatable
  extend ActiveSupport::Concern

  include Pagy::Backend

  PAGE_SIZE = 10

  private

  def paginate(scope, limit: PAGE_SIZE)
    pagy(scope, limit:)
  rescue Pagy::OverflowError
    pagy(scope, page: 1, limit:)
  end
end
