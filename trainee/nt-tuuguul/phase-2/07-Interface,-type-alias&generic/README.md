# Interface, Type Alias & Generic

## Interface, Type гэж юу вэ? Ялгаа нь юу вэ?

`interface` болон `type` хоёулаа TypeScript дээр type тодорхойлж, түүнд нэр өгөхөд ашиглагддаг.

### Interface

- Ихэвчлэн object-ийн бүтэц тодорхойлоход ашигладаг.
- Ижил нэртэйгээр дахин зарлахад автоматаар merge болдог.

```tsx
interface User {
  name: string;
}

interface User {
  age: number;
}
```

Үр дүн:

```tsx
interface User {
  name: string;
  age: number;
}
```

### Type Alias

- Object type тодорхойлж чадна.
- Primitive, Union, Function зэрэг бусад төрлийн type-д нэр өгч чадна.
- Ижил нэрээр дахин зарлах боломжгүй.

```tsx
type User = {
  name: string;
};

type User = {
  age: number;
};
```

❌ Алдаа:

```txt
Duplicate identifier 'User'
```

### Type-ийн давуу тал

```tsx
type Age = number;

type Status = 'loading' | 'success' | 'error';

type ID = string | number;

type Add = (a: number, b: number) => number;
```

Эдгээрийг `interface` ашиглан тодорхойлох боломжгүй.

### Дүгнэлт

- `interface` → Object structure тодорхойлоход тохиромжтой.
- `type` → Object, Primitive, Union, Function зэрэг бүх төрлийн type-д нэр өгч чадна.

---

## Generic гэж юу вэ?

Generic нь type parameter ашиглан нэг функцийг олон төрлийн өгөгдөл дээр дахин ашиглах боломж олгодог.

Жишээ:

```tsx
function getValue<T>(value: T): T {
  return value;
}
```

Энд `T` нь placeholder буюу дараа нь орж ирэх type юм.

```tsx
getValue<string>('hello');
```

↓

```tsx
T = string
```

```tsx
getValue<number>(123);
```

↓

```tsx
T = number
```

### React дээрх Generic-ийн жишээ

```tsx
const [users, setUsers] = useState<User[]>([]);
```

Энд:

```tsx
T = User[]
```

болно.

### Generic Fetch Function

```tsx
const fetchJson = async <T,>(
  url: string
): Promise<T> => {
  const response = await fetch(url);

  if (!response.ok) {
    throw new Error('Request failed');
  }

  return response.json();
};
```

Ашиглах нь:

```tsx
const users = await fetchJson<User[]>(
  'https://jsonplaceholder.typicode.com/users'
);
```

Энд:

```tsx
T = User[]
```

болно.

### Generic-ийн гол давуу тал

Нэг функцийг олон төрлийн өгөгдөл дээр дахин ашиглах боломжтой.

```tsx
fetchJson<User[]>(url);
fetchJson<Product[]>(url);
fetchJson<Post[]>(url);
```