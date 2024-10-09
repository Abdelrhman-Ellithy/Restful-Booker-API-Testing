# Restful-Booker API Testing Project 🚀

This project contains a set of API tests for the [Restful-Booker API](https://restful-booker.herokuapp.com/), an API for creating and managing booking data. The tests are automated using Postman 🛠️ and executed via Newman, ensuring coverage of key API functionalities such as booking creation, retrieval, updating, and deletion.

![Postman Logo](https://upload.wikimedia.org/wikipedia/commons/c/c2/Postman_%28software%29.png)

## Table of Contents

- [Project Overview](#project-overview)
- [API Endpoints Tested](#api-endpoints-tested)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Tests](#running-the-tests)
- [Environment Setup](#environment-setup)
- [Test Collection Structure](#test-collection-structure)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The purpose of this project is to automate testing of the Restful-Booker API to ensure the functionality of various endpoints such as booking creation, retrieval, update, and deletion. These tests are written in Postman 🛠️ and executed via Newman, providing robust API validation with environment variables to support dynamic testing.

### Technologies Used:
- **Postman** for API request creation and test scripting. 🛠️
- **Newman** for command-line execution of Postman collections.
- **Node.js** for running Newman and managing dependencies. 🖥️


![NPM Logo](https://th.bing.com/th/id/OIP.W9KqKY8XIN2U66v1oa7TYgHaGa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7)

## API Endpoints Tested

The following API endpoints are covered in this test suite:

1. **Create Booking** (`POST /booking`)
2. **Get All Bookings** (`GET /booking`)
3. **Get Single Booking** (`GET /booking/{id}`)
4. **Update Booking** (`PUT /booking/{id}`)
5. **Partial Update Booking** (`PATCH /booking/{id}`)
6. **Delete Booking** (`DELETE /booking/{id}`)
7. **Create Token** (`POST /auth`)

More details can be found in the official [API documentation](https://restful-booker.herokuapp.com/apidoc/index.html). 📄

## Prerequisites 🔧

Before running the tests, ensure that you have the following installed:

- [Node.js](https://nodejs.org/en/download/) (v10 or higher) 🖥️
- [npm](https://www.npmjs.com/get-npm) (bundled with Node.js) 📦
- [Postman](https://www.postman.com/downloads/) (for test development) 🛠️
- [Newman](https://www.npmjs.com/package/newman) (for running Postman collections via CLI)

## Running the Tests 🏃‍♂️

To execute the test suite, use Newman with the provided collection and environment files:

```bash
newman run '.\test booking.postman_collection.json' '.\test booking env.postman_environment.json'
```

- **`collection.json`**: Postman collection containing API tests.
- **`environment.json`**: Postman environment file containing dynamic variables.

This will run all tests included in the collection and display the results in the terminal. 🎯

## Environment Setup 🌐

The Postman environment file (`environment.json`) includes dynamic variables such as:

- `baseURL`: Base URL of the API (`https://restful-booker.herokuapp.com/`).
- `firstname`: The first name used in the booking.
- `lastname`: The last name used in the booking.
- `lastBookingID`: The ID of the last created booking.
- `token`: Authentication token for protected endpoints.

To set up a new environment in Postman:

1. Open Postman and go to **Environments**.
2. Create a new environment and define the following variables:
   - `baseURL`
   - `firstname`
   - `lastname`
   - `token`
3. Export this environment file as `environment.json`.

## Test Collection Structure 📑

The Postman collection contains the following requests and test scripts:

### 1. **Create Booking** (`POST /booking`)
- **Test Script**:
  - Checks if the status code is 200.
  - Validates that the first and last names in the response match the environment variables.
  - Verifies that the `Content-Type` header is `application/json`.
  - Ensures response time is less than 1500ms.
  - Saves the `bookingid` into the environment for later use.

### 2. **Get All Bookings** (`GET /booking`)
- **Test Script**:
  - Verifies the status code is 200.
  - Confirms that the response contains the last created booking ID.
  - Ensures response time is under 1500ms.

### 3. **Get Single Booking** (`GET /booking/{id}`)
- **Test Script**:
  - Ensures the booking details (first and last names) match the environment values.
  - Validates the status code, content type, and response time.

### 4. **Create Token** (`POST /auth`)
- **Test Script**:
  - Verifies the creation of an authentication token.
  - Saves the `token` into the environment for later use in authorized requests.

### 5. **Update Booking** (`PUT /booking/{id}`)
- **Test Script**:
  - Ensures the updated first and last names match the environment values.
  - Verifies the status code and response headers.
  - Uses the saved authentication token for the request.

### 6. **Delete Booking** (`DELETE /booking/{id}`)
- **Test Script**:
  - Verifies the booking is successfully deleted by checking the status code (201).
  - Ensures the response time is less than 1500ms.

### 7. **Get Deleted Booking** (`GET /booking/{id}`)
- **Test Script**:
  - Confirms the booking is no longer accessible (status code 404).
  - Checks response headers and response time.

## License 📜

This project is licensed under the MIT License. See the `LICENSE` file for details.

```txt
Best Regards,  
Abdelrahman Ellithy  
Software Development Engineer in Test & Instructor  
Udemy & Software Institute 👨‍💻
```