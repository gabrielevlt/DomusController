package domus.server;
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RemoteDomusInterface extends Remote{
	
	// THERMOSTAT
	boolean getThermostatState() throws RemoteException;
	double getActualTemperature() throws RemoteException;
	double getSettedTemperature() throws RemoteException;
	void setSettedTemperature(double d) throws RemoteException;
	
	// LIGHT
	boolean getLightState() throws RemoteException;
	void setLightState(boolean b) throws RemoteException;
	
	// SHUTTER
	boolean getShutterState() throws RemoteException;
	void setShutterState(boolean b) throws RemoteException;
	
	// SPRINKLER
	boolean getSprinklerState() throws RemoteException;
	void setSprinklerState(boolean b) throws RemoteException;
	int getDutyTime() throws RemoteException;
	void setDutyTime(int i) throws RemoteException;
}
