(define (problem calendar-problem)
  (:domain calendar-scheduling)
  (:objects 
    heather nicholas zachary - agent
    9:00-9:30 9:30-10:00 10:00-10:30 10:30-11:00 11:00-11:30 
    11:30-12:00 12:00-12:30 12:30-13:00 13:00-13:30 13:30-14:00 
    14:00-14:30 14:30-15:00 15:00-15:30 15:30-16:00 16:00-16:30 16:30-17:00 - time)
  (:init 
    (available heather 9:30-10:00) (available heather 10:00-10:30)
    (available heather 11:00-11:30) (available heather 11:30-12:00) 
    (available heather 12:00-12:30) (available heather 14:00-14:30) 
    (available heather 15:00-15:30) (available heather 15:30-16:00) 
    (available heather 16:30-17:00)
    (available nicholas 9:00-9:30) (available nicholas 9:30-10:00)
    (available nicholas 10:00-10:30) (available nicholas 10:30-11:00)
    (available nicholas 11:00-11:30) (available nicholas 11:30-12:00)
    (available nicholas 12:00-12:30) (available nicholas 12:30-13:00)
    (available nicholas 13:00-13:30) (available nicholas 13:30-14:00)
    (available nicholas 14:00-14:30) (available nicholas 14:30-15:00)
    (available nicholas 15:00-15:30) (available nicholas 15:30-16:00)
    (available nicholas 16:00-16:30) (available nicholas 16:30-17:00)
    (available zachary 10:30-11:00) (available zachary 12:00-12:30)
    (available zachary 14:00-14:30)
    (available zachary 14:30-15:00)
  )
  (:goal 
    (and (meeting-scheduled heather)
         (meeting-scheduled nicholas)
         (meeting-scheduled zachary)
         (preference-met zachary))
  )
)