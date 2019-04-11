default:
	cp -al ~/Music/...and\ Justice\ for\ All ~/Music/* .
	make removeTempFiles
	make index
	git diff

zip:
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

unzip:
	for album in *.zip; do unzip "$$album" -d "$${album%%.zip}"; done

removeTempFiles:
	rm -f */*.ini
	rm -f *.ini
	rm -f */Folder.jpg
	rm -f */AlbumArt*.jpg
	rm -f *.db
	rm -f */*.db
	rm -f ...and\ Justice\ for\ All/*.ini
	rm -f ...and\ Justice\ for\ All/Folder.jpg
	rm -f ...and\ Justice\ for\ All/AlbumArt*.jpg
	rm -f ...and\ Justice\ for\ All/*.db

index:
	find . | grep -v '\.git' | grep -v 'contents\.txt' | grep -v 'Makefile' | grep -v '\.zip' > contents.txt

clean:
	git clean -xdf

removeZip:
	rm -f *.zip

.PHONY: default index removeTempFiles clean zip unzip removeZip