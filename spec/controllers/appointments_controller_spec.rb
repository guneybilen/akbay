require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
    render_views

    describe 'testing form' do
      it "checks fields" do

        visit new_appointment_path(:locale => 'en')
        controller.prepend_view_path 'app/views'
        # puts response.body.blank?
       # save_and_open_page
        fill_in 'appointment_firstname', :with => 'guney'
        click_button 'okey'
        # save_and_open_page
        # puts response.code

        puts response.body
        expect(response).to render_template(:new)
        expect(page).to have_selector('span')
        expect(page).to have_selector('span', :text => 'invalid entries')
        # save_and_open_page
      end
    end
end
