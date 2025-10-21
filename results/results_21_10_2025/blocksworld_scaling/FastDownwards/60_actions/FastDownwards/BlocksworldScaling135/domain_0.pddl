(define (domain blocks-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block object)
  (:predicates
    (on ?b - block ?p - object)       ; block ?b is directly on object ?p (block or table)
    (clear ?o - object)               ; nothing on top of object ?o (for table this is always maintained true)
    (vowel ?b - block)                ; block is vowel
    (consonant ?b - block)            ; block is consonant
  )

  ;----------------------------
  ; Vowel-agent actions (may only move A, E, I and only when they are top-of-stack)
  ; Separate actions for block->block, block->table, table->block to avoid conditional effects.
  ;----------------------------

  (:action move-vowel-block-to-block
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

  (:action move-vowel-block-to-table
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
      ; table remains clear (so multiple stacks on table are allowed)
    )
  )

  (:action move-vowel-table-to-block
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
      ; table remains clear
    )
  )

  ;----------------------------
  ; Consonant-agent actions (may only move consonant blocks)
  ;----------------------------

  (:action move-cons-block-to-block
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

  (:action move-cons-block-to-table
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
      ; table remains clear
    )
  )

  (:action move-cons-table-to-block
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
      ; table remains clear
    )
  )

)