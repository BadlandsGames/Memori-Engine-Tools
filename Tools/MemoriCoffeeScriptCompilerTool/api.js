class Debug {
    static Log(textin) {
        console.log(textin);
    }
    static Error(textin) {
        console.error(textin);
    }
    static Performance(textin) {
        if(textin == "fps" || textin == "FPS") {
            return 1;
        }
        return 0;
    }
}