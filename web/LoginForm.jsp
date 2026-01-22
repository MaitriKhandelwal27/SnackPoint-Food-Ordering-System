<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login | SnackPoint
</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #fd7e14 0%, #ff8c42 50%, #fd7e14 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.main {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.login-wrapper {
    background: rgba(255, 255, 255, 0.97);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(253, 126, 20, 0.25);
    overflow: hidden;
    height: 600px;
    display: flex;
    border: 1px solid rgba(253, 126, 20, 0.2);
}

.login-image {
    flex: 1;
    position: relative;
    overflow: hidden;
}

.login-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.login-form {
    flex: 1;
    padding: 60px 50px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.login-form h2 {
    font-size: 2.5rem;
    font-weight: 700;
    background: linear-gradient(135deg, #fd7e14, #ff8c42);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 10px;
    text-align: center;
}

.login-form p {
    color: #495057;
    font-size: 1.1rem;
    margin-bottom: 40px;
    text-align: center;
    font-weight: 400;
}

.form-control {
    border: 2px solid #fd7e14;
    border-radius: 12px;
    padding: 15px 20px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    margin-bottom: 20px;
    background: rgba(255, 255, 255, 0.9);
}

.form-control:focus {
    border-color: #fd7e14;
    box-shadow: 0 0 0 0.25rem rgba(253, 126, 20, 0.2);
    background: white;
    transform: translateY(-2px);
}

.btn-login {
    background: linear-gradient(135deg, #fd7e14 0%, #ff8c42 100%);
    border: 2px solid #fd7e14;
    border-radius: 12px;
    padding: 15px;
    font-size: 1.2rem;
    font-weight: 700;
    color: white;
    width: 100%;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.btn-login:hover {
    background: linear-gradient(135deg, #e66a0b 0%, #f27a30 100%);
    transform: translateY(-3px);
    box-shadow: 0 15px 30px rgba(253, 126, 20, 0.4);
    color: white;
    border-color: #e66a0b;
}

@media (max-width: 768px) {
    .login-wrapper {
        flex-direction: column;
        height: auto;
        margin: 20px;
    }
    
    .login-image {
        height: 250px;
    }
    
    .login-form {
        padding: 40px 30px;
    }
    
    .login-form h2 {
        font-size: 2rem;
    }
}
</style>
</head>

<body>
<div class="main">
    <div class="login-wrapper">
        <!-- LEFT IMAGE -->
        <div class="login-image">
            <img src="<%=request.getContextPath()%>/images/login1.jpg" alt="Snackers Login">
        </div>

        <!-- RIGHT FORM -->
        <div class="login-form">
            <h2>Welcome Back!</h2>
            <p>Sign in to continue to <strong>Snackers</strong></p>

            <form method="post" action="CheckLogin.jsp">
                <div class="mb-3">
                    <input type="email" name="email" class="form-control form-control-lg" 
                           placeholder="Enter your email" required>
                </div>

                <div class="mb-3">
                    <input type="password" name="pass" class="form-control form-control-lg" 
                           placeholder="Enter your password" required>
                </div>

                <div class="mb-3">
                    <button type="submit" class="btn btn-login">
                        <i class="fas fa-sign-in-alt me-2"></i>Login
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
