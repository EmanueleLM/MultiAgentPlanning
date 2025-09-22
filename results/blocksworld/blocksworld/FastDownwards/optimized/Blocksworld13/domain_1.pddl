(define (domain multi-agent-stacks)
  (:requirements :strips)
  (:constants table)
  (:predicates
    (on ?x ?y)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
  )

  (:action vowel_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action vowel_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action vowel_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (vowel ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )

  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action consonant_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )

  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )
)