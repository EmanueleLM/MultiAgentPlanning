(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (attending ?p - person ?s - slot)
    (scheduled ?s - slot)
  )

  ;; Distinct attend actions per agent (agent actions kept separate)
  (:action attend-raymond
    :parameters (?s - slot)
    :precondition (available raymond ?s)
    :effect (attending raymond ?s)
  )

  (:action attend-billy
    :parameters (?s - slot)
    :precondition (available billy ?s)
    :effect (attending billy ?s)
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (available donald ?s)
    :effect (attending donald ?s)
  )

  ;; Confirm meeting when all participants are attending the same slot
  (:action confirm
    :parameters (?s - slot)
    :precondition (and (attending raymond ?s) (attending billy ?s) (attending donald ?s) (not (scheduled ?s)))
    :effect (scheduled ?s)
  )
)