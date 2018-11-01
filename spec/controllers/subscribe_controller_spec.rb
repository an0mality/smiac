require 'rails_helper'

RSpec.describe SubscribesController, type: :controller do
	
	describe "create" do
		it 'render new template' do
			get :new
			expect(response).to render_template('new')
		end

		it "has a 200 status code" do
	      get :new
	      expect(response.status).to eq(200)
	    end

		it 'render new template if errors at create' do 
			before_count = Subscribe.count
			post :create, {:subscribe => {:mail=> 'p@p.ru'}}
			expect(Subscribe.count).to eq(before_count)
			
		end

		it 'render new template if errors at create' do 
			before_count = Subscribe.count
			post :create, {:subscribe => {:mail=> 'p@p.ru'}}
			expect(Subscribe.count).to eq(before_count)
			expect(response).to render_template('new')

		end

		it 'before_count < new_count in create' do
			before_count=Subscribe.count
			expect {post :create, :subscribe => {mail: 'test@test.ru', articles: true}}.to change(Subscribe, :count).by(1)
		end

		it 'before_count == new_count in create if update' do
			post :create, {:subscribe => {mail: 'test@test.ru', articles: true}}
			before_count=Subscribe.count
			post :create, {:subscribe => {mail: 'test@test.ru', documents: true}}
			expect(Subscribe.count).to eq(before_count)
		end

		it 'redirect_to new if create success' do
			post :create, {:subscribe => {mail: 'p@p.ru', articles: true}}
			expect(response).to redirect_to(new_subscribe_path)
		end

		it 'redirect and get flash' do
			post :create, {:subscribe => {mail: 'p@p.ru', articles: true}}
			expect(flash[:notice]).to match("Ваша заявка принят")
		end
	end
end
