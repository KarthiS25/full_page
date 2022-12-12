require 'rails_helper'

RSpec.describe 'New note', type: :system do
    scenario 'no title and content' do
        visit new_note_path
        click_button 'Create Note'
        expect(page).to have_content("Title and content can't be blank")
        expect(Note.count).to eq(0)
    end
end