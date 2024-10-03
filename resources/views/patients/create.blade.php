@extends('layout')

@section('content')
    <h1>Add New Patient</h1>

    <form action="{{ route('patients.store') }}" method="POST">
        @csrf
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Age:</label>
        <input type="number" name="age" required>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>

        <label>Contact Information:</label>
        <input type="text" name="contact_information" required>

        <button type="submit">Save</button>
    </form>
@endsection
