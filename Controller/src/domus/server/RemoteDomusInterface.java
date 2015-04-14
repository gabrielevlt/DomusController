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
	boolean getLightState(int room) throws RemoteException;
	void setLightState(int room, boolean b) throws RemoteException;
	
	// SHUTTER
	boolean getShutterState(int room) throws RemoteException;
	void setShutterState(int room, boolean b) throws RemoteException;
	
	// SPRINKLER
	boolean getSprinklerState() throws RemoteException;
	void setSprinklerState(boolean b) throws RemoteException;
	int getDutyTime() throws RemoteException;
	void setDutyTime(int i) throws RemoteException;
}
