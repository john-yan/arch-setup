#!/bin/bash

enable_locale() {
  sed -i "s/#$1/$1/" /etc/locale.gen
}

enable_locale "en_US.UTF-8 UTF-8"
enable_locale "en_US ISO-8859-1"
enable_locale "zh_CN.GB18030 GB18030"
enable_locale "zh_CN.GBK GBK"
enable_locale "zh_CN.UTF-8 UTF-8"
enable_locale "zh_CN GB2312"

