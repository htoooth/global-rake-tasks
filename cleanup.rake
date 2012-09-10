desc 'Get rid of some trash in home directory.'
task :cleanup do
  clean = Rake::FileList.new

  list = [
    '.adobe',
    '.bzr.log',
    '.ccache',
    '.dvdcss',
    '.macromedia',
    '.rbx',
    '.serverauth.*',
    '.thumbnails',
    '.url'
  ].map { |file| File.expand_path file, '~' }

  clean.include(list).existing!

  if clean.empty?
    puts 'no files to delete.'
  else
    clean.each &method(:rm_r)
  end
end
