@extends('layout')

@section('content')
    <h1>Edit Doctor</h1>

    @if($errors->any())
        <div>
            <ul>
                @foreach($errors->all() as $error)
                    <li style="color: red;">{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('doctors.update', $doctor->id) }}" method="POST">
        @csrf
        @method('PUT')

        <label for="name">Name:</label>
        <input type="text" name="name" value="{{ $doctor->name }}" required>

        <label for="specialization">Specialization:</label>
        <input type="text" name="specialization" value="{{ $doctor->specialization }}" required>

        <label for="contact_information">Contact Information:</label>
        <input type="text" name="contact_information" value="{{ $doctor->contact_information }}" required>

        <button type="submit">Update</button>
    </form>
@endsection
