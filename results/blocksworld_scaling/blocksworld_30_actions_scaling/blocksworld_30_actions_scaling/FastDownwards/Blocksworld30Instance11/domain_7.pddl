(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (anyholding)
    (agent-actor ?a - agent)
    (done ?s - step)
    (timestamp ?a - agent ?s - step)
  )

  (:action unstack
    :parameters (?a - agent ?x - block ?y - block ?s1 - step ?s2 - step)
    :precondition (and (agent-actor ?a) (on ?x ?y) (clear ?x) (handempty ?a) (not (anyholding)) (timestamp ?a ?s1))
    :effect (and (not (on ?x ?y)) (holding ?a ?x) (clear ?y) (not (clear ?x)) (not (handempty ?a)) (anyholding) (not (timestamp ?a ?s1)) (timestamp ?a ?s2) (done ?s2))
  )

  (:action stack
    :parameters (?a - agent ?x - block ?y - block ?s1 - step ?s2 - step)
    :precondition (and (agent-actor ?a) (holding ?a ?x) (clear ?y) (timestamp ?a ?s1))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding ?a ?x)) (handempty ?a) (not (anyholding)) (not (timestamp ?a ?s1)) (timestamp ?a ?s2) (done ?s2))
  )

  (:action pickup
    :parameters (?a - agent ?x - block ?s1 - step ?s2 - step)
    :precondition (and (agent-actor ?a) (ontable ?x) (clear ?x) (handempty ?a) (not (anyholding)) (timestamp ?a ?s1))
    :effect (and (not (ontable ?x)) (holding ?a ?x) (not (clear ?x)) (not (handempty ?a)) (anyholding) (not (timestamp ?a ?s1)) (timestamp ?a ?s2) (done ?s2))
  )

  (:action putdown
    :parameters (?a - agent ?x - block ?s1 - step ?s2 - step)
    :precondition (and (agent-actor ?a) (holding ?a ?x) (timestamp ?a ?s1))
    :effect (and (ontable ?x) (clear ?x) (handempty ?a) (not (holding ?a ?x)) (not (anyholding)) (not (timestamp ?a ?s1)) (timestamp ?a ?s2) (done ?s2))
  )
)