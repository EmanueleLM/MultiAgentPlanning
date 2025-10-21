(define (domain blocks-vowel-consonant)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

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