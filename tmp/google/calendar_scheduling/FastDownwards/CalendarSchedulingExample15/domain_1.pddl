(define (domain multiagent-meet-scheduler)
  (:requirements :typing)
  (:types person slot)

  (:predicates
    (joyce-available ?s - slot)
    (christine-available ?s - slot)
    (alexander-available ?s - slot)
    (meeting_at_joyce_christine_alexander ?s - slot)
  )

  (:action schedule_meeting
     :parameters (?s - slot)
     :precondition (and (joyce-available ?s)
                        (christine-available ?s)
                        (alexander-available ?s)
                        (not (meeting_at_joyce_christine_alexander ?s)))
     :effect (and (not (joyce-available ?s))
                  (not (christine-available ?s))
                  (not (alexander-available ?s))
                  (meeting_at_joyce_christine_alexander ?s))
  )
)