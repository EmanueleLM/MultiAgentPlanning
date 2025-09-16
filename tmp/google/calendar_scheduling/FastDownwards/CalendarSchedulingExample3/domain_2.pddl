(define (domain multi-party-meeting-domain)
  (:requirements :typing :strips)
  (:types
    person slot
  )

  (:predicates
    (free-arthur ?s - slot)
    (free-michael ?s - slot)
    (free-samantha ?s - slot)

    (scheduled-arthur ?s - slot)
    (scheduled-michael ?s - slot)
    (scheduled-samantha ?s - slot)

    (meeting-at ?s - slot)
  )

  (:action schedule-arthur-at-slot
     :parameters (?s - slot)
     :precondition (and (free-arthur ?s)
                        (not (scheduled-arthur ?s)))
     :effect (and (not (free-arthur ?s))
                  (scheduled-arthur ?s)
                  (meeting-at ?s))
  )

  (:action schedule-michael-at-slot
     :parameters (?s - slot)
     :precondition (and (free-michael ?s)
                        (not (scheduled-michael ?s)))
     :effect (and (not (free-michael ?s))
                  (scheduled-michael ?s)
                  (meeting-at ?s))
  )

  (:action schedule-samantha-at-slot
     :parameters (?s - slot)
     :precondition (and (free-samantha ?s)
                        (not (scheduled-samantha ?s)))
     :effect (and (not (free-samantha ?s))
                  (scheduled-samantha ?s)
                  (meeting-at ?s))
  )
)