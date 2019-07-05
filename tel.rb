class MetasploitModule < Msf::Post
  include Msf::Post::File
  def initialize(info = {})
    super(update_info(info,
        'Name'          => 'notify',
        'Description'   => %q{
          Say something that the user might want to know.
        },
        'License'       => MSF_LICENSE,
        'Author'        => [ 'Name' ],
        'Platform'      => [ 'win', 'linux', 'osx', 'unix', 'bsd', 'solaris' ],
        'SessionTypes'  => [ 'meterpreter', 'shell' ]
    ))
    register_options([
      OptString.new('token', [true,  'Name of tel robot token', nil]),
      OptString.new('chat_id', [true,  'Name of the chat_id', nil]),
    ])
  end
  def run
    token = datastore["token"]
    chat = datastore["chat_id"]
    url = "/bot#{token}/sendMessage?chat_id=#{chat}&text='#{session.session_host} opened (#{session.session_port}) at #{Time.now}'"
    cli = Rex::Proto::Http::Client.new('api.telegram.org',443, {},true)
    cli.connect
    req = cli.request_cgi({'uri'=>url, 'ssl' => true})
    res = cli.send_recv(req)
    print_status res.body
    cli.close
  end
end
