package domus.client;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import domus.server.RemoteDomusInterface;

public class Client {
	private RemoteDomusInterface rdi;

	/*
	 * Costruttore: crea l'oggetto remoto 
	 */
	public Client() {
		try {
			// NOME OGGETTO REMOTO
			String serviceName = "Domus";

			// STUB -> rdi rappresenta l'oggetto remoto
			Registry registry = LocateRegistry.getRegistry("ec2-52-11-250-213.us-west-2.compute.amazonaws.com");
			//Registry registry = LocateRegistry.getRegistry("localhost");
			rdi = (RemoteDomusInterface) registry.lookup(serviceName);

		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * THERMOSTAT
	 * 		-getThermostatState
	 * 		-setThermostatState
	 * 		-getActualTemperature
	 * 		-getSettedTemperature
	 * 		-setSettedTemperature
	 */
	public boolean getThermostatState() {
		try {
			return rdi.getThermostatState();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setThermostatState(boolean b) {
		try {
			rdi.setThermostatState(b);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public double getActualTemperature(){
		try {
			return rdi.getActualTemperature();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public double getSettedTemperature(){
		try {
			return rdi.getSettedTemperature();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public void setSettedTemperature(double d){
		try {
			rdi.setSettedTemperature(d);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * LIGHTING
	 * 		-getLightState
	 * 		-setLightState
	 */
	public boolean getLightState(int room) {
		try {
			return rdi.getLightState(room);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setLightState(int room, boolean b){
		try {
			rdi.setLightState(room, b);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * SHUTTERS
	 * 		-getShutterState
	 * 		-setShutterState
	 */
	public boolean getShutterState(int room) {
		try {
			return rdi.getShutterState(room);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setShutterState(int room, boolean b){
		try {
			rdi.setShutterState(room, b);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * SPRINKLER
	 * 		-getSprinklerState
	 * 		-setSprinklerState
	 * 		-getDutyTime
	 * 		-setDutyTime
	 * 		-getActivationTime
	 * 		-setActivationTime
	 */
	public boolean getSprinklerState() {
		try {
			return rdi.getSprinklerState();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setSprinklerState(boolean b){
		try {
			rdi.setSprinklerState(b);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public int getDutyTime() {
		try {
			return rdi.getDutyTime();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public void setDutyTime(int i){
		try {
			rdi.setDutyTime(i);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public String getActivationTime() {
		try {
			return rdi.getActivationTime();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public void setActivationTime(int h, int m) {
		try {
			rdi.setActivationTime(h,m);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	/*
	public boolean test() {
		boolean flag = true;
		try {
			System.out.print("\nRisposta server: " + rdi.getLightState(0) + "\n\n");
			flag = rdi.getLightState(0);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static void main(String[] args) {
		Client c = new Client();
		c.test();
		
	}*/

}