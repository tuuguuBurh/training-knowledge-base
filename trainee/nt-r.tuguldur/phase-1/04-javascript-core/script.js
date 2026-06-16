// ======================================
// ES5 дээр var ашигладаг байсан
// ======================================
var name = "John";
var age = 25;

// ES6
const userName = "John";
let userAge = 25;


// ======================================
// 2. Function → Arrow Function
// ======================================

// ES5
function add(a, b) {
  return a + b;
}

// ES6
const addES6 = (a, b) => a + b;


// ======================================
// 3. String Concatenation → Template Literal
// ======================================

// ES5
var firstName = "John";
console.log("Hello " + firstName);

// ES6
const firstNameES6 = "John";
console.log(`Hello ${firstNameES6}`);


// ======================================
// 4. Object Access → Destructuring
// ======================================

// ES5
var user = {
  name: "John",
  age: 25
};

var userName1 = user.name;
var userAge1 = user.age;

console.log(userName1);
console.log(userAge1);

// ES6
const userES6 = {
  name2: "John",
  age2: 25
};

const { name2, age2 } = userES6;

console.log(name2);
console.log(age2);



// ======================================
// 5. Spread Operator
// ======================================

// ES5
var arr1 = [1, 2, 3];
var arr2 = arr1.concat([4, 5]);

console.log(arr2);

// ES6
const arr3 = [1, 2, 3];
const arr4 = [...arr3, 4, 5];

console.log(arr4);



// ======================================
// 6. Promise → Async/Await
// ======================================

// ES5 / Promise
function getUsersES5() {
  fetch("https://jsonplaceholder.typicode.com/users")
    .then(function (response) {
      return response.json();
    })
    .then(function (data) {
      console.log(data);
    })
    .catch(function (error) {
      console.log(error);
    });
}

// ES6 Async/Await
const getUsersES6 = async () => {
  try {
    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users"
    );

    const data = await response.json();

    console.log(data);
  } catch (error) {
    console.log(error);
  }
};

// getUsersES5();
// getUsersES6();