(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?r - agent ?b - block)
    (handempty ?r - agent)
  )

  ;; Robot1 actions (prefixed with r1-)
  (:action r1-pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty robot1))
    :effect (and
             (holding robot1 ?b)
             (not (ontable ?b))
             (not (clear ?b))
             (not (handempty robot1))
            )
  )

  (:action r1-putdown
    :parameters (?b - block)
    :precondition (and (holding robot1 ?b))
    :effect (and
             (ontable ?b)
             (clear ?b)
             (handempty robot1)
             (not (holding robot1 ?b))
            )
  )

  (:action r1-unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty robot1))
    :effect (and
             (holding robot1 ?b)
             (clear ?c)
             (not (on ?b ?c))
             (not (clear ?b))
             (not (handempty robot1))
            )
  )

  (:action r1-stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding robot1 ?b) (clear ?c))
    :effect (and
             (on ?b ?c)
             (clear ?b)
             (handempty robot1)
             (not (holding robot1 ?b))
             (not (clear ?c))
            )
  )

  ;; Robot2 actions (prefixed with r2-)
  (:action r2-pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty robot2))
    :effect (and
             (holding robot2 ?b)
             (not (ontable ?b))
             (not (clear ?b))
             (not (handempty robot2))
            )
  )

  (:action r2-putdown
    :parameters (?b - block)
    :precondition (and (holding robot2 ?b))
    :effect (and
             (ontable ?b)
             (clear ?b)
             (handempty robot2)
             (not (holding robot2 ?b))
            )
  )

  (:action r2-unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty robot2))
    :effect (and
             (holding robot2 ?b)
             (clear ?c)
             (not (on ?b ?c))
             (not (clear ?b))
             (not (handempty robot2))
            )
  )

  (:action r2-stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding robot2 ?b) (clear ?c))
    :effect (and
             (on ?b ?c)
             (clear ?b)
             (handempty robot2)
             (not (holding robot2 ?b))
             (not (clear ?c))
            )
  )
)