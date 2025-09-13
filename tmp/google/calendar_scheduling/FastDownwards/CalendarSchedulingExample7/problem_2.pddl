(define (problem calendar-problem)
  (:domain calendar-scheduling)
  (:objects 
    heather nicholas zachary - agent
    9-9:30 9:30-10 10-10:30 10:30-11 11-11:30 11:30-12 12-12:30 12:30-1 1-1:30 1:30-2 2-2:30 2:30-3 3-3:30 3:30-4 4-4:30 4:30-5 - time)
  (:init 
    (available nicholas 9-9:30) (available zackary 10-10:30) (available zachary 11-11:30)
    ;; Add predicates for available times based on agent knowledge
  )
  (:goal 
    (and (meeting-scheduled heather)
         (meeting-scheduled nicholas)
         (meeting-scheduled zachary))
  )
)