(define (domain calendarschedulingexample26)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (has-next ?s - slot)
    (allowed-start ?s - slot)
    (chosen ?s - slot)
    (chosen-set)
    (attended ?p - participant)
  )

  (:action choose_start
    :parameters (?s - slot)
    :precondition (and
      (allowed-start ?s)
      (has-next ?s)
      (not (chosen-set))
    )
    :effect (and
      (chosen ?s)
      (chosen-set)
    )
  )

  (:action attend
    :parameters (?p - participant ?s - slot ?s2 - slot)
    :precondition (and
      (chosen ?s)
      (next ?s ?s2)
      (free ?p ?s)
      (free ?p ?s2)
      (not (attended ?p))
    )
    :effect (attended ?p)
  )
)