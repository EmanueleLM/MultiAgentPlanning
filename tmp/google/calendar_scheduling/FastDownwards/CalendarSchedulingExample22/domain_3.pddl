(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time)

  (:constants theresa charles betty - person
              t1030 t1100 - time)

  (:predicates
     (free ?p - person ?t - time)
     (consecutive ?t1 - time ?t2 - time)
     (meeting_scheduled ?t1 - time ?t2 - time)
  )

  (:action schedule-meeting
     :parameters (?t1 - time ?t2 - time)
     :precondition (and (consecutive ?t1 ?t2)
                        (free theresa ?t1) (free theresa ?t2)
                        (free charles ?t1) (free charles ?t2)
                        (free betty ?t1) (free betty ?t2))
     :effect (meeting_scheduled ?t1 ?t2)
  )
)