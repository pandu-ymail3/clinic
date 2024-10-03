@extends('layout')

@section('content')
    <h1>Patient List</h1>

    <form action="{{ route('patients.index') }}" method="GET">
        <input type="text" name="search" placeholder="Search by name or age">
        <button type="submit">Search</button>
    </form>

    <a href="{{ route('patients.create') }}">Add New Patient</a>

    @if(session('success'))
        <p>{{ session('success') }}</p>
    @endif

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Contact Information</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($patients as $patient)
                <tr>
                    <td>{{ $patient->name }}</td>
                    <td>{{ $patient->age }}</td>
                    <td>{{ ucfirst($patient->gender) }}</td>
                    <td>{{ $patient->contact_information }}</td>
                    <td>
                        <a href="{{ route('patients.edit', $patient->id) }}">Edit</a>
                        <form action="{{ route('patients.destroy', $patient->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
