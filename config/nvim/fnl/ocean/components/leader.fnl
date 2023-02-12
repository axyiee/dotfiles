"The key which is going to be mapped as leader key. By default, it is going to be set as <Space> since
 it is one of the easiest and fastest to reach and remember."
(local code " ")

(fn post-install []
  "A post-install hook to set Vim's leader key mapping."
  (set vim.g.mapleader code))

{: post-install}
