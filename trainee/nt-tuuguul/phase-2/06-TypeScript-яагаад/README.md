
**type script gej yu ve yagad ashigladag ve**

typescript gedeg ni javascript d type nemdeg turul . Ene ni code ajillahaas umnu type nii aldaa garsan baina uu uguig shalgaj olon hun ajillaj baigaa tusul deer naidwartai baidliig nemegduuldeg. 
string , number , boolean array ni undsen tipuud

string => text

number => too

boolean => true false

array => olon utga []

unknown => gedeg ni turul ni todorhoigu gesen ug let value:unknown gesen bol value = "hello"; value = 123; value = true; geh met zuilsiig ashiglaj bolno gehdee let value = 'asd' gecheed value.toUpperCase() gej bolohgui yagaad gewel typescript turuliin medehgui baigaa 

any -> typescriptiin hamgaalaltiig untraadag yumarch turul baij bolno gesen ug gehdee runtime deer unaj bolno 

## yagaad unknown any gaas deer ve 
any = "Надад хамаагүй"
unknown = "Эхлээд шалга"

Тиймээс production код дээр unknown нь илүү аюулгүй.

## never гэж юу вэ?
Хэзээ ч утга буцаахгүй.

Ихэнхдээ алдаа шиддэг функц.

function throwError(): never {
  throw new Error("Something went wrong");
}
Энэ функц:

return хийхгүй
код үргэлжлэхгүй




**fetch api js iig ts bolgoson**
```tsx
'use client';

import { useEffect, useState } from 'react';

type Geo = {
  lat: string;
  lng: string;
};

type Address = {
  street: string;
  suite: string;
  city: string;
  zipcode: string;
  geo: Geo;
};

type Company = {
  name: string;
  catchPhrase: string;
  bs: string;
};

type User = {
  id: number;
  name: string;
  username: string;
  email: string;
  phone: string;
  website: string;
  address: Address;
  company: Company;
};

const Page = () => {
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState<boolean>(false);

  const getUsers = async () => {
    try {
      setLoading(true);

      const response = await fetch(
        'https://jsonplaceholder.typicode.com/users'
      );

      if (!response.ok) {
        throw new Error('Request failed');
      }

      const data = await response.json();

      setUsers(data);
    } catch (err) {
      if (err instanceof Error) {
        console.error(err.message);
      }
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getUsers();
  }, []);

  if (loading) {
    return (
      <div className="bg-white h-screen w-full text-[50px]">
        Loading...
      </div>
    );
  }

  return (
    <div>
      {users.map((user) => (
        <div key={user.id}>
          <h1>{user.name}</h1>
          <p>{user.email}</p>
          <p>{user.address.city}</p>
        </div>
      ))}
    </div>
  );
};

export default Page;
```