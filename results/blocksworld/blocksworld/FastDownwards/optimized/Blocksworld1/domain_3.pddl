(define (domain multi-agent-blocks)
  (:requirements :strips :typing :fluents :action-costs)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-vowel ?x - block)
    (handempty-vowel)
    (holding-cons ?x - block)
    (handempty-cons)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:functions (total-cost))

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (holding-vowel ?x)
      (not (handempty-vowel))
      (not (clear ?x))
      (increase (total-cost) 1)
    )
  )

  (:action vowel-pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (ontable ?x))
      (holding-vowel ?x)
      (not (handempty-vowel))
      (not (clear ?x))
      (increase (total-cost) 1)
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (increase (total-cost) 1)
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y) (vowel ?x))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action cons-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-cons) (consonant ?x))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (holding-cons ?x)
      (not (handempty-cons))
      (not (clear ?x))
      (increase (total-cost) 1)
    )
  )

  (:action cons-pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-cons) (consonant ?x))
    :effect (and
      (not (ontable ?x))
      (holding-cons ?x)
      (not (handempty-cons))
      (not (clear ?x))
      (increase (total-cost) 1)
    )
  )

  (:action cons-putdown
    :parameters (?x - block)
    :precondition (and (holding-cons ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
      (increase (total-cost) 1)
    )
  )

  (:action cons-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-cons ?x) (clear ?y) (consonant ?x))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )
)