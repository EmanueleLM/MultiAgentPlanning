(define (domain vc-stacking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - object)

  (:predicates
    (on ?b - block ?x - object)    ; block ?b is directly on object ?x (block or table)
    (ontable ?b - block)          ; block ?b is directly on the table
    (clear ?b - block)            ; block ?b has nothing on top (is top of its stack)
    (vowel ?b - block)            ; block is a vowel (movable only by vowel-agent)
    (consonant ?b - block)        ; block is a consonant (movable only by consonant-agent)
  )

  ;; VOWEL AGENT ACTIONS
  ;; Move a vowel from a block onto a block
  (:action move-vowel-from-block-to-block
    :parameters (?v - block ?from - block ?to - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
      (clear ?from)
      (not (ontable ?v))
    )
  )

  ;; Move a vowel from the table onto a block
  (:action move-vowel-from-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?v))
      (not (on ?v table))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
    )
  )

  ;; Move a vowel from a block onto the table
  (:action move-vowel-from-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v table)
      (ontable ?v)
      (clear ?from)
      (clear ?v)
    )
  )

  ;; CONSONANT AGENT ACTIONS
  ;; Move a consonant from a block onto a block
  (:action move-consonant-from-block-to-block
    :parameters (?c - block ?from - block ?to - block)
    :precondition (and
      (consonant ?c)
      (on ?c ?from)
      (clear ?c)
      (clear ?to)
    )
    :effect (and
      (not (on ?c ?from))
      (on ?c ?to)
      (not (clear ?to))
      (clear ?c)
      (clear ?from)
      (not (ontable ?c))
    )
  )

  ;; Move a consonant from the table onto a block
  (:action move-consonant-from-table-to-block
    :parameters (?c - block ?to - block)
    :precondition (and
      (consonant ?c)
      (ontable ?c)
      (clear ?c)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?c))
      (not (on ?c table))
      (on ?c ?to)
      (not (clear ?to))
      (clear ?c)
    )
  )

  ;; Move a consonant from a block onto the table
  (:action move-consonant-from-block-to-table
    :parameters (?c - block ?from - block)
    :precondition (and
      (consonant ?c)
      (on ?c ?from)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?from))
      (on ?c table)
      (ontable ?c)
      (clear ?from)
      (clear ?c)
    )
  )
)