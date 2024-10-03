@extends('layout')

@section('content')
    <h1>Add New Doctor</h1>

    @if($errors->any())
        <div>
            <ul>
                @foreach($errors->all() as $error)
                    <li style="color: red;">{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('doctors.store') }}" method="POST">
        @csrf
        <label for="name">Name:</label>
        <input type="text" name="name" required>

        <label for="specialization">Specialization:</label>
        <input type="text" name="specialization" required>

        <label for="contact_information">Contact Information:</label>
        <input type="text" name="contact_information" required>

        <button type="submit">Save</button>
    </form>
@endsection
