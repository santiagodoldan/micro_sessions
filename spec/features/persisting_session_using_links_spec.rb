require 'rails_helper'

RSpec.describe 'persisting storage using links' do
  context 'when clicking a MicroSession link' do
    it 'persists the session between different pages' do
      visit '/mutants'

      click_link 'micro_session_link'

      expect(page).to have_content 'Wolverine'
    end
  end

  context 'when clicking a Rails standard link' do
    it 'does not persist the session between different pages' do
      visit '/mutants'

      click_link 'rails_standard_link'

      expect(page).to_not have_content 'Wolverine'
    end
  end
end
