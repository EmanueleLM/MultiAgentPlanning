(define (domain blocks-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?support - block)    ; ?b is directly on ?support
    (on-table ?b - block)               ; ?b is directly on the table
    (clear ?b - block)                  ; nothing is on ?b
    (vowel ?b - block)                  ; block is vowel (A, E, I)
    (consonant ?b - block)              ; block is consonant (others)
  )

  ;; Vowel-agent actions: can only move vowel blocks and only top blocks.
  (:action vowel-move-block-to-block
    :parameters (?v - block ?from - block ?to - block)
    :precondition (and (vowel ?v) (on ?v ?from) (clear ?v) (clear ?to))
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (clear ?v)
      (clear ?from)
      (not (clear ?to))
      (not (on-table ?v))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and (vowel ?v) (on ?v ?from) (clear ?v))
    :effect (and
      (not (on ?v ?from))
      (on-table ?v)
      (clear ?v)
      (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and (vowel ?v) (on-table ?v) (clear ?v) (clear ?to))
    :effect (and
      (not (on-table ?v))
      (on ?v ?to)
      (clear ?v)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent actions: can only move consonant blocks and only top blocks.
  (:action consonant-move-block-to-block
    :parameters (?c - block ?from - block ?to - block)
    :precondition (and (consonant ?c) (on ?c ?from) (clear ?c) (clear ?to))
    :effect (and
      (not (on ?c ?from))
      (on ?c ?to)
      (clear ?c)
      (clear ?from)
      (not (clear ?to))
      (not (on-table ?c))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?c - block ?from - block)
    :precondition (and (consonant ?c) (on ?c ?from) (clear ?c))
    :effect (and
      (not (on ?c ?from))
      (on-table ?c)
      (clear ?c)
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?c - block ?to - block)
    :precondition (and (consonant ?c) (on-table ?c) (clear ?c) (clear ?to))
    :effect (and
      (not (on-table ?c))
      (on ?c ?to)
      (clear ?c)
      (not (clear ?to))
    )
  )
)