# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    it 'should create packages' do
      file = fixture_file_upload(Rails.root.join('spec/fixtures/files/shipments_data.json'),
                                 'application/json')
      post :create, params: { package: { file: file } }
      expect(flash[:notice]).to eq 'Las guías han sido cargadas exitosamente'
    end
  end

  describe 'PUT update' do
    it 'should update a package' do
      package = Package.create(parcel: 'fedex',
                               guide_number: '449044304137821',
                               status: FFaker::Lorem.word,
                               description: FFaker::Lorem.sentence)

      put :update, params: { id: package.id }
      expect(flash[:notice]).to eq "El paquete ha sido actualizado exitosamente: #{package.guide_number}"
    end
  end

  describe 'DELETE destroy' do
    it 'should destroy a package' do
      package = Package.create(parcel: 'fedex',
                               guide_number: '449044304137821',
                               status: FFaker::Lorem.word,
                               description: FFaker::Lorem.sentence)

      delete :destroy, params: { id: package.id }
      expect(flash[:notice]).to eq "El paquete ha sido eliminado exitosamente: #{package.guide_number}"
    end
  end
end
