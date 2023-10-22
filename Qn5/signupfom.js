const passwordInput = document.getElementById("password");
const passwordStrength = document.getElementById("password-strength");
const emailInput = document.getElementById("mailid");
const emailValidity = document.getElementById("email-validity");

function checkPasswordStrength() {
    const password = passwordInput.value;
    const strength = calculatePasswordStrength(password);

    passwordStrength.textContent = strength;
}

function calculatePasswordStrength(password) {
    if (password.length < 8) {
        return "Weak: Password must be at least 8 characters long.";
    }

    if (!/[A-Z]/.test(password)) {
        return "Weak: Password must contain at least one uppercase letter.";
    }

    if (!/\d/.test(password)) {
        return "Weak: Password must contain at least one numeric digit.";
    }

    if (!/[!@#$%^&*]/.test(password)) {
        return "Weak: Password must contain at least one special symbol (e.g., !@#$%^&*).";
    }

    return "Strong: Password meets all requirements!";
}

function checkEmailValidity() {
    const email = emailInput.value;
    if (/^[a-zA-Z0-9._%+-]+@gmail.com$/.test(email)) {
        emailValidity.textContent = "Valid Gmail address.";
    } else {
        emailValidity.textContent = "Invalid Gmail address. Please use a valid Gmail address.";
    }
}
