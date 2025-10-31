(define (domain blocksworld-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

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