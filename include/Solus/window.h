#include <GLFW/glfw3.h>
#include <stdbool.h>

typedef struct{
    GLFWwindow* raw;
    char* title;
    int width;
    int height;
}SlWindow;

bool slCreateWindow(SlWindow* window);