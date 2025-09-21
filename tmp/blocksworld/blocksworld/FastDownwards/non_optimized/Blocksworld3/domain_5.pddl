(define (domain multi_agent_blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (holding-vowel ?x - block)
    (handempty-vowel)
    (holding-consonant ?x - block)
    (handempty-consonant)
  )

  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty-vowel))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty-vowel))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
      (clear ?y)
    )
  )

  (:action vowel-putdown-to-table
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action vowel-stack-onto
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (not (clear ?y))
    )
  )

  (:action consonant-pickup-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-consonant))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-consonant))
      (holding-consonant ?x)
    )
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-consonant))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-consonant))
      (holding-consonant ?x)
      (clear ?y)
    )
  )

  (:action consonant-putdown-to-table
    :parameters (?x - block)
    :precondition (and (holding-consonant ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-consonant)
      (not (holding-consonant ?x))
    )
  )

  (:action consonant-stack-onto
    :parameters (?x - block ?y - block)
    :precondition (and (holding-consonant ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-consonant)
      (not (holding-consonant ?x))
      (not (clear ?y))
    )
  )
)