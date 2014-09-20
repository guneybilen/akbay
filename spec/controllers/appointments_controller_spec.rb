require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
    render_views

    describe 'testing form' do
      it "checks fields" do

        visit new_appointment_path(:locale => 'en')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?
        # save_and_open_page

        # you cannot fill_in hidden text fields except using find method with :xpath below
        # fill_in 'appointment_bypass_humanizer', :with => "true"
        find(:xpath, "//input[@id='appointment_bypass_humanizer']").set "true"

        # set_hidden_field does not work with rspec; it works with cucumber as far as I learned from Internet
        # set_hidden_field 'appointment_bypass_humanizer', :to => "true"

        fill_in 'appointment_firstname', :with => 'guney'
        # save_and_open_page
        fill_in 'appointment_email', :with => 'guney@guney.com'
        fill_in 'appointment_phone', :with => "90537"

        click_button 'okey'
         # save_and_open_page
        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        # expect(page).to have_selector('span')
        # expect(page).to have_selector('span', :text => 'invalid entries')
        # save_and_open_page
      end
    end
end
