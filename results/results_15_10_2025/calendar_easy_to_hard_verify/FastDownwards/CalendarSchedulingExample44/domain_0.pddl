(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person half)
  ;; participants declared as domain constants so schedule action can require them explicitly
  (:constants kayla sandra ryan kathleen walter arthur heather - person)

  (:predicates
    (free ?p - person ?h - half)                ; person p is free during half-slot h
    (attended ?p - person ?s - half)            ; person p has committed to attend meeting starting at s
    (next ?h1 - half ?h2 - half)                ; h2 is the next half-slot after h1
    (meeting-scheduled ?s - half)               ; meeting scheduled starting at half-slot s
  )

  ;; A participant can "attend" at a start s if they are free at s and at the next half-slot (meeting is 60 minutes)
  (:action attend
    :parameters (?p - person ?s - half ?s2 - half)
    :precondition (and (free ?p ?s) (next ?s ?s2) (free ?p ?s2))
    :effect (attended ?p ?s)
  )

  ;; The schedule action requires every participant to have attended the meeting at start ?s
  ;; (Explicitly lists participants as hard preconditions.)
  (:action schedule
    :parameters (?s - half)
    :precondition (and
      (attended kayla ?s)
      (attended sandra ?s)
      (attended ryan ?s)
      (attended kathleen ?s)
      (attended walter ?s)
      (attended arthur ?s)
      (attended heather ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)