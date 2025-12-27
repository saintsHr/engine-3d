#include "Solus/window.h"

#include "Solus/internal.h"

bool slCreateWindow(SlWindow* window){
    if (!window){
        slPrintErr("empty struct window pointer");
        return false;
    }

    window->raw = glfwCreateWindow(
        window->width,
        window->height,
        window->title,
        NULL,
        NULL
    );

    if (!window->raw){
        slPrintErr("empty raw window pointer");
        return false;
    }

    return true;
}