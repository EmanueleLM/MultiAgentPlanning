(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support)
  (:predicates
    (on ?b - block ?s - support)   ; block ?b is directly on support ?s (support = block or table)
    (clear ?s - support)           ; support has nothing on top of it (no block is on it)
    (vowel ?b - block)             ; block labelled with a vowel
    (consonant ?b - block)         ; block labelled with a consonant
  )

  ;; Vowel-agent actions (may only move A, E, I).
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)           ; ?b must be top of its stack
      (clear ?to)          ; destination block must be top (free) to place on
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))    ; placing ?b on ?to makes ?to no longer clear
      (clear ?from)        ; removing ?b clears the supporting block ?from
      (clear ?b)           ; moved block is top (clear)
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