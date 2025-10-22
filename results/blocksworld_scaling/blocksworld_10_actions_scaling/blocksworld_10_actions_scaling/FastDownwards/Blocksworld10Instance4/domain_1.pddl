(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (carrying)
  )

  ;; Agent1 pickup from table
  (:action pickup-agent1
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent1) (not (carrying)))
    :effect (and
              (not (ontable ?b))
              (holding agent1 ?b)
              (not (handempty agent1))
              (carrying)
            )
  )

  ;; Agent2 pickup from table
  (:action pickup-agent2
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty agent2) (not (carrying)))
    :effect (and
              (not (ontable ?b))
              (holding agent2 ?b)
              (not (handempty agent2))
              (carrying)
            )
  )

  ;; Agent1 putdown to table
  (:action putdown-agent1
    :parameters (?b - block)
    :precondition (and (holding agent1 ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty agent1)
              (not (holding agent1 ?b))
              (not (carrying))
            )
  )

  ;; Agent2 putdown to table
  (:action putdown-agent2
    :parameters (?b - block)
    :precondition (and (holding agent2 ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty agent2)
              (not (holding agent2 ?b))
              (not (carrying))
            )
  )

  ;; Agent1 unstack (remove top block from another block)
  (:action unstack-agent1
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty agent1) (not (carrying)))
    :effect (and
              (not (on ?b ?c))
              (holding agent1 ?b)
              (not (handempty agent1))
              (carrying)
              (clear ?c)
            )
  )

  ;; Agent2 unstack
  (:action unstack-agent2
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty agent2) (not (carrying)))
    :effect (and
              (not (on ?b ?c))
              (holding agent2 ?b)
              (not (handempty agent2))
              (carrying)
              (clear ?c)
            )
  )

  ;; Agent1 stack (place held block onto another block)
  (:action stack-agent1
    :parameters (?b - block ?c - block)
    :precondition (and (holding agent1 ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (not (clear ?c))
              (handempty agent1)
              (not (holding agent1 ?b))
              (not (carrying))
            )
  )

  ;; Agent2 stack
  (:action stack-agent2
    :parameters (?b - block ?c - block)
    :precondition (and (holding agent2 ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (not (clear ?c))
              (handempty agent2)
              (not (holding agent2 ?b))
              (not (carrying))
            )
  )
)