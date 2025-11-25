(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  ;; Domain-level constant agent identities so actions can be namespaced to agents
  (:constants agent-a agent-b - agent)

  (:predicates
    (on ?x - block ?y - block)          ; ?x is directly on ?y
    (ontable ?x - block)                ; ?x is on the table
    (clear ?x - block)                  ; nothing is on top of ?x
    (handempty ?p - agent)              ; agent ?p has empty hand
    (holding ?p - agent ?x - block)     ; agent ?p is holding block ?x
  )

  ;; Actions namespaced to agent-a ----------------------------------------------------------------

  (:action pickup-a
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent-a))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty agent-a))
      (holding agent-a ?b)
    )
  )

  (:action unstack-a
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty agent-a))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (clear ?c)
      (not (handempty agent-a))
      (holding agent-a ?b)
    )
  )

  (:action putdown-a
    :parameters (?b - block)
    :precondition (and (holding agent-a ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty agent-a)
      (not (holding agent-a ?b))
    )
  )

  (:action stack-a
    :parameters (?b - block ?c - block)
    :precondition (and (holding agent-a ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty agent-a)
      (not (holding agent-a ?b))
    )
  )

  ;; Actions namespaced to agent-b ----------------------------------------------------------------

  (:action pickup-b
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent-b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty agent-b))
      (holding agent-b ?b)
    )
  )

  (:action unstack-b
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty agent-b))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (clear ?c)
      (not (handempty agent-b))
      (holding agent-b ?b)
    )
  )

  (:action putdown-b
    :parameters (?b - block)
    :precondition (and (holding agent-b ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty agent-b)
      (not (holding agent-b ?b))
    )
  )

  (:action stack-b
    :parameters (?b - block ?c - block)
    :precondition (and (holding agent-b ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty agent-b)
      (not (holding agent-b ?b))
    )
  )

)