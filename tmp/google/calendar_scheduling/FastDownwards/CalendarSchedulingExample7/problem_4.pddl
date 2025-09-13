(define (problem calendar-problem)
  (:domain calendar-scheduling)
  (:objects 
    heather nicholas zachary - agent
    9-9:30 9:30-10 10-10:30 10:30-11 11-11:30 11:30-12 12-12:30 12:30-1 1-1:30 1:30-2 2-2:30 2:30-3 3-3:30 3:30-4 4-4:30 4:30-5 - time)
  (:init 
    ;; Heather's availability
    (available heather 9:30-10) (available heather 10-10:30) (available heather 11-11:30)
    (available heather 11:30-12) (available heather 12-12:30)
    (available heather 14-14:30) (available heather 15-15:30)
    (available heather 15:30-16) (available heather 16:30-17)
    ;; Nicholas has no meetings, available entire day
    (available nicholas 9-9:30) (available nicholas 9:30-10)
    (available nicholas 10-10:30) (available nicholas 10:30-11)
    (available nicholas 11-11:30) (available nicholas 11:30-12)
    (available nicholas 12-12:30) (available nicholas 12:30-1)
    (available nicholas 1-1:30) (available nicholas 1:30-2)
    (available nicholas 2-2:30) (available nicholas 2:30-3)
    (available nicholas 3-3:30) (available nicholas 3:30-4)
    (available nicholas 4-4:30) (available nicholas 4:30-5)
    ;; Zachary's availability before 14:00
    (available zachary 10:30-11) (available zachary 12-12:30) 
  )
  (:goal 
    (and (meeting-scheduled heather)
         (meeting-scheduled nicholas)
         (meeting-scheduled zachary))
  )
)