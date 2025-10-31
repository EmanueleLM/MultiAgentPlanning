(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?support - block)    ; block ?b is directly on block ?support
    (on-table ?b - block)               ; block ?b is directly on the table
    (clear ?b - block)                  ; nothing on top of ?b (it is a top block)
    (vowel ?b - block)                  ; block is a vowel (A, E, I)
    (consonant ?b - block)              ; block is a consonant (all others)
  )

  ;; Vowel agent actions (may only move vowel blocks). Four action schemas:
  ;; - from a block onto a block
  ;; - from a block onto table
  ;; - from table onto a block
  ;; - from table onto table  (not needed here but included for completeness)
  (:action vowel-move-from-block-to-block
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

  (:action vowel-move-from-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and (vowel ?v) (on ?v ?from) (clear ?v))
    :effect (and
      (not (on ?v ?from))
      (on-table ?v)
      (clear ?v)
      (clear ?from)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and (vowel ?v) (on-table ?v) (clear ?v) (clear ?to))
    :effect (and
      (not (on-table ?v))
      (on ?v ?to)
      (clear ?v)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-table-to-table
    :parameters (?v - block)
    :precondition (and (vowel ?v) (on-table ?v) (clear ?v))
    :effect (and
      ; moving from table to another (new) table stack has no change in on-table;
      ; kept for completeness to allow "no-op" table-to-table moves if needed.
      (on-table ?v)
      (clear ?v)
    )
  )

  ;; Consonant agent actions (may only move consonant blocks). Same four schemas:
  (:action consonant-move-from-block-to-block
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

  (:action consonant-move-from-block-to-table
    :parameters (?c - block ?from - block)
    :precondition (and (consonant ?c) (on ?c ?from) (clear ?c))
    :effect (and
      (not (on ?c ?from))
      (on-table ?c)
      (clear ?c)
      (clear ?from)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?c - block ?to - block)
    :precondition (and (consonant ?c) (on-table ?c) (clear ?c) (clear ?to))
    :effect (and
      (not (on-table ?c))
      (on ?c ?to)
      (clear ?c)
      (not (clear ?to))
    )
  )

  (:action consonant-move-from-table-to-table
    :parameters (?c - block)
    :precondition (and (consonant ?c) (on-table ?c) (clear ?c))
    :effect (and
      ; as for vowels, a table-to-table move keeps it on-table; included for completeness
      (on-table ?c)
      (clear ?c)
    )
  )
)