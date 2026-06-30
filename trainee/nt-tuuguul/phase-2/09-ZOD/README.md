# Zod (Runtime Validation)

## Zod гэж юу вэ?

**Zod** нь TypeScript-д зориулсан runtime validation library юм.

TypeScript нь зөвхөн **compile time** дээр type шалгадаг. Харин API-аас ирж буй өгөгдөл **runtime** дээр ирдэг учраас TypeScript дангаараа API-ийн буруу өгөгдлөөс хамгаалж чаддаггүй.

Иймээс runtime дээр өгөгдлийн бүтэц зөв эсэхийг шалгахын тулд Zod ашигладаг.

---

## TypeScript-ийн хязгаар

Жишээ нь дараах type байгаа гэж үзье.

```tsx
type User = {
  id: number;
  name: string;
};
```

API-аас өгөгдөл авах үед:

```tsx
const user: User = await response.json();
```

TypeScript дараах байдлаар ойлгоно.

```txt
user.id -> number
user.name -> string
```

Гэвч API үнэндээ дараах буруу өгөгдлийг буцааж болно.

```json
{
  "id": "abc",
  "name": 123
}
```

TypeScript compile хийх үед ямар ч алдаа өгөхгүй.

Учир нь API response нь runtime дээр ирдэг бөгөөд TypeScript runtime үед ажилладаггүй.

---

## Compile Time vs Runtime

### TypeScript

```txt
Compile Time
```

Код ажиллахаас өмнө type шалгана.

### API Response

```txt
Runtime
```

Код ажиллаж байх үед ирнэ.

Тиймээс:

```tsx
const data: User = await response.json();
```

гэдэг нь:

```txt
"Энэ өгөгдөл User мөн гэж би итгэж байна"
```

гэсэн утгатай.

TypeScript тухайн өгөгдлийг шалгахгүй.

---

# Zod ашиглан Validation хийх

## Суулгах

```bash
npm install zod
```

---

## Schema үүсгэх

```tsx
import { z } from 'zod';

const UserSchema = z.object({
  id: z.number(),
  name: z.string(),
});
```

Энэ schema нь дараах бүтэцтэй өгөгдлийг зөвшөөрнө.

```json
{
  "id": 1,
  "name": "Bat"
}
```

---

## parse() ашиглан шалгах

```tsx
const data = await response.json();

const user = UserSchema.parse(data);
```

### Зөв өгөгдөл

```json
{
  "id": 1,
  "name": "Bat"
}
```

✅ Validation амжилттай болно.

---

### Буруу өгөгдөл

```json
{
  "id": "abc",
  "name": 123
}
```

❌ ZodError шиднэ.

---


# Zod-аас TypeScript Type үүсгэх

Ихэнх тохиолдолд type-ээ тусад нь дахин бичих шаардлагагүй.

```tsx
import { z } from 'zod';

const UserSchema = z.object({
  id: z.number(),
  name: z.string(),
  email: z.string(),
});
```

Type автоматаар гаргаж болно.

```tsx
type User = z.infer<typeof UserSchema>;
```

Үр дүн:

```tsx
type User = {
  id: number;
  name: string;
  email: string;
};
```

---

# Zod ашиглахын давуу тал

- Runtime validation хийнэ.
- API-ийн буруу өгөгдлийг илрүүлнэ.
- TypeScript-тэй маш сайн ажилладаг.
- Type-ээ schema-аас автоматаар үүсгэж болно.
- Production түвшний аюулгүй байдал нэмэгдэнэ.

---
# Дүгнэлт

Zod нь API-аас ирж буй өгөгдлийн бүтцийг runtime дээр шалгаж, TypeScript-ийн compile-time хамгаалалтыг runtime хамгаалалтаар нөхдөг.

```txt
TypeScript = Compile-time safety
Zod = Runtime safety
```

Эдгээрийг хамтад нь ашигласнаар илүү найдвартай, type-safe application хөгжүүлэх боломжтой.