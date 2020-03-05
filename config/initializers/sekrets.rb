# frozen_string_literal: true

config = Rails.root.join('config', 'sekrets.yml.enc')
key = Rails.root.join('.sekrets.key')

if test('e', config)
  if test('e', key)
    SEKRETS = Sekrets.settings_for(config)
  else
    SEKRETS = Map.new
    warn "missing #{key}!"
  end
end
