require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
    render_views

    describe 'testing form' do
      it "checks en version" do

        visit new_appointment_path(:locale => 'en')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Thanks')
        # save_and_open_page
      end

      it "checks tr version" do

        visit new_appointment_path(:locale => 'tr')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Teşekkürler')
        # save_and_open_page
      end

      it "checks de version" do

        visit new_appointment_path(:locale => 'de')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Dank')
        # save_and_open_page
      end

      it "checks fr version" do

        visit new_appointment_path(:locale => 'fr')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Merci')
        # save_and_open_page
      end

      it "checks es version" do

        visit new_appointment_path(:locale => 'es')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Gracias')
        # save_and_open_page
      end

      it "checks it version" do

        visit new_appointment_path(:locale => 'es')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => 'Grazie')
        # save_and_open_page
      end

      it "checks zh-CN version" do

        visit new_appointment_path(:locale => 'zh-CN')
        # controller.prepend_view_path 'app/views'
        # puts response.body.blank?  see: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/views-are-stubbed-by-default
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
        fill_in "appointment_comments", :with => "best doctor..."
        fill_in "appointment_complaints", :with => "karin yaglari"
        fill_in "appointment_date", :with => Time.now.tomorrow
        select "10", :from => "appointment_time_4i"
        select "15", :from => "appointment_time_5i"
        click_button 'okey'

        # puts response.code

        puts response.body
        expect(response).to render_template(:show)
        expect(page).to have_selector('div.tnx', :text => '謝謝')
        # save_and_open_page
      end
    end


    # webmaster is removed from ruut_path - the main page
    # describe "testing webmaster form" do
    #
    #   it "webmaster form check" do
    #
    #     visit ruut_path
    #
    #     fill_in 'eml', :with => 'bilen@bilen.com'
    #     # save_and_open_page
    #     fill_in 'msg', :with => 'harika'
    #     click_button 'send'
    #
    #     RSpec.describe AppointmentsController do
    #       controller do
    #         def webmaster
    #           render :nothing => true
    #         end
    #       end
    #     end
    #
    #     # expect(response).to render(:nothing => true)
    #     # expect(page).to have_selector('div.tnx', :text => '謝謝')
    #     # save_and_open_page
    #   end
    # end
end
