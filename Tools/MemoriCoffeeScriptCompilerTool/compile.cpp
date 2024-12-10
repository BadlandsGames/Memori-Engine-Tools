#include "api.hpp"

int main(int argc, char* argv[]) {
    coffeescript(
        str(argv[1]), str(argv[2])
    );
    return 0;
}