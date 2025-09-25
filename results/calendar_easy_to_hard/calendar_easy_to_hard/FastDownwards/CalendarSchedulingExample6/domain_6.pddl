(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants thomas dylan jerry - person)
  (:predicates
    (available ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )

  (:action schedule_by_thomas
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan ?s) (available dylan ?s2)
      (available jerry ?s) (available jerry ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )

  (:action schedule_by_dylan
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan ?s) (available dylan ?s2)
      (available jerry ?s) (available jerry ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )

  (:action schedule_by_jerry
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan ?s) (available dylan ?s2)
      (available jerry ?s) (available jerry ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )
)