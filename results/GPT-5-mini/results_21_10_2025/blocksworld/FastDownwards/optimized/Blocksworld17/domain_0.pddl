(define (domain blocksworld-multi-agent)
  (:requirements :strips)
  (:predicates
    (block ?x)
    (vowel ?x)
    (consonant ?x)
    (on ?x ?y)        ; ?x is on ?y; ?y can be another block or the special object table
    (clear ?x)        ; no block is on top of ?x
    (holding ?x)
    (handempty)
  )

  ;; Vowel-agent actions (operate directly on vowel blocks)
  (:action vowel-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (block ?b) (block ?from) (block ?to)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (block ?b) (block ?to)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (block ?b) (block ?from)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; Consonant-agent actions (use a simple pick/stack model with a hand)
  (:action consonant-pickup
    :parameters (?x)
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
    :parameters (?x ?y)
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
    :parameters (?x)
    :precondition (and
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
    :parameters (?x ?y)
    :precondition (and
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (on ?x table))
    )
  )
)