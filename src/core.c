#include "Solus/core.h"

#include <GLFW/glfw3.h>

bool slInit(){
    if (
        !glfwInit()
    ) return false;
    
    return true;
}

void slExit(){
    glfwTerminate();
}