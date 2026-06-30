## Discriminated Union гэж юу вэ?

- Discriminated Union нь нийтлэг discriminator field (жишээ нь `status`) ашиглан хэд хэдэн холбоост type-ийг нэгтгэх арга юм.
- TypeScript тухайн discriminator-ийн утгаар type narrowing хийж, зөв property-уудыг автоматаар таньдаг.

## Async State

Энэ жишээнд:

- `loading`
- `success`
- `error`

гэсэн 3 төлвийг Discriminated Union ашиглан загварчилсан.
## Discriminated Union ашиглан хийсэн жишээ

```tsx
'use client';

import { useEffect, useState } from 'react';

type User = {
  id: number;
  name: string;
  email: string;
};

type AsyncState =
  | {
      status: 'loading';
    }
  | {
      status: 'success';
      data: User[];
    }
  | {
      status: 'error';
      error: string;
    };

const fetchJson = async <T,>(
  url: string
): Promise<T> => {
  const response = await fetch(url);

  if (!response.ok) {
    throw new Error(
      `Request failed: ${response.status}`
    );
  }

  return response.json();
};

export default function Page() {
  const [state, setState] =
    useState<AsyncState>({
      status: 'loading',
    });

  useEffect(() => {
    const getUsers = async () => {
      try {
        setState({
          status: 'loading',
        });

        const users = await fetchJson<User[]>(
          'https://jsonplaceholder.typicode.com/users'
        );

        setState({
          status: 'success',
          data: users,
        });
      } catch (err) {
        setState({
          status: 'error',
          error:
            err instanceof Error
              ? err.message
              : 'Unknown error',
        });
      }
    };

    getUsers();
  }, []);

  if (state.status === 'loading') {
    return <div>Loading...</div>;
  }

  if (state.status === 'error') {
    return <div>Error: {state.error}</div>;
  }

  return (
    <div>
      {state.data.map((user) => (
        <div key={user.id}>
          <h2>{user.name}</h2>
          <p>{user.email}</p>
        </div>
      ))}
    </div>
  );
}
```