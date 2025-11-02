(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types:
  ;; - place is a supertype for locations (blocks and the table)
  ;; - block is a subtype of place
  ;; - vowel and consonant are subtypes of block, partitioning the blocks
  (:types place block - place
          vowel consonant - block)

  (:predicates
    ;; block ?b is directly on place ?p (place is either a block or the table)
    (on ?b - block ?p - place)
    ;; block ?b has nothing on top (is top-of-stack)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (can only move vowel blocks). Three variants:
  ;; a) move a vowel block from a block to another block
  (:action vowel_move_block_to_block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (clear ?from)
    )
  )

  ;; b) move a vowel block from a block to the table
  (:action vowel_move_block_to_table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?b)
      (clear ?from)
    )
  )

  ;; c) move a vowel block from the table to a block
  (:action vowel_move_table_to_block
    :parameters (?b - vowel ?to - block)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (can only move consonant blocks). Mirror of vowel actions:
  ;; d) move consonant block from a block to another block
  (:action cons_move_block_to_block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (clear ?from)
    )
  )

  ;; e) move consonant block from a block to the table
  (:action cons_move_block_to_table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?b)
      (clear ?from)
    )
  )

  ;; f) move consonant block from the table to a block
  (:action cons_move_table_to_block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )
)