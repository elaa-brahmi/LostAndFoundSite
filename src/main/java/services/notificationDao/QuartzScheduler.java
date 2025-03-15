package services.notificationDao;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
//How it Works:
//Initializes a Quartz Scheduler.
//Schedules MatchCheckJob to run every 4 hours.
//Ensures the job starts when the server starts.
public class QuartzScheduler {
    //Quartz calls the execute() method of MatchCheckJob every 4 hours.
    public static void startQuartzScheduler() {
        try {
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();

            // Define the job and tie it to the MatchCheckJob class
            JobDetail job = JobBuilder.newJob(MatchCheckJob.class)
                    .withIdentity("matchCheckJob", "group1")
                    .build();

            // Trigger the job every 4 hours
            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity("matchCheckTrigger", "group1")
                    .startNow()
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                            .withIntervalInHours(4)
                            .repeatForever())
                    .build();

            // Schedule the job
            scheduler.scheduleJob(job, trigger);

            System.out.println("✅ Quartz Scheduler started. Job will run every 4 hours.");
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
