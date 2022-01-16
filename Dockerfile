FROM ubuntu
LABEL description = "I'm carrying a telegram bot"
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY . .
RUN apt-get update && apt-get install -y git
RUN mkdir -p /var/hatsuneMiku
WORKDIR /var/hatsuneMiku
RUN git clone https://github.com/Zev-Arthur/Intelisys_assignment.git
RUN cd Intelisys_assignment/ && apt-get install -y maven && mvn clean install
ENTRYPOINT cd Intelisys_assignment/ && cd hello_bot/ && mvn  exec:java -Dexec.mainClass="kpi.acts.appz.bot.hellobot.HelloWorldBot" -Dexec.args="1631350081:AAGSyDbixGxarcrbILrgjex6oInkFSleveE Pikachu";
EXPOSE 80