(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time meeting)

  ; Predicates
  (:predicates
     (free ?p - person ?t - time)
     (meeting-scheduled ?t - time)
  )

  ; Agent 1 action: Thomas & Jerry
  (:action schedule-meeting-A1
     :parameters (?m - meeting ?t - time)
     :precondition (and (not (meeting-scheduled ?t))
                        (free Thomas ?t)
                        (free Jerry ?t))
     :effect (and (meeting-scheduled ?t)
                  (not (free Thomas ?t))
                  (not (free Jerry ?t)))
  )

  ; Agent 2 action: Dylan, Thomas, Jerry
  (:action schedule-meeting-A2
     :parameters (?t - time)
     :precondition (and (not (meeting-scheduled ?t))
                        (free Dylan ?t)
                        (free Thomas ?t)
                        (free Jerry ?t))
     :effect (and (meeting-scheduled ?t)
                  (not (free Dylan ?t))
                  (not (free Thomas ?t))
                  (not (free Jerry ?t)))
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