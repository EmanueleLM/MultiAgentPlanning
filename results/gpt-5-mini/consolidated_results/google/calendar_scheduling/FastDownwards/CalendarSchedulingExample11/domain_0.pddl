(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot meeting)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (meeting ?m - meeting)
    (next ?s1 - slot ?s2 - slot)           ; immediate successor relation between slots
    (free ?p - person ?s - slot)           ; participant p is free at slot s
    (free-all ?s - slot)                   ; all required participants are free at slot s
    (scheduled ?m - meeting)               ; meeting has been scheduled
    (scheduled-at ?m - meeting ?s - slot)  ; meeting is scheduled at slot s
  )

  ; Schedule action: schedule a meeting at a slot that is declared free-all.
  ; The action is only applicable if the meeting is not yet scheduled and the slot is marked free-all.
  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (not (scheduled ?m))
      (free-all ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
    )
  )
)