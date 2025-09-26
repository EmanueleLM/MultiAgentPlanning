(define (domain combined-blocks)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; x is on y
    (on-table ?x - block)           ; x is on the table (base of a stack)
    (clear ?x - block)              ; nothing on top of x
    (top ?x - block)                ; x is the top of its stack (movable)
    (vowel ?x - block)              ; blocks the vowel-agent may move
    (consonant ?x - block)          ; blocks the consonant-agent may move
  )

  ;; Vowel-agent actions (namespaced with prefix "vowel_")
  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)

      ;; source becomes clear and top
      (clear ?from)
      (top ?from)

      ;; destination no longer clear/top
      (not (clear ?to))
      (not (top ?to))

      ;; moved block becomes top and clear (nothing on top of it)
      (clear ?b)
      (top ?b)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)

      ;; source becomes clear and top
      (clear ?from)
      (top ?from)

      ;; moved block becomes top and clear (on the table)
      (clear ?b)
      (top ?b)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on-table ?b)
      (top ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)

      ;; destination no longer clear/top
      (not (clear ?to))
      (not (top ?to))

      ;; moved block becomes top and clear
      (clear ?b)
      (top ?b)
    )
  )

  ;; Consonant-agent actions (namespaced with prefix "consonant_")
  ;; These mirror the vowel-agent moves but restrict who can be moved/targeted.
  (:action consonant_move_from_block_to_block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (consonant ?to)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)

      ;; source becomes clear and top
      (clear ?from)
      (top ?from)

      ;; destination no longer clear/top
      (not (clear ?to))
      (not (top ?to))

      ;; moved block becomes top and clear
      (clear ?x)
      (top ?x)
    )
  )

  (:action consonant_move_from_table_to_block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (consonant ?to)
      (on-table ?x)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on-table ?x))
      (on ?x ?to)

      ;; destination no longer clear/top
      (not (clear ?to))
      (not (top ?to))

      ;; moved block becomes top and clear
      (clear ?x)
      (top ?x)
    )
  )

  (:action consonant_move_from_block_to_table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (top ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on-table ?x)

      ;; source becomes clear and top
      (clear ?from)
      (top ?from)

      ;; moved block becomes top and clear (on the table)
      (clear ?x)
      (top ?x)
    )
  )
)