include_guard()

function(use_java)
  find_package(Java)
  find_package(JNI)

  include(UseJava)
endfunction()
