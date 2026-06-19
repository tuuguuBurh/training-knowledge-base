# TypeScript Config (tsconfig.json)

## tsconfig.json гэж юу вэ?

`tsconfig.json` нь TypeScript compiler хэрхэн ажиллахыг тохируулдаг файл юм.

Жишээ:

```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "ESNext"
  }
}
```

---

# strict

```json
{
  "strict": true
}
```

TypeScript-ийн хамгийн хатуу type checking горимыг асаадаг.

### strict: false

```ts
let name;
name = "Bat";
```

✅ Алдаагүй ажиллана.

```ts
function greet(name) {
  return name;
}
```

✅ Алдаагүй ажиллана.

---

### strict: true

```ts
function greet(name) {
  return name;
}
```

❌ Алдаа:

```txt
Parameter 'name' implicitly has an 'any' type
```

---

## NT дээр яагаад strict: true байдаг вэ?

- Алдааг эрт илрүүлдэг.
- Runtime bug багасгадаг.
- Кодын чанар сайжруулдаг.
- Багийн бүх гишүүд ижил стандарт мөрддөг.

Жишээ:

```ts
const user = users.find(
  (user) => user.id === 1
);

console.log(user.name);
```

strict mode дээр:

```txt
'user' is possibly undefined
```

гэж анхааруулна.

Зөв хувилбар:

```ts
console.log(user?.name);
```

эсвэл

```ts
if (user) {
  console.log(user.name);
}
```

---

# target

TypeScript кодыг ямар JavaScript хувилбар руу хөрвүүлэхийг заадаг.

```json
{
  "target": "ES2022"
}
```

---

Жишээ:

```ts
const add = (a: number, b: number) => a + b;
```

### target: ES5

```js
var add = function (a, b) {
  return a + b;
};
```

болгон хөрвүүлнэ.

---

### target: ES2022

```js
const add = (a, b) => a + b;
```

хэвээр үлдээнэ.

---

Орчин үеийн Next.js төслүүдэд:

```json
{
  "target": "ES2022"
}
```

эсвэл

```json
{
  "target": "ESNext"
}
```

ашигладаг.

---

# module

JavaScript module системийг тодорхойлдог.

```json
{
  "module": "ESNext"
}
```

---

Орчин үеийн ES Module:

```ts
import { useState } from 'react';

export default Page;
```

---

Хуучин CommonJS:

```js
const fs = require('fs');

module.exports = {};
```

---

Next.js дээр ихэвчлэн:

```json
{
  "module": "ESNext"
}
```

ашигладаг.

---

# moduleResolution

TypeScript import-уудыг хэрхэн хайж олохыг тодорхойлдог.

```json
{
  "moduleResolution": "Bundler"
}
```

---

Жишээ:

```ts
import Button from '@/components/Button';
```

TypeScript:

```txt
Button хаана байрлаж байна вэ?
```

гэдгийг moduleResolution ашиглан олдог.

---

Түгээмэл утгууд:

```txt
Node
NodeNext
Bundler
```

---

Next.js 15+ дээр:

```json
{
  "moduleResolution": "Bundler"
}
```

их ашиглагддаг.

---

# paths

Import alias үүсгэхэд ашиглагддаг.

### Alias байхгүй

```ts
import Button from '../../../../components/Button';
```

Уншихад төвөгтэй.

---

### Alias ашиглах

```json
{
  "paths": {
    "@/*": ["./src/*"]
  }
}
```

---

Дараа нь:

```ts
import Button from '@/components/Button';
```

гэж импорт хийж болно.

---

# Жишээ tsconfig.json

```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

# Дүгнэлт

```txt
strict           -> type шалгалтын хатуу горим
target           -> ямар JS рүү хөрвүүлэх вэ
module           -> ямар module систем ашиглах вэ
moduleResolution -> import-уудыг хэрхэн олох вэ
paths            -> alias үүсгэх
```
