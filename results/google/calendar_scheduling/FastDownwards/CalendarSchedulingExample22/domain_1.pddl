(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants theresa charles betty - agent)
  (:predicates
    (free ?a - agent ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (claimed-theresa ?s - slot)
    (claimed-charles ?s - slot)
    (claimed-betty ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action claim-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free theresa ?s) (free theresa ?s2) (next ?s ?s2))
    :effect (claimed-theresa ?s)
  )

  (:action claim-charles
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free charles ?s) (free charles ?s2) (next ?s ?s2))
    :effect (claimed-charles ?s)
  )

  (:action claim-betty
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free betty ?s) (free betty ?s2) (next ?s ?s2))
    :effect (claimed-betty ?s)
  )

  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and (claimed-theresa ?s) (claimed-charles ?s) (claimed-betty ?s))
    :effect (meeting-scheduled ?s)
  )
)