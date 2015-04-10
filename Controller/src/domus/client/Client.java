package domus.client;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import domus.server.RemoteDomusInterface;

public class Client {
	private RemoteDomusInterface rdi;

	public String test() {
		return "3000 xd";
	}
	/*
	 * Costruttore: crea l'oggetto remoto 
	 */
	public Client() {
		try {
			// NOME OGGETTO REMOTO
			String serviceName = "Domus";

			// STUB -> rdi rappresenta l'oggetto remoto
			//Registry registry = LocateRegistry.getRegistry("54.69.96.227",1099);
			Registry registry = LocateRegistry.getRegistry("localhost");
			rdi = (RemoteDomusInterface) registry.lookup(serviceName);

		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * THERMOSTAT
	 * 		-getTheromastatState
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
	public boolean getLightState() {
		try {
			return rdi.getLightState();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setLightState(boolean b){
		try {
			rdi.setLightState(b);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * SHUTTERS
	 * 		-getShutterState
	 * 		-setShutterState
	 */
	public boolean getShutterState() {
		try {
			return rdi.getShutterState();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void setShutterState(boolean b){
		try {
			rdi.setShutterState(b);
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
	
	
	
	
	
	
	
	
	
	/*
	public boolean test() {
		boolean flag = true;
		try {
			System.out.print("\nRisposta server: " + rdi.getLightState() + "\n\n");
			flag = rdi.getLightState();
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