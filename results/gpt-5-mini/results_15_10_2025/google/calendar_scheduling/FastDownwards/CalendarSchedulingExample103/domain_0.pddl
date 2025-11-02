(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)    ; agent is available at slot (30-min)
    (available-all ?s - slot)           ; all participants are available at slot
    (scheduled ?s - slot)               ; slot has been scheduled
    (meeting-scheduled)                 ; a meeting has been scheduled
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (available-all ?s)
    :effect (and (scheduled ?s) (meeting-scheduled))
  )
)