(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (available ?p - person ?s - slot)   ; participant p is available at slot s
    (scheduled ?s - slot)               ; meeting scheduled at slot s
    (meeting-scheduled)                 ; global flag that meeting was scheduled
  )

  ;; Schedule the 30-minute meeting at a single discrete slot.
  ;; Precondition: meeting not already scheduled and every declared person
  ;; must be available at that slot (forall allows a general check).
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and (not (meeting-scheduled))
                       (forall (?p - person) (available ?p ?s)))
    :effect (and (meeting-scheduled)
                 (scheduled ?s))
  )
)