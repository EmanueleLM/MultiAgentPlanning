(define (domain blocksworld-multiagent)
  (:requirements :strips :typing)
  (:types block tablepos)

  (:predicates
    (on ?b - block ?under - block)         ; block b directly on block under
    (ontable ?b - block ?t - tablepos)    ; block b directly on table position t
    (clear-block ?b - block)              ; nothing on block b
    (clear-pos ?t - tablepos)             ; table position t is empty
    (vowel ?b - block)                    ; b is a vowel block (moved only by vowel_agent actions)
    (consonant ?b - block)                ; b is a consonant block (moved only by consonant_agent actions)
  )

  ;; Vowel-agent moves (vowel_ prefix). These obey the "top-only" rule:
  ;; a vowel block may be moved only if it is currently clear (no block on top).
  ;; Moves cover four source/target combinations: table->table, table->block, block->table, block->block.

  (:action vowel_move_table_to_table
    :parameters (?b - block ?from - tablepos ?to - tablepos)
    :precondition (and (vowel ?b) (ontable ?b ?from) (clear-block ?b) (clear-pos ?to))
    :effect (and
              (not (ontable ?b ?from))
              (ontable ?b ?to)
              (clear-pos ?from)
              (not (clear-pos ?to))
              (clear-block ?b)
            )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?from - tablepos ?to - block)
    :precondition (and (vowel ?b) (ontable ?b ?from) (clear-block ?b) (clear-block ?to))
    :effect (and
              (not (ontable ?b ?from))
              (on ?b ?to)
              (clear-pos ?from)
              (not (clear-block ?to))
              (clear-block ?b)
            )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block ?to - tablepos)
    :precondition (and (vowel ?b) (on ?b ?from) (clear-block ?b) (clear-pos ?to))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b ?to)
              (clear-block ?from)
              (not (clear-pos ?to))
              (clear-block ?b)
            )
  )

  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear-block ?b) (clear-block ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear-block ?from)
              (not (clear-block ?to))
              (clear-block ?b)
            )
  )

  ;; Consonant-agent moves (consonant_ prefix). Mirror of vowel moves but restricted to consonant blocks.
  ;; No consonant objects are invented in the problem if none are present; these actions remain available
  ;; for any consonant blocks that may be declared in instances.

  (:action consonant_move_table_to_table
    :parameters (?b - block ?from - tablepos ?to - tablepos)
    :precondition (and (consonant ?b) (ontable ?b ?from) (clear-block ?b) (clear-pos ?to))
    :effect (and
              (not (ontable ?b ?from))
              (ontable ?b ?to)
              (clear-pos ?from)
              (not (clear-pos ?to))
              (clear-block ?b)
            )
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?from - tablepos ?to - block)
    :precondition (and (consonant ?b) (ontable ?b ?from) (clear-block ?b) (clear-block ?to))
    :effect (and
              (not (ontable ?b ?from))
              (on ?b ?to)
              (clear-pos ?from)
              (not (clear-block ?to))
              (clear-block ?b)
            )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block ?to - tablepos)
    :precondition (and (consonant ?b) (on ?b ?from) (clear-block ?b) (clear-pos ?to))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b ?to)
              (clear-block ?from)
              (not (clear-pos ?to))
              (clear-block ?b)
            )
  )

  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear-block ?b) (clear-block ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear-block ?from)
              (not (clear-block ?to))
              (clear-block ?b)
            )
  )

)