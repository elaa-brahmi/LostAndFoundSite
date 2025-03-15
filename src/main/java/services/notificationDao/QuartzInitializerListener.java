package services.notificationDao;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
//Purpose: Ensures the scheduler starts when the application is deployed.
//How it Works:
//Listens for the server startup event.
//Automatically starts QuartzScheduler.
//Ensures that the match-checking job is triggered periodically.

//Ensures that Quartz starts automatically when the server starts.
@WebListener
public class QuartzInitializerListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("🚀 Starting Quartz Scheduler...");
        QuartzScheduler.startQuartzScheduler();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("🛑 Stopping Quartz Scheduler...");
    }
}
