(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time meeting)

  ; Predicates
  (:predicates
     (free ?p - person ?t - time)
     (meeting-scheduled ?t - time)
  )

  ; Agent 1 action: thomas & jerry
  (:action schedule-meeting-A1
     :parameters (?m - meeting ?t - time)
     :precondition (and (not (meeting-scheduled ?t))
                        (free thomas ?t)
                        (free jerry ?t))
     :effect (and (meeting-scheduled ?t)
                  (not (free thomas ?t))
                  (not (free jerry ?t)))
  )

  ; Agent 2 action: dylan, thomas, jerry
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

  ; Agent 3 action: any two attendees (keeps a distinct action)
  (:action schedule-meeting-A3
     :parameters (?p1 - person ?p2 - person ?ts - time)
     :precondition (and (not (meeting-scheduled ?ts))
                        (free ?p1 ?ts)
                        (free ?p2 ?ts))
     :effect (and (meeting-scheduled ?ts))
  )
)