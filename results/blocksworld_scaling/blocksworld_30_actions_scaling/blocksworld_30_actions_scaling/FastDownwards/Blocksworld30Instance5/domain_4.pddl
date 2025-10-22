(define (domain blocksworld_with_timed_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (at-step ?s - step)
    (step2 ?s - step ?snext - step ?x - block ?y - block ?ag - agent)
    (step1 ?s - step ?x - block ?ag - agent ?snext - step)
  )

  (:action unstack
    :parameters (?x - block ?y - block ?ag - agent ?s - step ?snext - step)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?ag) (at-step ?s) (step2 ?s ?snext ?x ?y ?ag))
    :effect (and (not (on ?x ?y)) (clear ?y) (holding ?ag ?x) (not (handempty ?ag)) (not (at-step ?s)) (at-step ?snext))
  )

  (:action stack
    :parameters (?x - block ?y - block ?ag - agent ?s - step ?snext - step)
    :precondition (and (holding ?ag ?x) (clear ?y) (at-step ?s) (step2 ?s ?snext ?x ?y ?ag))
    :effect (and (not (holding ?ag ?x)) (handempty ?ag) (on ?x ?y) (not (clear ?y)) (clear ?x) (not (at-step ?s)) (at-step ?snext))
  )

  (:action pickup
    :parameters (?x - block ?ag - agent ?s - step ?snext - step)
    :precondition (and (on-table ?x) (clear ?x) (handempty ?ag) (at-step ?s) (step1 ?s ?x ?ag ?snext))
    :effect (and (not (on-table ?x)) (holding ?ag ?x) (not (handempty ?ag)) (not (at-step ?s)) (at-step ?snext))
  )

  (:action putdown
    :parameters (?x - block ?ag - agent ?s - step ?snext - step)
    :precondition (and (holding ?ag ?x) (at-step ?s) (step1 ?s ?x ?ag ?snext))
    :effect (and (not (holding ?ag ?x)) (handempty ?ag) (on-table ?x) (clear ?x) (not (at-step ?s)) (at-step ?snext))
  )
)