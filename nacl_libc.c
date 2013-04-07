#include <stdio.h>
#include <assert.h>
#include <sys/unistd.h>

pid_t getpgid(pid_t pid) {
  fprintf(stderr, "ERROR: %s is not implemented\n", __func__);
  assert(0);
  return -1;
}

int gethostname(char *name, size_t len) {
  fprintf(stderr, "ERROR: %s is not implemented\n", __func__);
  assert(0);
  return -1;
}

char *basename(char *path) {
  fprintf(stderr, "ERROR: %s is not implemented\n", __func__);
  assert(0);
  return NULL;
}
