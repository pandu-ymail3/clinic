@extends('layout')

@section('content')
    <h1>Doctor List</h1>

    @if(session('success'))
        <p style="color:green">{{ session('success') }}</p>
    @endif

    <a href="{{ route('doctors.create') }}">Add New Doctor</a>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Specialization</th>
                <th>Contact Information</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($doctors as $doctor)
                <tr>
                    <td>{{ $doctor->name }}</td>
                    <td>{{ $doctor->specialization }}</td>
                    <td>{{ $doctor->contact_information }}</td>
                    <td>
                        <a href="{{ route('doctors.edit', $doctor->id) }}">Edit</a> |
                        <form action="{{ route('doctors.destroy', $doctor->id) }}" method="POST" style="display:inline-block">
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
