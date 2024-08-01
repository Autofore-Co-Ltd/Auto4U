document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');

    if (loginForm) {
        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const name = document.getElementById('name').value;
            const telephoneNumber = document.getElementById('telephoneNumber').value;
            const response = await fetch('/api/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ name, telephoneNumber })
            });

            const data = await response.text();
            const messageElement = document.getElementById('loginMessage');
            if (response.ok) {
                messageElement.style.color = 'green';
                messageElement.innerText = 'Login successful';
            } else {
                messageElement.style.color = 'red';
                messageElement.innerText = 'Invalid credentials';
            }
        });
    }

    if (signupForm) {
        signupForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const name = document.getElementById('name').value;
            const telephoneNumber = document.getElementById('telephoneNumber').value;
            const password = document.getElementById('password').value;
            const response = await fetch('/api/signup', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ name, telephoneNumber, password })
            });

            const data = await response.text();
            const messageElement = document.getElementById('signupMessage');
            if (response.ok) {
                messageElement.style.color = 'green';
                messageElement.innerText = 'Signup successful';
            } else {
                messageElement.style.color = 'red';
                messageElement.innerText = 'Signup failed';
            }
        });
    }
});
