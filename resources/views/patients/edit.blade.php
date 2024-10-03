@extends('layout')

@section('content')
    <h1>Edit Patient</h1>

    <form action="{{ route('patients.update', $patient->id) }}" method="POST">
        @csrf
        @method('PUT')

        <label>Name:</label>
        <input type="text" name="name" value="{{ $patient->name }}" required>

        <label>Age:</label>
        <input type="number" name="age" value="{{ $patient->age }}" required>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="male" {{ $patient->gender == 'male' ? 'selected' : '' }}>Male</option>
            <option value="female" {{ $patient->gender == 'female' ? 'selected' : '' }}>Female</option>
        </select>

        <label>Contact Information:</label>
        <input type="text" name="contact_information" value="{{ $patient->contact_information }}" required>

        <button type="submit">Update</button>
    </form>
@endsection
