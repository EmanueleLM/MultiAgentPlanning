(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)        ; participant ?p is free for the 1h interval starting at ?s
    (selected ?s - slot)               ; a slot has been selected
    (acked ?p - person ?s - slot)      ; participant ?p has acknowledged/accepted slot ?s
  )

  (:action select-slot
    :parameters (?s - slot)
    :precondition ()
    :effect (selected ?s)
  )

  ; Each participant has a distinct ack action (same action schema can be used for any participant)
  (:action ack
    :parameters (?p - person ?s - slot)
    :precondition (and (selected ?s) (free ?p ?s))
    :effect (acked ?p ?s)
  )
)