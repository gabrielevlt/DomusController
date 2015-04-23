package domus.server;
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RemoteDomusInterface extends Remote{
	
	// THERMOSTAT
	public boolean getThermostatState() throws RemoteException;
	public void setThermostatState(boolean b) throws RemoteException;
	public double getActualTemperature() throws RemoteException;
	public double getSettedTemperature() throws RemoteException;
	public void setSettedTemperature(double d) throws RemoteException;
	
	// LIGHT
	public boolean getLightState(int room) throws RemoteException;
	public void setLightState(int room, boolean b) throws RemoteException;
	
	// SHUTTER
	public boolean getShutterState(int room) throws RemoteException;
	public void setShutterState(int room, boolean b) throws RemoteException;
	
	// SPRINKLER
	public boolean getSprinklerState() throws RemoteException;
	public void setSprinklerState(boolean b) throws RemoteException;
	public int getDutyTime() throws RemoteException;
	public void setDutyTime(int i) throws RemoteException;
	public String getActivationTime() throws RemoteException;
	public void setActivationTime(int h, int m) throws RemoteException;
}
