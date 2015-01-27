# Notify example
require 'eye/notify/hipchat'

Eye.config do
  hipchat :token => 'hipchat_v1_token', message: '<strong>#name#</strong> (#pid#) on #host# #message# at #time#.'
  contact :dev, :hipchat, 'test'
  logger '/tmp/eye.log'
end

Eye.application 'test' do
  notify :dev, :debug
  stdall '/tmp/eye-example.log'

  process :some_process do
    notify :dev, :debug
    start_command 'sleep 120'
    daemonize true
    pid_file '/tmp/sleep.pid'
  end

end
