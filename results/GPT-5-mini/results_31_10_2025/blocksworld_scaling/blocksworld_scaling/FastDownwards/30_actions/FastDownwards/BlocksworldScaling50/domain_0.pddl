(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place
          vowel consonant - block)
  (:predicates
    (on ?b - block ?p - place)   ; block ?b is directly on place ?p (either a block or the table)
    (clear ?b - block)           ; block ?b has no block on top (is top-of-stack)
  )

  ;; Vowel-agent moves: may move only vowel blocks, one top block at a time.
  ;; 1) Move vowel block from a block to another block
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

  ;; 2) Move vowel block from a block to the table (create/restore a stack-bottom on table)
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

  ;; 3) Move vowel block from the table to a block (take a bottom block from table onto a block)
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

  ;; Consonant-agent moves: may move only consonant blocks, one top block at a time.
  ;; 4) Move consonant block from a block to another block
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

  ;; 5) Move consonant block from a block to the table
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

  ;; 6) Move consonant block from the table to a block
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