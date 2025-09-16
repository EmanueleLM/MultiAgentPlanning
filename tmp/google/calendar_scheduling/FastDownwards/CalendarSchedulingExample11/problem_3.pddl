(define (problem meeting-schedule-problem)
  (:domain scheduling-merge)
  (:init
     (free Alexander slot-0900-0930)
     (free Elizabeth slot-0900-0930)
     (free Walter slot-0900-0930)
  )
  (:goal
     (meeting-at slot-0900-0930)
  )
)