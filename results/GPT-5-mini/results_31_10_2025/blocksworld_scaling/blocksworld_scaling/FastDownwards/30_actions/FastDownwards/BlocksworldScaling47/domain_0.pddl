(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support)
  ;; blocks are also supports (so a block can be a support for another block)
  (:type-constants) ;; no type constants here; objects declared in problem

  (:predicates
    (on ?b - block ?s - support)     ; block ?b is directly on support ?s (support = block or table)
    (clear ?s - support)             ; support has nothing on top of it (no block is on it)
    (vowel ?b - block)               ; block labelled with a vowel (A,E,I)
    (consonant ?b - block)           ; block labelled with a consonant (B,C,D,F,G,H,J,K)
  )

  ;; Vowel-agent actions (may only move A, E, I). Three action forms: block->block, table->block, block->table
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))    ; placing on ?to makes ?to not clear
      (clear ?from)        ; removing ?b clears the supporting block ?from
      (clear ?b)           ; moved block remains top (clear)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (may only move consonant-labelled blocks).
  (:action move-cons-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-cons-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-cons-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )
)