(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time)

  (:predicates
     (free ?p - person ?t - time)
     (meeting-scheduled ?t - time)
  )

  (:action schedule-meeting-A1
     :parameters (?t - time)
     :precondition (and (not (meeting-scheduled ?t))
                        (free thomas ?t)
                        (free jerry ?t))
     :effect (and (meeting-scheduled ?t)
                  (not (free thomas ?t))
                  (not (free jerry ?t)))
  )

  (:action schedule-meeting-A2
     :parameters (?t - time)
     :precondition (and (not (meeting-scheduled ?t))
                        (free dylan ?t)
                        (free thomas ?t)
                        (free jerry ?t))
     :effect (and (meeting-scheduled ?t)
                  (not (free dylan ?t))
                  (not (free thomas ?t))
                  (not (free jerry ?t)))
  )

  (:action schedule-meeting-A3
     :parameters (?p1 - person ?p2 - person ?ts - time)
     :precondition (and (not (meeting-scheduled ?ts))
                        (free ?p1 ?ts)
                        (free ?p2 ?ts))
     :effect (and (meeting-scheduled ?ts)
                  (not (free ?p1 ?ts))
                  (not (free ?p2 ?ts)))
  )
)