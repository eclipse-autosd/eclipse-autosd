#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file = fopen("/tmp/sample.msg", "w");

    if (file == NULL) {
        perror("Failed to create file");
        return 1;
    }

    fprintf(file, "Hello AutoSD (by Bazel)!\n");

    fclose(file);

    printf("File created: /tmp/sample.msg\n");

    return 0;
}
