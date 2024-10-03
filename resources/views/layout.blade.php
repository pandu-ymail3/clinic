<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Management</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>

<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            padding: 10px;
            text-align: center;
        }
        header a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
        }
        header a:hover {
            text-decoration: underline;
        }
        main {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
    </style>
    <header>
    <a href="{{ route('home') }}">Home</a>
    <a href="{{ route('patients.index') }}">Patients</a>
    <a href="{{ route('doctors.index') }}">Doctors</a>
    <a href="{{ route('appointments.index') }}">Appointments</a>
</header>

<body>
    <div class="container">
        @yield('content')
    </div>
</body>
</html>
