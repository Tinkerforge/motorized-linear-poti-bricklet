Imports System
Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Motorized Linear Poti Bricklet

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim mlp As New BrickletMotorizedLinearPoti(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get current position
        Dim position As Integer = mlp.GetPosition()
        Console.WriteLine("Position: " + position.ToString()) ' Range: 0 to 100

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
