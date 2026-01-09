FROM node:22-bookworm-slim
WORKDIR /app

ENV CI=true
ENV HUSKY=0

RUN corepack enable && corepack prepare pnpm@9.15.9 --activate

COPY package.json pnpm-lock.yaml ./
RUN pnpm install

COPY . .


EXPOSE 5173
CMD ["pnpm", "run", "dev"]