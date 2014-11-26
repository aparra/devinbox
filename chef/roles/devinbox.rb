name "devinbox"

run_list(
  "recipe[apt]",
  "recipe[devinbox::bootstrap]",
  "recipe[devinbox::hotspot]",
  "recipe[devinbox::maven]",
  "recipe[devinbox::ant]",
  "recipe[devinbox::sbt]",
  "recipe[devinbox::eclipse_scala]",
  "recipe[devinbox::jboss]",
  "recipe[devinbox::npm_packages]",
  "recipe[ruby_build]",
  "recipe[rbenv::user]",
  "recipe[rbenv::vagrant]",
  "recipe[vim]",
  "recipe[apache2]",
  "recipe[apache2::mod_rewrite]",
  "recipe[apache2::mod_headers]",
  "recipe[apache2::mod_ssl]",
  "recipe[apache2::mod_proxy]",
  "recipe[apache2::mod_proxy_http]",
  "recipe[custom_samba]"
)

