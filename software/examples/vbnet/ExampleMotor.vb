Imports System
Imports Tinkerforge

Module ExampleMotor
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ' Callback subroutine for position reached callback
    Sub PositionReachedCB(ByVal sender As BrickletMotorizedLinearPoti, _
                          ByVal position As Integer)
        Console.WriteLine("Position: " + position.ToString()) ' Range: 0 to 100
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim mlp As New BrickletMotorizedLinearPoti(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register position reached callback to subroutine PositionReachedCB
        AddHandler mlp.PositionReachedCallback, AddressOf PositionReachedCB

        ' Move slider smooth to the middle
        mlp.SetMotorPosition(50, BrickletMotorizedLinearPoti.DRIVE_MODE_SMOOTH, False)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
