(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; ?x directly on ?y
    (ontable ?x - block)            ; ?x is on the table
    (clear ?x - block)              ; nothing on ?x
    (vowel ?x - block)              ; block is a vowel (A,E,I)
    (consonant ?x - block)          ; block is a consonant (others)
  )

  ;; Vowel agent actions (only A,E,I may be moved)
  (:action vowel-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (not (on ?x ?from))
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (ontable ?x)
      (not (on ?x ?from))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (not (ontable ?x))
      (not (clear ?to))
      (clear ?x)
    )
  )

  ;; Consonant agent actions (only consonant letters may be moved)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (not (on ?x ?from))
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
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
      (ontable ?x)
      (not (on ?x ?from))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (not (ontable ?x))
      (not (clear ?to))
      (clear ?x)
    )
  )
)