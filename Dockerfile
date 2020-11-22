#Set base image.
FROM node:8-onbuild
#Instruct Docker to expose port 8080.
EXPOSE 8080
#Copy sever.js.
COPY server.js
#Run server.js with node.
CMD node sever.js