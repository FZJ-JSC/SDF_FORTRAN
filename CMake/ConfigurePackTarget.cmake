execute_process(
   COMMAND git rev-parse --show-toplevel
   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
   OUTPUT_VARIABLE GIT_WORK_TREE
   OUTPUT_STRIP_TRAILING_WHITESPACE)
execute_process(
   COMMAND git rev-parse --git-dir
   WORKING_DIRECTORY ${GIT_WORK_TREE}
   OUTPUT_VARIABLE GIT_DIR
   OUTPUT_STRIP_TRAILING_WHITESPACE)
configure_file(${PACK_CMAKE_IN} pack.cmake)
add_custom_command(
   OUTPUT ${INFO_FILE}
   COMMAND ${CMAKE_COMMAND} -E remove -f ${FORT}
   COMMAND ${CMAKE_COMMAND} -P pack.cmake
   DEPENDS ${PACK_PY} ${CMAKE_CURRENT_BINARY_DIR}/pack.cmake ${SOURCE_ALL}
   VERBATIM)