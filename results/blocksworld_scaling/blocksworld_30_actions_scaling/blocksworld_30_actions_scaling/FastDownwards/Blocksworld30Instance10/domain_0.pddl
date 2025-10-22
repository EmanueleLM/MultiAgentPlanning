(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (anyholding)
  )

  ;; Actions for agent_alpha
  (:action unstack-alpha
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty agent_alpha)
      (not (anyholding))
    )
    :effect (and
      (not (on ?x ?y))
      (holding agent_alpha ?x)
      (not (handempty agent_alpha))
      (clear ?y)
      (anyholding)
    )
  )

  (:action pickup-alpha
    :parameters (?x - block)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty agent_alpha)
      (not (anyholding))
    )
    :effect (and
      (not (ontable ?x))
      (holding agent_alpha ?x)
      (not (handempty agent_alpha))
      (anyholding)
    )
  )

  (:action putdown-alpha
    :parameters (?x - block)
    :precondition (holding agent_alpha ?x)
    :effect (and
      (ontable ?x)
      (not (holding agent_alpha ?x))
      (handempty agent_alpha)
      (clear ?x)
      (not (anyholding))
    )
  )

  (:action stack-alpha
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding agent_alpha ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (not (holding agent_alpha ?x))
      (handempty agent_alpha)
      (clear ?x)
      (not (anyholding))
    )
  )

  ;; Actions for agent_beta
  (:action unstack-beta
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty agent_beta)
      (not (anyholding))
    )
    :effect (and
      (not (on ?x ?y))
      (holding agent_beta ?x)
      (not (handempty agent_beta))
      (clear ?y)
      (anyholding)
    )
  )

  (:action pickup-beta
    :parameters (?x - block)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty agent_beta)
      (not (anyholding))
    )
    :effect (and
      (not (ontable ?x))
      (holding agent_beta ?x)
      (not (handempty agent_beta))
      (anyholding)
    )
  )

  (:action putdown-beta
    :parameters (?x - block)
    :precondition (holding agent_beta ?x)
    :effect (and
      (ontable ?x)
      (not (holding agent_beta ?x))
      (handempty agent_beta)
      (clear ?x)
      (not (anyholding))
    )
  )

  (:action stack-beta
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding agent_beta ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (not (holding agent_beta ?x))
      (handempty agent_beta)
      (clear ?x)
      (not (anyholding))
    )
  )
)