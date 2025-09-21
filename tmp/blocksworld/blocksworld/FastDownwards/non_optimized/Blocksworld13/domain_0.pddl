(define (domain multi_agent_blocks)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (on ?b ?x)        ; ?b is directly on ?x (another block or the constant table)
    (clear ?b)        ; nothing on top of ?b
    (vowel ?b)        ; ?b is a vowel block (A E I O U)
    (consonant ?b)    ; ?b is a consonant block
  )

  ;; Vowel agent actions (agent 1)
  (:action vowel_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from table))
      (not (= ?to table))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (not (= ?to table))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; Consonant agent actions (agent 2)
  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?from table))
      (not (= ?to table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_from_table_to_block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (not (= ?to table))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )
)