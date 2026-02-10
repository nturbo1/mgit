SHA1_OBJ := sha1/sha1.o
SHA1_LIB := sha1/libsha1.a

sha1/%.o: sha1/%.c
	$(CC) $(CFLAGS) -c $^ -o $@

$(SHA1_LIB): $(SHA1_OBJ)
	ar rcs $@ $^
