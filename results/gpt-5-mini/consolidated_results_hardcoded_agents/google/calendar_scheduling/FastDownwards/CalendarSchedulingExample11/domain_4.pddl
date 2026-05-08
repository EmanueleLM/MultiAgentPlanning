(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot mtg)

  (:predicates
    (free ?p - person ?s - slot)        ; participant is free during slot
    (next ?s1 - slot ?s2 - slot)        ; ordered successor relation between consecutive slots
    (scheduled ?m - mtg)                ; meeting has been scheduled
    (scheduled-at ?m - mtg ?s - slot)   ; meeting is scheduled at slot
    (meeting-for ?m - mtg ?p - person)  ; meeting m includes participant p
    (occupied ?p - person ?s - slot)    ; participant p is occupied at slot s by the scheduled meeting
    (distinct ?p1 - person ?p2 - person) ; auxiliary relation: two distinct person objects
  )

  ;; Schedule action: schedule a single-slot meeting.
  ;; Parameters: meeting, chosen slot, and the three participant objects.
  ;; Preconditions require the meeting is not yet scheduled, the three person
  ;; parameters are distinct, each is declared as a participant of the meeting,
  ;; and each is free at the chosen slot.
  ;; Effects mark the meeting scheduled, record the scheduled slot, mark each
  ;; participant occupied at that slot and remove their free fact for that slot.
  (:action schedule
    :parameters (?m - mtg ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (scheduled ?m))
      (meeting-for ?m ?p1)
      (meeting-for ?m ?p2)
      (meeting-for ?m ?p3)
      (distinct ?p1 ?p2)
      (distinct ?p1 ?p3)
      (distinct ?p2 ?p3)
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
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )
)