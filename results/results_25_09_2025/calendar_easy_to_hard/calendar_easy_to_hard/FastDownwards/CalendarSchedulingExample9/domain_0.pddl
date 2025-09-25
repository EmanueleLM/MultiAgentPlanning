(define (domain meeting_multia)
  (:requirements :strips)
  (:predicates
    (free ?person ?slot)                ; person is free at slot
    (scheduled ?slot)                   ; slot has been scheduled
    (meeting-scheduled ?p1 ?p2 ?slot)   ; meeting scheduled for p1 and p2 at slot
  )

  ;; Action offered by agent "diane"
  (:action diane-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free deborah ?slot))
    :effect (and
              (scheduled ?slot)
              (meeting-scheduled diane deborah ?slot)
              (not (free diane ?slot))
              (not (free deborah ?slot))
            )
  )

  ;; Action offered by agent "kelly" (distinct action name)
  (:action kelly-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free deborah ?slot))
    :effect (and
              (scheduled ?slot)
              (meeting-scheduled diane deborah ?slot)
              (not (free diane ?slot))
              (not (free deborah ?slot))
            )
  )

  ;; Action offered by agent "deborah"
  (:action deborah-schedule
    :parameters (?slot)
    :precondition (and (free diane ?slot) (free deborah ?slot))
    :effect (and
              (scheduled ?slot)
              (meeting-scheduled diane deborah ?slot)
              (not (free diane ?slot))
              (not (free deborah ?slot))
            )
  )
)