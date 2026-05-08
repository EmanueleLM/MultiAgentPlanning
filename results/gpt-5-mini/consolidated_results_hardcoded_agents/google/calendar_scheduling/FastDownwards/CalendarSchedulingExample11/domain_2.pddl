(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot mtg)
  (:predicates
    ; participant p is free during slot s
    (free ?p - person ?s - slot)
    ; ordered successor relation between consecutive slots
    (next ?s1 - slot ?s2 - slot)
    ; meeting m has been scheduled
    (scheduled ?m - mtg)
    ; meeting m is scheduled at slot s
    (scheduled-at ?m - mtg ?s - slot)
    ; precomputed intersection: all required participants are free at slot s
    (free-all ?s - slot)
  )

  ; Schedule action: schedule a meeting at a slot that is declared free-all.
  ; Preconditions ensure the meeting is not already scheduled and the chosen slot is valid.
  (:action schedule
    :parameters (?m - mtg ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (free-all ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
    )
  )
)