(define (domain two-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - object)

  (:predicates
    ;; block b is directly on place p (a block or the table)
    (on ?b - block ?p - (either block table))
    ;; true if no block is on top of this block
    (clear ?b - block)
    ;; classification of blocks
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; ----- VOWEL AGENT ACTIONS -----
  ;; move a vowel block from one block to another block
  (:action move-vowel-block-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ;; after removing ?b, its former support ?from becomes clear
      (clear ?from)
      ;; destination ?to now has something on it, so not clear
      (not (clear ?to))
    )
  )

  ;; move a vowel block from a block onto the table
  (:action move-vowel-block-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; move a vowel block from the table onto a block
  (:action move-vowel-table-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; ----- CONSONANT AGENT ACTIONS -----
  ;; move a consonant block from one block to another block
  (:action move-consonant-block-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; move a consonant block from a block onto the table
  (:action move-consonant-block-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; move a consonant block from the table onto a block
  (:action move-consonant-table-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)