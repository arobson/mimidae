# Build stage
FROM node:22-alpine3.19 AS build
WORKDIR /app
COPY package.json package-lock.json tsconfig.json ./
RUN npm ci
COPY ./src ./src
RUN npm run build

# Runtime stage
FROM node:22-alpine3.19

WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/lib ./lib

EXPOSE 4411

CMD node ./lib