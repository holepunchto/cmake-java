include_guard()

macro(use_java)
  find_package(Java)
  find_package(JNI)

  include(UseJava)

  # Windows links against 'jvm.lib' but loads 'jvm.dll', which sits in a JDK
  # subdirectory that is not searched by default: 'jre/bin/server' up to JDK 8,
  # 'bin/server' from JDK 9 on.
  if(WIN32 AND JAVA_JVM_LIBRARY)
    cmake_path(GET JAVA_JVM_LIBRARY PARENT_PATH java_library_directory)
    cmake_path(GET java_library_directory PARENT_PATH java_home)

    find_file(
      JAVA_JVM_RUNTIME jvm.dll
      PATHS "${java_home}/bin/server" "${java_home}/jre/bin/server"
      NO_DEFAULT_PATH
    )

    if(NOT JAVA_JVM_RUNTIME)
      message(FATAL_ERROR "Could not find 'jvm.dll' in '${java_home}'")
    endif()

    cmake_path(GET JAVA_JVM_RUNTIME PARENT_PATH JAVA_JVM_RUNTIME_DIRECTORY)
    cmake_path(NATIVE_PATH JAVA_JVM_RUNTIME_DIRECTORY JAVA_JVM_RUNTIME_DIRECTORY)
  endif()
endmacro()
