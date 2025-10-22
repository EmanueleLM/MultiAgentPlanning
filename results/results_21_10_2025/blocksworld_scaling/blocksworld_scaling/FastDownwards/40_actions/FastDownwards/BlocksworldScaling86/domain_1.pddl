(define (domain blocksworld_two_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is immediately on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on ?x
    (movable-by-vowel ?x - block)     ; ?x can be moved by the vowel agent
    (movable-by-cons ?x - block)      ; ?x can be moved by the consonant agent
  )

  ;; Vowel-agent actions

  (:action vowel-move-from-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and
      (on ?x ?z)
      (clear ?x)
      (clear ?y)
      (movable-by-vowel ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?z)
      (clear ?x)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (ontable ?x)
      (clear ?y)
      (movable-by-vowel ?x)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and
      (on ?x ?z)
      (clear ?x)
      (movable-by-vowel ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions

  (:action consonant-move-from-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and
      (on ?x ?z)
      (clear ?x)
      (clear ?y)
      (movable-by-cons ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?z)
      (clear ?x)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (ontable ?x)
      (clear ?y)
      (movable-by-cons ?x)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and
      (on ?x ?z)
      (clear ?x)
      (movable-by-cons ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
      (clear ?x)
    )
  )
)