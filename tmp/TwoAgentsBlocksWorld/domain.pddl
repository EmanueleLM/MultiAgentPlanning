```lisp
(define (domain integrated-blocks)
  (:requirements :strips :typing)
  (:types block robot)
  
  (:predicates
    (on ?b1 - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (handempty ?r - robot)
    (holding ?r - robot ?b - block)
    (is-consonant ?b - block)
    (is-vowel-robot ?r - robot)
    (is-consonant-robot ?r - robot)
  )
  
  (:action pick-up-vowel
    :parameters (?r - robot ?b - block)
    :precondition (and (is-vowel-robot ?r) (clear ?b) (ontable ?b) (handempty ?r))
    :effect (and (holding ?r ?b) (not (ontable ?b)) (not (handempty ?r)) (not (clear ?b)))
  )

  (:action put-down-vowel
    :parameters (?r - robot ?b - block)
    :precondition (holding ?r ?b)
    :effect (and (ontable ?b) (clear ?b) (handempty ?r) (not (holding ?r ?b)))
  )

  (:action stack-vowel
    :parameters (?r - robot ?b1 - block ?b2 - block)
    :precondition (and (holding ?r ?b1) (clear ?b2))
    :effect (and (on ?b1 ?b2) (clear ?b1) (handempty ?r) (not (holding ?r ?b1)) (not (clear ?b2)))
  )

  (:action unstack-vowel
    :parameters (?r - robot ?b1 - block ?b2 - block)
    :precondition (and (on ?b1 ?b2) (clear ?b1) (handempty ?r))
    :effect (and (holding ?r ?b1) (clear ?b2) (not (on ?b1 ?b2)) (not (clear ?b1)) (not (handempty ?r)))
  )

  (:action pick-up-consonant
    :parameters (?r - robot ?b - block)
    :precondition (and (is-consonant-robot ?r) (is-consonant ?b) (clear ?b) (ontable ?b) (handempty ?r))
    :effect (and (holding ?r ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty ?r)))
  )

  (:action put-down-consonant
    :parameters (?r - robot ?b - block)
    :precondition (holding ?r ?b)
    :effect (and (ontable ?b) (handempty ?r) (clear ?b) (not (holding ?r ?b)))
  )

  (:action stack-consonant
    :parameters (?r - robot ?b1 ?b2 - block)
    :precondition (and (holding ?r ?b1) (clear ?b2) (is-consonant ?b1))
    :effect (and (on ?b1 ?b2) (handempty ?r) (clear ?b1) (not (holding ?r ?b1)) (not (clear ?b2)))
  )

  (:action unstack-consonant
    :parameters (?r - robot ?b1 ?b2 - block)
    :precondition (and (on ?b1 ?b2) (clear ?b1) (handempty ?r))
    :effect (and (holding ?r ?b1) (clear ?b2) (not (on ?b1 ?b2)) (not (clear ?b1)) (not (handempty ?r)))
  )
)
```