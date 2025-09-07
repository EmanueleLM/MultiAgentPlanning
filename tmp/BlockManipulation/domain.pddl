(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates 
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action agent1-pick-up
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty) (or (= ?x A) (= ?x O)))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  (:action agent1-put-down
    :parameters (?x - block)
    :precondition (and (holding ?x) (or (= ?x A) (= ?x O)))
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  (:action agent1-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y) (or (= ?x A) (= ?x O)))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )

  (:action agent1-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (or (= ?x A) (= ?x O)))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )

  (:action agent2-pick-up
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty) (or (= ?x B) (= ?x C)))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  (:action agent2-put-down
    :parameters (?x - block)
    :precondition (and (holding ?x) (or (= ?x B) (= ?x C)))
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  (:action agent2-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y) (or (= ?x B) (= ?x C)))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )

  (:action agent2-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (or (= ?x B) (= ?x C)))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )
)