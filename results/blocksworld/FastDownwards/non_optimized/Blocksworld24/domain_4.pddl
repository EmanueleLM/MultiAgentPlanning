(define (domain multi_agent_blocks)
  (:requirements :strips :typing)
  (:types block agent)
  (:constants vowel_agent consonant_agent orchestrator - agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (is-vowel ?x - block)
    (is-consonant ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (agent-vowel ?a - agent)
    (agent-consonant ?a - agent)
  )

  (:action vowel-unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-vowel ?a) (is-vowel ?x) (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action vowel-stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-vowel ?a) (is-vowel ?x) (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )

  (:action vowel-pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-vowel ?a) (is-vowel ?x) (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action vowel-putdown
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-vowel ?a) (is-vowel ?x) (holding ?a ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )

  (:action consonant-unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-consonant ?a) (is-consonant ?x) (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action consonant-stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-consonant ?a) (is-consonant ?x) (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )

  (:action consonant-pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-consonant ?a) (is-consonant ?x) (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action consonant-putdown
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-consonant ?a) (is-consonant ?x) (holding ?a ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )
)