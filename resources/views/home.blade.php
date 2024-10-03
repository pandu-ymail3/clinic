@extends('layout')

@section('content')
    <h1>Patient Management System</h1>
    <p>Welcome to the Patient Management System. Choose a section to manage:</p>

    <ul>
        <li><a href="{{ route('patients.index') }}">Manage Patients</a></li>
        <li><a href="{{ route('doctors.index') }}">Manage Doctors</a></li>
        <li><a href="{{ route('appointments.index') }}">Manage Appointments</a></li>
        <li> <a href="{{ route('appointments.create') }}">Book an Appointment</a></li> 
    </ul>
@endsection