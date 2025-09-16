(define (problem meet_monday)
  (:domain meeting-scheduler)

  (:objects
     Heather Nicholas Zachary - person
     t0930_1000 t1000_1030 t1100_1130 t1130_1200 t1200_1230 t1230_1300
     t1400_1430 t1500_1530 t1530_1600 t1630_1700 - time
  )

  (:init
     ;; Heather's free slots
     (free_heather t0930_1000)
     (free_heather t1000_1030)
     (free_heather t1100_1130)
     (free_heather t1130_1200)
     (free_heather t1200_1230)
     (free_heather t1230_1300)
     (free_heather t1400_1430)
     (free_heather t1500_1530)
     (free_heather t1530_1600)
     (free_heather t1630_1700)

     ;; Nicholas's free slots
     (free_nicholas t0930_1000)
     (free_nicholas t1000_1030)
     (free_nicholas t1100_1130)
     (free_nicholas t1130_1200)
     (free_nicholas t1200_1230)
     (free_nicholas t1230_1300)
     (free_nicholas t1400_1430)
     (free_nicholas t1500_1530)
     (free_nicholas t1530_1600)
     (free_nicholas t1630_1700)

     ;; Zachary's free slots
     (free_zachary t0930_1000)
     (free_zachary t1000_1030)
     (free_zachary t1100_1130)
     (free_zachary t1130_1200)
     (free_zachary t1200_1230)
     (free_zachary t1230_1300)
     (free_zachary t1400_1430)
     (free_zachary t1500_1530)
     (free_zachary t1530_1600)
     (free_zachary t1630_1700)
  )
  ;; The goal is existentially satisfied by scheduling at any one of the allowed slots.
  (:goal (or
     (meeting_at t0930_1000)
     (meeting_at t1000_1030)
     (meeting_at t1100_1130)
     (meeting_at t1130_1200)
     (meeting_at t1200_1230)
     (meeting_at t1230_1300)
     (meeting_at t1400_1430)
     (meeting_at t1500_1530)
     (meeting_at t1530_1600)
     (meeting_at t1630_1700)
  ))
)