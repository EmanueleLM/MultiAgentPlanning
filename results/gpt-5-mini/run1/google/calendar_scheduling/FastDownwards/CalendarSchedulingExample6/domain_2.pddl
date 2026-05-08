(define (domain meeting_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:constants thomas dylan jerry - person)
  (:predicates
    (available ?p - person ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (reserved ?p - person ?s1 - slot ?s2 - slot)
    (meeting_scheduled ?s1 - slot ?s2 - slot)
  )

  (:action reserve_thomas
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available thomas ?s1)
      (available thomas ?s2)
      (not (reserved thomas ?s1 ?s2))
    )
    :effect (and
      (reserved thomas ?s1 ?s2)
    )
  )

  (:action reserve_dylan
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available dylan ?s1)
      (available dylan ?s2)
      (not (reserved dylan ?s1 ?s2))
    )
    :effect (and
      (reserved dylan ?s1 ?s2)
    )
  )

  (:action reserve_jerry
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available jerry ?s1)
      (available jerry ?s2)
      (not (reserved jerry ?s1 ?s2))
    )
    :effect (and
      (reserved jerry ?s1 ?s2)
    )
  )

  (:action finalize_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (reserved thomas ?s1 ?s2)
      (reserved dylan ?s1 ?s2)
      (reserved jerry ?s1 ?s2)
      (not (meeting_scheduled ?s1 ?s2))
    )
    :effect (and
      (meeting_scheduled ?s1 ?s2)
    )
  )
)