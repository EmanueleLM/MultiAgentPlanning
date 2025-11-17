(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types meeting slot person)

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot ?s2 - slot)
    (next ?s - slot ?s2 - slot)
    (free ?p - person ?s - slot)
  )

  (:action choose-start-slot
    :parameters (?m - meeting ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?s2)
      ;; All participants must be free in both consecutive slots
      (free Theresa ?s) (free Theresa ?s2)
      (free Charles ?s) (free Charles ?s2)
      (free Betty ?s) (free Betty ?s2)
    )
    :effect (and
      ;; Mark meeting scheduled and consume the free slots so occupancy is contiguous and irreversible
      (not (unscheduled ?m))
      (scheduled ?m ?s ?s2)
      (not (free Theresa ?s)) (not (free Theresa ?s2))
      (not (free Charles ?s)) (not (free Charles ?s2))
      (not (free Betty ?s)) (not (free Betty ?s2))
    )
  )
)