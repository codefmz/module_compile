#include "comp.h"
#include "sub.h"
#include "add.h"

int comp(int a, int b)
{
    return add(a, b) - sub(a, b);
}