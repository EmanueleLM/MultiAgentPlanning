(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    block table - place
    agent - object
  )

  (:predicates
    ;; block b is on place p (place is block or table)
    (on ?b - block ?p - place)
    ;; block b has nothing on top of it (only meaningful for blocks)
    (clear ?b - block)
    ;; type predicates for agent-specific movement constraints
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; --- VOWEL AGENT ACTIONS ---
  ;; Move a vowel block from a block to another block
  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from the table to a block
  (:action vowel_move_table_to_block
    :parameters (?b - block ?from - table ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      ;; table (from) is not tracked by clear
    )
  )

  ;; Move a vowel block from a block to the table
  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block ?to - table)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      ;; table (to) is not tracked by clear
    )
  )

  ;; --- CONSONANT AGENT ACTIONS ---
  ;; Move a consonant block from a block to another block
  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from the table to a block
  (:action consonant_move_table_to_block
    :parameters (?b - block ?from - table ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from a block to the table
  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block ?to - table)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )
)