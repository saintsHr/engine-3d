#pragma once

#include <stdio.h>
#include <stdlib.h>

static void slPrintErr(const char* msg){
    fprintf(stderr, "SL_ERROR: %s (File: %s, Line: %d)\n", msg, __FILE__, __LINE__);
    exit(EXIT_FAILURE);
}