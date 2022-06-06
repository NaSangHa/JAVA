package com.study.jsp;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocketendpoint")
public class WsServer
{
	private static final java.util.Set<Session> sessions = 
			java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());
	
	
	@OnOpen
	public void onOpen(Session session)
	{
		System.out.println("Open session id : " + session.getId());
		
		try
		{
			final Basic basic = session.getBasicRemote();
			basic.sendText("ㅎ채팅방에 입장하였습니다.");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		sessions.add(session);
	}
	
	@OnClose
	public void onClose(Session session)
	{
		System.out.println("Session " + session.getId() + " has ended");
		sessions.remove(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session)
	{
		System.out.println("Message from " + session.getId() + " : " + message);
		try
		{
			final Basic basic = session.getBasicRemote();
			basic.sendText("나" + message);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		sendAllSessionToMessage(session, message);
	}
	
	private void sendAllSessionToMessage(Session self, String message)
	{
		try
		{
			for(Session session : WsServer.sessions)
			{
				if(! self.getId().equals(session.getId()))
				{						
					session.getBasicRemote().sendText("너" + message);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@OnError
	public void onError( Throwable e, Session session)
	{
		
	}
			
}
