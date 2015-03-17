Exec { path => '/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin' }

include apt
include apt::update
include apt::backports

Class['apt::update'] -> Package <||>

import 'helpers/*'
import 'sections/*'
