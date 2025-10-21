(define (domain blocksworld-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block - object)
  (:constants table - object)
  (:predicates
    (vowel ?x - block)
    (consonant ?x - block)
    (on ?x - block ?y - object)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Vowel-agent actions (must respect handempty and holding constraints)
  (:action vowel-pickup
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (on ?x table)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (on ?x table))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (holding ?x)
    )
    :effect (and
      (on ?x table)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )

  ;; Consonant-agent actions (distinct names, same structural constraints)
  (:action consonant-pickup
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (on ?x table)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (on ?x table))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
    )
    :effect (and
      (on ?x table)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)