lib = [
  'unzip',
  'gettext-devel',
  'zlib-devel',
  'openssl-devel',
  'curl-devel',
  'zlib-devel',
  'perl-ExtUtils-MakeMaker',
  'tar',
]

package lib.join("\s")

opt = {
  url: 'https://github.com/git/git/archive/master.zip',
  dir: 'git-master',
  config: [
    '--prefix=/usr',
  ]
}

def make_install opt
  file = File.basename(opt[:url])
  execute 'download src' do
    not_if "test -e /tmp/git-master"
    command "cd /tmp && curl -SLO #{opt[:url]} && unzip #{file} && rm -f #{file}"
  end

  execute 'configure' do
    command "cd /tmp/#{opt[:dir]} && make configure && ./configure #{opt[:config].join("\s")}"
  end

  execute 'install' do
    command "cd /tmp/#{opt[:dir]} && make && make install"
  end
end

make_install opt
