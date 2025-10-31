(define (domain multi-agent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?under - block)    ; ?b is directly on ?under (a block)
    (ontable ?b - block)              ; ?b is directly on the table (bottom of a stack)
    (clear ?b - block)                ; nothing on top of ?b
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel-agent actions (may move only vowel blocks)
  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (on ?b ?from))
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (ontable ?b)
              (not (on ?b ?from))
              (clear ?from)
            )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (ontable ?b))
              (not (clear ?to))
            )
  )

  ;; Consonant-agent actions (may move only consonant blocks)
  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (on ?b ?from))
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (ontable ?b)
              (not (on ?b ?from))
              (clear ?from)
            )
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (on ?b ?to)
              (not (ontable ?b))
              (not (clear ?to))
            )
  )
)