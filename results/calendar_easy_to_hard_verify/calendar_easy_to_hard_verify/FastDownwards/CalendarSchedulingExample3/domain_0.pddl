(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free-arthur ?s - slot)
    (free-michael ?s - slot)
    (free-samantha ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
  )

  ;; Schedule a 60-minute meeting starting at ?s1 and occupying ?s1 and ?s2 (must be consecutive)
  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free-arthur ?s1) (free-arthur ?s2)
      (free-michael ?s1) (free-michael ?s2)
      (free-samantha ?s1) (free-samantha ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (not (free-arthur ?s1)) (not (free-arthur ?s2))
      (not (free-michael ?s1)) (not (free-michael ?s2))
      (not (free-samantha ?s1)) (not (free-samantha ?s2))
    )
  )
)