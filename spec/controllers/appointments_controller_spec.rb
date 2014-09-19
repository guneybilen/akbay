require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
    render_views

    describe 'testing js' do
      it "checks fields" do
        visit '/en/appointments/new'
        save_and_open_page
        fill_in 'fname', :with => 'guney'
        click_button 'okey'
        expect(response).to_not redirect_to(appointment_path(2))
      end
    end
end
