(define (domain blocks-multirobot)
  (:requirements :typing :negative-preconditions)
  (:types block robot)
  (:constants robot1 robot2 - robot)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?r - robot ?b - block)
    (handempty ?r - robot)
  )

  ;; Actions for robot1
  (:action robot1_unstack
    :parameters (?b - block ?b2 - block)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty robot1))
    :effect (and
      (not (on ?b ?b2))
      (not (clear ?b))
      (holding robot1 ?b)
      (clear ?b2)
      (not (handempty robot1))
    )
  )

  (:action robot1_stack
    :parameters (?b - block ?b2 - block)
    :precondition (and (holding robot1 ?b) (clear ?b2))
    :effect (and
      (not (holding robot1 ?b))
      (on ?b ?b2)
      (clear ?b)
      (not (clear ?b2))
      (handempty robot1)
    )
  )

  (:action robot1_putdown
    :parameters (?b - block)
    :precondition (holding robot1 ?b)
    :effect (and
      (not (holding robot1 ?b))
      (ontable ?b)
      (clear ?b)
      (handempty robot1)
    )
  )

  (:action robot1_pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty robot1))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding robot1 ?b)
      (not (handempty robot1))
    )
  )

  ;; Actions for robot2
  (:action robot2_unstack
    :parameters (?b - block ?b2 - block)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty robot2))
    :effect (and
      (not (on ?b ?b2))
      (not (clear ?b))
      (holding robot2 ?b)
      (clear ?b2)
      (not (handempty robot2))
    )
  )

  (:action robot2_stack
    :parameters (?b - block ?b2 - block)
    :precondition (and (holding robot2 ?b) (clear ?b2))
    :effect (and
      (not (holding robot2 ?b))
      (on ?b ?b2)
      (clear ?b)
      (not (clear ?b2))
      (handempty robot2)
    )
  )

  (:action robot2_putdown
    :parameters (?b - block)
    :precondition (holding robot2 ?b)
    :effect (and
      (not (holding robot2 ?b))
      (ontable ?b)
      (clear ?b)
      (handempty robot2)
    )
  )

  (:action robot2_pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty robot2))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding robot2 ?b)
      (not (handempty robot2))
    )
  )
)