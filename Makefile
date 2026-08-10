pom:
	sed -i -e 's/<project.branch><\/project.branch>/<project.branch>development<\/project.branch>/' pom.xml

build: pom
	docker run -it --rm --name my-maven-project -v .:/usr/src/mymaven -v maven-store:/root/.m2 -w /usr/src/mymaven maven:3.9.16-eclipse-temurin-25 mvn clean install
	git checkout pom.xml
