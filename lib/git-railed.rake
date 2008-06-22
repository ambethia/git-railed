desc "Create rails and app and initialize a git repository"
task "git-railed" do
  app    = ENV["APP"]
  ignore = <<EOF
.DS_Store
config/database.yml
coverage
db/*.sqlite3
doc/app/*
log/*.log
tmp/**/*
EOF

  # generate the rails app.
  system "rails #{app}"

  Dir.chdir(app)

  system "git init"

  # exemplify the db config
  system "mv config/database.yml config/database.example.yml"

  # keep empty directorys in the respository
  # by placing an empty .gitignore in them
  system "find . -type d -empty -exec touch {}/.gitignore \\;"
  
  # Make the initial commit.
  system "git add . && git commit -m \"Initial commit of '#{app}'\""  
end
