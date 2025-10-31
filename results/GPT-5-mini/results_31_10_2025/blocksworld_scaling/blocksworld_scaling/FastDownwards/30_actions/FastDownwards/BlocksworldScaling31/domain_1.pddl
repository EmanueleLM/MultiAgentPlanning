(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)    ; ?x directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; nothing on ?x (it is a top)
  )

  ;; Vowel-agent actions (can only move vowels: A, E, I)
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (can only move consonants)
  (:action consonant-move-block-to-block
    :parameters (?x - consonant ?from - block ?to - block)
    :precondition (and (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - consonant ?to - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-block-to-table
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