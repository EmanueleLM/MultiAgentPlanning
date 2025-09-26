(define (domain blocks-multi-agent)
  (:requirements :strips :typing)
  (:types vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty-vowel)
    (holding-vowel ?x - vowel)
    (handempty-cons)
    (holding-cons ?x - consonant)
  )

  (:action vowel_pickup
    :parameters (?x - vowel)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel_unstack
    :parameters (?x - vowel ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel_putdown
    :parameters (?x - vowel)
    :precondition (holding-vowel ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action vowel_stack
    :parameters (?x - vowel ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y))
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action cons_pickup
    :parameters (?x - consonant)
    :precondition (and (ontable ?x) (clear ?x) (handempty-cons))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  (:action cons_unstack
    :parameters (?x - consonant ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-cons))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  (:action cons_putdown
    :parameters (?x - consonant)
    :precondition (holding-cons ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )

  (:action cons_stack
    :parameters (?x - consonant ?y - block)
    :precondition (and (holding-cons ?x) (clear ?y))
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )
)