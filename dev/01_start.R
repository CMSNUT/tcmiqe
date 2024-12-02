#
#
#
golem::fill_desc(
  pkg_name = "tcmiqe",
  pkg_title = "中药智鉴(TCM-IQE)",
  pkg_description = "A toolkit for TCM.",
  authors = person(
    given = "Donghui",
    family = "Xia",
    email = "dhxia@snut.edu.cn",
    role = c("aut", "cre")
  ),
  repo_url = NULL,
  pkg_version = "1.0",
  set_options = TRUE
)
golem::install_dev_deps()
usethis::use_mit_license("Donghui Xia")
golem::use_readme_rmd(open = FALSE)
devtools::build_readme()
usethis::use_code_of_conduct(contact = "dhxia@snut.edu.cn")
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md(open = FALSE)
golem::use_recommended_tests()
golem::use_favicon()
golem::use_utils_ui(with_test = TRUE)
golem::use_utils_server(with_test = TRUE)
usethis::use_git()
usethis::use_git_remote(
  name = "origin",
  url = "https://github.com/CMSNUT/tcmiqe.git"
)
rstudioapi::navigateToFile("dev/02_dev.R")
