all:
	LANG=zh_EN.UTF-8 emacs --script Makefile.el
clean:
	rm -rf html/*
	rm -rf ~/.org-timestamps/
git:
	cd /home/dm200/orgmode-blog/html/
	rm *~
	git add .
	git commit -m "update"
	git push
	cd /home/dm200/orgmode-blog/src/
	rm *~
	git add .
	git commit -m "update"
	git push
