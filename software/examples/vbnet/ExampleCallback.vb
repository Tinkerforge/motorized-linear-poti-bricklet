Imports System
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ' Callback subroutine for position callback (parameter has range 0 to 100)
    Sub PositionCB(ByVal sender As BrickletMotorizedLinearPoti, _
                   ByVal position As Integer)
        Console.WriteLine("Position: " + position.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim mlp As New BrickletMotorizedLinearPoti(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register position callback to subroutine PositionCB
        AddHandler mlp.PositionCallback, AddressOf PositionCB

        ' Set period for position callback to 0.05s (50ms) without a threshold
        mlp.SetPositionCallbackConfiguration(50, False, "x"C, 0, 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
