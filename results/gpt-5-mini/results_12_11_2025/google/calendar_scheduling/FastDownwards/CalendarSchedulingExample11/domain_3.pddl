(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot mtg)
  (:predicates
    (free ?p - person ?s - slot)        ; participant is free during slot
    (next ?s1 - slot ?s2 - slot)        ; ordered successor relation between consecutive slots
    (scheduled ?m - mtg)                ; meeting has been scheduled
    (scheduled-at ?m - mtg ?s - slot)   ; meeting is scheduled at slot
    (meeting-for ?m - mtg ?p - person)  ; meeting m includes participant p
    (occupied ?p - person ?s - slot)    ; participant p is occupied by the scheduled meeting at slot s
  )

  ;; Schedule action: schedule a meeting at one discrete slot.
  ;; This action requires the meeting to be defined for each participant
  ;; and each listed participant to be free at the chosen slot.
  ;; Effects mark the meeting scheduled and mark each participant occupied at that slot.
  (:action schedule
    :parameters (?m - mtg ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (scheduled ?m))
      (meeting-for ?m ?p1)
      (meeting-for ?m ?p2)
      (meeting-for ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      (occupied ?p1 ?s)
      (occupied ?p2 ?s)
      (occupied ?p3 ?s)
    )
  )
)