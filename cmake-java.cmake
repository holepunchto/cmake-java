include_guard()

macro(use_java)
  find_package(Java)
  find_package(JNI)

  include(UseJava)
endmacro()
