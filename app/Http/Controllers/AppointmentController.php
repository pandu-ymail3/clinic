<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use App\Models\Doctor;
use App\Models\Patient;
use Illuminate\Http\Request;
use App\Models\Log;

class AppointmentController extends Controller
{
    
     //list appointments. 
    public function index(Request $request)
    {
        $appointments = Appointment::query();

        if ($request->has('patient_id')) {
            $appointments->where('patient_id', $request->patient_id);
        }

        if ($request->has('doctor_id')) {
            $appointments->where('doctor_id', $request->doctor_id);
        }

        return view('appointments.index', ['appointments' => $appointments->get()]);
    }

   //new appointment. 
    public function create()
    {
        $patients = Patient::all();
        $doctors = Doctor::all();
        return view('appointments.create', compact('patients', 'doctors'));
    }

   
    public function store(Request $request)
    {
        $request->validate([
            'patient_id' => 'required|exists:patients,id',
            'doctor_id' => 'required|exists:doctors,id',
            'date' => 'required|date',
            'time' => 'required',
        ]);

        // Check if the doctor is available at the given date and time
        $existingAppointment = Appointment::where('doctor_id', $request->doctor_id)
            ->where('date', $request->date)
            ->where('time', $request->time)
            ->first();

        if ($existingAppointment) {
            return back()->withErrors(['Doctor is not available at the selected time']);
        }

        $appointment =  Appointment::create($request->all());

        Log::create([
            'appointment_id' => $appointment->appointment_id,
            'action' => 'Appointment Created',
        ]);

        return redirect()->route('appointments.index')->with('success', 'Appointment booked successfully.');
    }

    
    public function destroy(Appointment $appointment)
    {
        $appointment->update(['status' => 'cancelled']);

        Log::create([
            'appointment_id' => $appointment->appointment_id,
            'action' => 'Appointment Cancelled',
        ]);

        return redirect()->route('appointments.index')->with('success', 'Appointment cancelled.');
    }
}
