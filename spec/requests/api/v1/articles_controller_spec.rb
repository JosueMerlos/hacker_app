require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article_1) { create(:article_1) }
  let!(:article_2) { create(:article_2) }
  let!(:article_3) { create(:article_3) }
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe 'GET #index' do
    let(:json_deseado) do
      { articles:
        [
          article_1.slice(%w(record_id title url author points comment_text num_comments story_id story_title story_url parent_id publish_date tag)),
          article_2.slice(%w(record_id title url author points comment_text num_comments story_id story_title story_url parent_id publish_date tag)),
          article_3.slice(%w(record_id title url author points comment_text num_comments story_id story_title story_url parent_id publish_date tag))
        ],
        page: 1,
        per_page: 20,
        total: 3,
        total_pages: 1
      }
    end

    it 'se obtiene la lista de articulos' do
      get api_v1_articles_path, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(json_deseado.as_json)
    end
  end

  describe 'GET #show' do
    let(:json_deseado) do
      article_2.slice(%w(record_id title url author points comment_text num_comments story_id story_title story_url parent_id publish_date tag))
    end

    it 'se obtiene la lista de articulos' do
      get '/api/v1/articles/28046468', headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      json_deseado['children'] = []
      expect(JSON.parse(response.body)).to eq(json_deseado.as_json)
    end
  end

  describe 'PUT #update' do
    context 'cuando el registro se modifico correctamente' do
      let(:json_deseado) do
        article_2.slice(%w(record_id title url author points comment_text num_comments story_id story_title story_url parent_id publish_date tag))
      end
  
      it 'se obtiene el registro modificado' do
        put '/api/v1/articles/28046468', params: { title: 'test' }, headers: headers
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
        json_deseado['title'] = 'test'
        json_deseado['children'] = []
        expect(JSON.parse(response.body)).to eq(json_deseado.as_json)
      end
    end

    context 'cuando el registro no se modifico correctamente' do
      before { allow_any_instance_of(Article).to receive(:save).and_return(false) }
      
      it 'se obtiene un mensaje indicando el error' do
        put '/api/v1/articles/28046468', params: { tag: '' }, headers: headers
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ errors: '' }.as_json)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'cuando el registro se elimina' do
      it 'se obtiene un mensaje indicando que se elimino el registro' do
        delete '/api/v1/articles/28125042', headers: headers
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
        json_deseado = { message: 'Item successfully removed' }
        expect(JSON.parse(response.body)).to eq(json_deseado.as_json)
      end
    end

    context 'cuando el registro no se elimina' do
      before { allow_any_instance_of(Article).to receive(:destroy).and_return(false) }

      it 'se obtiene un mensaje indicando que el error' do
        delete '/api/v1/articles/28125042', headers: headers
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
        json_deseado = { message: '' }
        expect(JSON.parse(response.body)).to eq(json_deseado.as_json)
      end
    end
  end
end
