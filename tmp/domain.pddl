(define (domain unlock-environment)
  (:requirements :strips :typing)
  (:types agent switch door)
  (:predicates 
    (door-locked)
    (switch-pressed ?s - switch)
    (acting ?a - agent)
    (can-press ?a - agent ?s - switch)
    (door-unlocked ?d - door))

  (:action press-switch
    :parameters (?a - agent ?s - switch)
    :precondition (and (acting ?a) (can-press ?a ?s) (door-locked) (not (switch-pressed ?s)))
    :effect (switch-pressed ?s))

  (:action unlock-door
    :parameters (?d - door ?s1 ?s2 ?s3 - switch)
    :precondition (and (switch-pressed ?s1) (switch-pressed ?s2) (switch-pressed ?s3))
    :effect (and (not (door-locked)) (door-unlocked ?d)))
)