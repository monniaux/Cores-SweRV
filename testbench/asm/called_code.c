extern void puts(const char *s);

int main() {
  for(int i=0; i<3; i++) {
    puts("TOTO\n");
  }
  for(int i=0; i<4; i++) {
    puts("MIAOU\n");
  }
  puts("MIXOU\n");
  puts("MITOU\n");
  return 0;
}
