@extends('layout')

@section('content')
    <h1>Book an Appointment</h1>

    @if($errors->any())
        <div>
            <ul>
                @foreach($errors->all() as $error)
                    <li style="color: red;">{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('appointments.store') }}" method="POST">
        @csrf
        <label for="patient_id">Patient:</label>
        <select name="patient_id" required>
            @foreach($patients as $patient)
                <option value="{{ $patient->id }}">{{ $patient->name }}</option>
            @endforeach
        </select>

        <label for="doctor_id">Doctor:</label>
        <select name="doctor_id" required>
            @foreach($doctors as $doctor)
                <option value="{{ $doctor->id }}">{{ $doctor->name }} ({{ $doctor->specialization }})</option>
            @endforeach
        </select>

        <label for="date">Date:</label>
        <input type="date" name="date" required>

        <label for="time">Time:</label>
        <input type="time" name="time" required>

        <button type="submit">Book Appointment</button>
    </form>
@endsection
