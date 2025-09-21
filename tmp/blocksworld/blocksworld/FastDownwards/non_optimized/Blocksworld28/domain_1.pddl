(define (domain combined-vowel-consonant)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
    (agent ?ag)
    (vowel-agent ?ag)
    (consonant-agent ?ag)
  )

  (:action vowel_move_block_to_block
    :parameters (?ag ?x ?from ?to)
    :precondition (and (agent ?ag) (vowel-agent ?ag) (vowel ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?ag ?x ?to)
    :precondition (and (agent ?ag) (vowel-agent ?ag) (vowel ?x) (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?ag ?x ?from)
    :precondition (and (agent ?ag) (vowel-agent ?ag) (vowel ?x) (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant_move_block_to_block
    :parameters (?ag ?b ?from ?to)
    :precondition (and (agent ?ag) (consonant-agent ?ag) (consonant ?b) (clear ?b) (on ?b ?from) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?ag ?b ?to)
    :precondition (and (agent ?ag) (consonant-agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?ag ?b ?from)
    :precondition (and (agent ?ag) (consonant-agent ?ag) (consonant ?b) (clear ?b) (on ?b ?from))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)