(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on ?y (both blocks)
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing is on ?x (top)
  )

  ;; Vowel agent actions: can only move vowel-typed blocks (A, E, I).
  (:action vowel-move-from-block-to-block
    :parameters (?v - vowel ?from - block ?to - block)
    :precondition (and (on ?v ?from) (clear ?v) (clear ?to))
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?v - vowel ?from - block)
    :precondition (and (on ?v ?from) (clear ?v))
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?from)
      (clear ?v)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?v - vowel ?to - block)
    :precondition (and (ontable ?v) (clear ?v) (clear ?to))
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
    )
  )

  ;; Consonant agent actions: can only move consonant-typed blocks (all others).
  (:action consonant-move-from-block-to-block
    :parameters (?c - consonant ?from - block ?to - block)
    :precondition (and (on ?c ?from) (clear ?c) (clear ?to))
    :effect (and
      (not (on ?c ?from))
      (on ?c ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?c)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?c - consonant ?from - block)
    :precondition (and (on ?c ?from) (clear ?c))
    :effect (and
      (not (on ?c ?from))
      (ontable ?c)
      (clear ?from)
      (clear ?c)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?c - consonant ?to - block)
    :precondition (and (ontable ?c) (clear ?c) (clear ?to))
    :effect (and
      (not (ontable ?c))
      (on ?c ?to)
      (not (clear ?to))
      (clear ?c)
    )
  )
)