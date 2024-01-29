docker-compose up -d mongodb
export NODE_OPTIONS=--openssl-legacy-provider

```
cd client/
npm i
```

```
cd server/
npm i
npm run seed:db -- admin@example.com strongpassword
```

npm run dev

