#include "api.hpp"

int main(int argc, char* argv[]) {
    if(argv[3] == "win") {
        compile_file(argv[1], argv[2], true);
    } else {
        compile_file(argv[1], argv[2], false);
    }
    return 0;
}
