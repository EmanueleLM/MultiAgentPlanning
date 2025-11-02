(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)         ; ?x is directly on ?y (both blocks)
    (ontable ?x - block)               ; ?x is on the table
    (clear ?x - block)                 ; nothing is on ?x and it is not being held
    (vowel ?x - block)                 ; block handled by vowel agent
    (consonant ?x - block)             ; block handled by consonant agent

    ;; Per-agent hand state and holding predicates
    (empty-vowel)
    (holding-vowel ?x - block)

    (empty-consonant)
    (holding-consonant ?x - block)
  )

  ;; Vowel agent actions (can only manipulate vowel blocks)
  (:action vowel-pickup-table
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (empty-vowel)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))          ; a held block is not considered clear
      (not (empty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?y)
      (clear ?x)
      (empty-vowel)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (empty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (holding-vowel ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-vowel ?x))
      (empty-vowel)
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (holding-vowel ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (holding-vowel ?x))
      (empty-vowel)
    )
  )

  ;; Consonant agent actions (can only manipulate consonant blocks)
  (:action consonant-pickup-table
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (empty-consonant)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (empty-consonant))
      (holding-consonant ?x)
    )
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (empty-consonant)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (empty-consonant))
      (holding-consonant ?x)
    )
  )

  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (holding-consonant ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-consonant ?x))
      (empty-consonant)
    )
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (holding-consonant ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (holding-consonant ?x))
      (empty-consonant)
    )
  )
)