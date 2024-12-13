#include "api.hpp"

int main(int argc, char* argv[]) {
    mergefile("api.coffee", argv[1], "output_generated.coffee");
    coffee2js("output_generated.coffee", argv[2]);
    system("del output_generated.coffee");
    return 0;
}