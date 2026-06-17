**interface ,type gej yu ve ylgaa**

- interface , type gedeg ni type todorhoilj typed ner ugj baigaa 
- ylgaa geh yum bol interface ni object stractured zoriulsan ijil nerteger ahin zaralhad merge hiigddg type ni object ees gadna primitive union, function zereg buh turliin typed ner ugch chaddag 

## type bolohgui
```tsx
type User = {
  name: string;
};

type User = {
  age: number;
};
```

## interface bolno 

```tsx
interface User {
  name: string;
}

interface User {
  age: number;
}
// ur dun =>
interface User {
  name: string;
  age: number;
}
```


## type chadna
```tsx
type Age = number;
type Status = "loading" | "success" | "error";
type ID = string | number;
type Add = (a: number, b: number) => number;
```

## Interface ингэж чадахгүй.