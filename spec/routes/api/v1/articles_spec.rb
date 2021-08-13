require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :routing do
  it {
    expect(
      get('/api/v1/articles')
    ).to route_to(controller: 'api/v1/articles', action: 'index')
  }

  it {
    expect(
      get('/api/v1/articles/1')
    ).to route_to(controller: 'api/v1/articles', action: 'show', id: '1')
  }

  it {
    expect(
      put('/api/v1/articles/1')
    ).to route_to(controller: 'api/v1/articles', action: 'update', id: '1')
  }

  it {
    expect(
      delete('/api/v1/articles/1')
    ).to route_to(controller: 'api/v1/articles', action: 'destroy', id: '1')
  }
end
