(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel-agent actions: can only move vowels (A, E, I)
  (:action vowel-move-from-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (not (clear ?to))
      (on ?x ?to)
      (clear ?from)
      (clear ?x)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (not (clear ?to))
      (on ?x ?to)
      (clear ?x)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions: can only move consonants (all non-vowels)
  (:action consonant-move-from-block-to-block
    :parameters (?x - consonant ?from - block ?to - block)
    :precondition (and (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (not (clear ?to))
      (on ?x ?to)
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - consonant ?to - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (not (clear ?to))
      (on ?x ?to)
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?x - consonant ?from - block)
    :precondition (and (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )
)