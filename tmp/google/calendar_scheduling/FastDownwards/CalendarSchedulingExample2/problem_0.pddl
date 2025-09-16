(define (problem monday-meeting)
  (:domain multi-agent-meeting-scheduler)

  (:objects
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330
     t1400 t1430 t1500 t1530 t1600 t1630 - timeSlot)

  (:init
     ;; Roy's free slots (as per Agent 1)
     (free-roy t0930)
     (free-roy t1030)
     (free-roy t1130)
     (free-roy t1200)
     (free-roy t1300)
     (free-roy t1330)
     (free-roy t1400)
     (free-roy t1430)
     (free-roy t1500)
     (free-roy t1530)
     (free-roy t1600)
     (free-roy t1630)

     ;; Kathryn's free slots (as per Agent 2)
     (free-kathryn t0900)
     (free-kathryn t1000)
     (free-kathryn t1030)
     (free-kathryn t1100)
     (free-kathryn t1130)
     (free-kathryn t1200)
     (free-kathryn t1230)
     (free-kathryn t1300)
     (free-kathryn t1330)
     (free-kathryn t1400)
     (free-kathryn t1430)
     (free-kathryn t1500)
     (free-kathryn t1530)
     (free-kathryn t1600)

     ;; Amy's free slots (as per Agent 3, hard constraint)
     (free-amy t1430)
     (free-amy t1600)
  )

  (:goal
     (and
        (scheduled-roy t1430)
        (scheduled-kathryn t1430)
        (scheduled-amy t1430)
     )
  )
)