
let loading = false;
let error = null;
let users = [];

const getUsers = async () => {
  try {
    loading = true;
    error = null;

    console.log("Loading...");

    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users"
    );

    if (!response.ok) {
      throw new Error(
        `Request failed with status ${response.status}`
      );
    }

    const data = await response.json();

    users = data;

    console.log("Success:");
    console.log(users);
  } catch (err) {
    error = err.message;

    console.error("Error:");
    console.error(error);
  } finally {
    loading = false;

    console.log("Loading finished");
  }
};

getUsers();