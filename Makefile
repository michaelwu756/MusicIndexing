default:
	set -x; \
	for album in *; do \
		if [ "$$album" == "contents.txt" ]; then continue; fi; \
		if [ "$$album" == ".git" ]; then continue; fi; \
		if [ "$$album" == "Makefile" ]; then continue; fi; \
		if [ "$$album" == ".gitignore" ]; then continue; fi; \
		cd "$$album"; \
		zip -r "../$$album.zip" *; \
		cd ..; \
	done

removeTempFiles:
	rm -f */*.ini
	rm -f *.ini
	rm -f ./Folder.jpg
	rm -f */AlbumArt*.jpg
	rm -f *.db
	rm -f */*.db

index:
	find . | grep -v '\.git' | grep -v 'contents\.txt' | grep -v 'Makefile' | grep -v '\.zip' > contents.txt

clean:
	rm -f *.zip

.PHONY: default index removeTempFiles clean