(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:constants theresa charles betty - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (proposed ?s - slot)
    (approved-charles ?s - slot)
    (approved-betty ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action propose-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free theresa ?s) (free theresa ?s2) (not (proposed ?s)))
    :effect (proposed ?s)
  )

  (:action approve-charles
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s) (next ?s ?s2) (free charles ?s) (free charles ?s2) (not (approved-charles ?s)))
    :effect (approved-charles ?s)
  )

  (:action approve-betty
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s) (next ?s ?s2) (free betty ?s) (free betty ?s2) (not (approved-betty ?s)))
    :effect (approved-betty ?s)
  )

  (:action finalize-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s) (approved-charles ?s) (approved-betty ?s) (next ?s ?s2) (free theresa ?s) (free theresa ?s2) (not (meeting-scheduled ?s)))
    :effect (meeting-scheduled ?s)
  )
)