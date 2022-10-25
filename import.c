#include <lean/lean.h>
#include <stdlib.h>

// What I actually want

extern lean_obj_res lean_get_env_var() {
    char ** env;
#if defined(WIN) && (_MSC_VER >= 1900)
    env = *__p__environ();
#else
    extern char ** environ;
    env = environ;
#endif
    lean_object * arr;
    arr = lean_mk_empty_array();

    for (env; *env; ++env) {
        lean_object * env_str;
        env_str = lean_mk_string(* env);
        arr = lean_array_push(arr, env_str);
    }
    return arr;
}

extern lean_obj_res lean_add(uint32_t a, uint32_t b) {
    return a + b;
}