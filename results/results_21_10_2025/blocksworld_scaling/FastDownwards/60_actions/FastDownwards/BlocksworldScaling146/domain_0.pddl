(define (domain multi-agent-blocksworld)
  (:requirements :strips :typing)
  (:types block tablepos)

  (:predicates
    (on ?b - block ?under - block)         ; b is directly on top of under (a block)
    (ontable ?b - block ?t - tablepos)     ; b is directly on table position t
    (clear ?b - block)                     ; nothing on top of b
    (empty ?t - tablepos)                  ; table position t has no block
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ; Vowel-agent actions (may move only vowel blocks)
  (:action vowel_move_table_to_block
    :parameters (?b - block ?fromt - tablepos ?to - block)
    :precondition (and (vowel ?b) (ontable ?b ?fromt) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (ontable ?b ?fromt))
              (not (clear ?to))
              (empty ?fromt)
              (clear ?b)
            )
  )

  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (on ?b ?from))
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block ?tot - tablepos)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (empty ?tot))
    :effect (and
              (ontable ?b ?tot)
              (not (on ?b ?from))
              (clear ?from)
              (not (empty ?tot))
              (clear ?b)
            )
  )

  (:action vowel_move_table_to_table
    :parameters (?b - block ?fromt - tablepos ?tot - tablepos)
    :precondition (and (vowel ?b) (ontable ?b ?fromt) (clear ?b) (empty ?tot))
    :effect (and
              (ontable ?b ?tot)
              (not (ontable ?b ?fromt))
              (empty ?fromt)
              (not (empty ?tot))
              (clear ?b)
            )
  )

  ; Consonant-agent actions (may move only consonant blocks)
  (:action consonant_move_table_to_block
    :parameters (?b - block ?fromt - tablepos ?to - block)
    :precondition (and (consonant ?b) (ontable ?b ?fromt) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (ontable ?b ?fromt))
              (not (clear ?to))
              (empty ?fromt)
              (clear ?b)
            )
  )

  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (on ?b ?from))
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block ?tot - tablepos)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (empty ?tot))
    :effect (and
              (ontable ?b ?tot)
              (not (on ?b ?from))
              (clear ?from)
              (not (empty ?tot))
              (clear ?b)
            )
  )

  (:action consonant_move_table_to_table
    :parameters (?b - block ?fromt - tablepos ?tot - tablepos)
    :precondition (and (consonant ?b) (ontable ?b ?fromt) (clear ?b) (empty ?tot))
    :effect (and
              (ontable ?b ?tot)
              (not (ontable ?b ?fromt))
              (empty ?fromt)
              (not (empty ?tot))
              (clear ?b)
            )
  )
)