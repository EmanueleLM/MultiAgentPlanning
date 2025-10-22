(define (domain blocksworld_agents)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Actions performed by agent_alpha
  (:action pickup-alpha
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent_alpha))
    :effect (and
              (not (ontable ?b))
              (not (handempty agent_alpha))
              (holding agent_alpha ?b)
              (not (clear ?b))
            )
  )

  (:action putdown-alpha
    :parameters (?b - block)
    :precondition (and (holding agent_alpha ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty agent_alpha)
              (not (holding agent_alpha ?b))
            )
  )

  (:action unstack-alpha
    :parameters (?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty agent_alpha))
    :effect (and
              (holding agent_alpha ?b)
              (clear ?under)
              (not (on ?b ?under))
              (not (handempty agent_alpha))
              (not (clear ?b))
            )
  )

  (:action stack-alpha
    :parameters (?b - block ?under - block)
    :precondition (and (holding agent_alpha ?b) (clear ?under))
    :effect (and
              (on ?b ?under)
              (clear ?b)
              (handempty agent_alpha)
              (not (holding agent_alpha ?b))
              (not (clear ?under))
            )
  )

  ;; Actions performed by agent_beta
  (:action pickup-beta
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent_beta))
    :effect (and
              (not (ontable ?b))
              (not (handempty agent_beta))
              (holding agent_beta ?b)
              (not (clear ?b))
            )
  )

  (:action putdown-beta
    :parameters (?b - block)
    :precondition (and (holding agent_beta ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty agent_beta)
              (not (holding agent_beta ?b))
            )
  )

  (:action unstack-beta
    :parameters (?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty agent_beta))
    :effect (and
              (holding agent_beta ?b)
              (clear ?under)
              (not (on ?b ?under))
              (not (handempty agent_beta))
              (not (clear ?b))
            )
  )

  (:action stack-beta
    :parameters (?b - block ?under - block)
    :precondition (and (holding agent_beta ?b) (clear ?under))
    :effect (and
              (on ?b ?under)
              (clear ?b)
              (handempty agent_beta)
              (not (holding agent_beta ?b))
              (not (clear ?under))
            )
  )
)