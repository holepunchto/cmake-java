# cmake-java

Java utilities for CMake.

```
npm i cmake-java
```

```cmake
find_package(cmake-java REQUIRED PATHS node_modules/cmake-java)
```

## Variables

### `JAVA_JVM_RUNTIME_DIRECTORY`

Windows only. The directory holding `jvm.dll`. A program linked against
`JNI::JVM` needs it on its `PATH` to start.

## License

Apache-2.0
