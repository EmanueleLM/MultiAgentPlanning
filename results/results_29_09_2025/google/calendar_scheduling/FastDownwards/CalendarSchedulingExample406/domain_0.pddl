(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :existential-preconditions)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (free ?p - person ?s - slot)        ; participant is available in that slot
    (required ?p - person)             ; participant must attend the meeting
    (chosen ?s - slot)                 ; a candidate slot has been chosen
    (attend ?p - person ?s - slot)     ; participant p attends meeting in slot s
    (scheduled ?s - slot)              ; meeting finalized at slot s
  )

  ; choose a candidate slot for the meeting (only if no scheduled slot exists yet)
  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and (slot ?s)
                       (not (exists (?x - slot) (scheduled ?x))))
    :effect (chosen ?s)
  )

  ; a participant joins the chosen slot (requires their availability)
  (:action join
    :parameters (?p - person ?s - slot)
    :precondition (and (chosen ?s) (free ?p ?s))
    :effect (attend ?p ?s)
  )

  ; confirm the meeting at the chosen slot once every required participant has joined
  (:action confirm
    :parameters (?s - slot)
    :precondition (and (chosen ?s)
                       (forall (?p - person)
                         (imply (required ?p) (attend ?p ?s))))
    :effect (and (scheduled ?s) (not (chosen ?s))))
)