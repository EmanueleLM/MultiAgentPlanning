(define (domain multi-agent-stacks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)        ; ?x is on ?y (y may be table)
    (clear ?x)        ; nothing on top of ?x (table is not modelled as clear)
    (vowel ?x)        ; blocks this vowel-agent may move
    (consonant ?x)    ; blocks this consonant-agent may move
  )

  ;; Actions belonging to the vowel agent (can move only vowel-labeled blocks)
  (:action vowel_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (vowel ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Actions belonging to the consonant agent (can move only consonant-labeled blocks)
  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )
)