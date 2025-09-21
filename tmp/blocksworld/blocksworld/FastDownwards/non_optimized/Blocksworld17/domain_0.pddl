(define (domain combined-blocks)
  (:requirements :typing :strips :equality :negative-preconditions)
  (:types block table - place)

  ;; a single named table constant for the world
  (:constants table - table)

  (:predicates
    (vowel ?b - block)           ; vowel blocks that vowel-agent can move
    (consonant ?b - block)       ; consonant blocks that consonant-agent can move
    (on ?b - block ?p - place)   ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)           ; nothing on top of block ?b
  )

  ;; Vowel-agent actions (kept distinct, prefixed with vowel-)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b table)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; Consonant-agent actions (kept distinct, prefixed with consonant-)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x table)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x table))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )
)