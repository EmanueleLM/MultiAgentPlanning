(define (domain vc-stacking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place - object)

  (:predicates
    (on ?b - block ?x - object)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

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