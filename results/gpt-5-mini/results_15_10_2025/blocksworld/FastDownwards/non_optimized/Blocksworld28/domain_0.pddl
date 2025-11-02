(define (domain combined-vowel-consonant)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)       ; block ?x is on block ?y
    (ontable ?x)     ; block ?x is on the table
    (clear ?x)       ; nothing on top of ?x
    (vowel ?x)       ; ?x is movable by the vowel agent
    (consonant ?x)   ; ?x is movable by the consonant agent
  )

  ;; Actions of the vowel agent (kept distinct)
  (:action vowel_move_block_to_block
    :parameters (?x ?from ?to)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?x ?to)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?x ?from)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  ;; Actions of the consonant agent (kept distinct)
  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)