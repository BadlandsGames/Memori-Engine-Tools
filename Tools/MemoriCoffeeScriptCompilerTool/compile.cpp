#include "api.hpp"

int main(int argc, char* argv[]) {
    js2coffee("api.js", "api_generated.coffee");
    mergefile("api_generated.coffee", argv[1], "output_generated.coffee");
    coffee2js("output_generated.coffee", argv[2]);
    system("del api_generated.coffee && del output_generated.coffee");
    return 0;
}