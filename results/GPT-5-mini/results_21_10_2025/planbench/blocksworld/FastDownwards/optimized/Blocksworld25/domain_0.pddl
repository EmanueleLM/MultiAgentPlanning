(define (domain combined-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y (both blocks)
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing is on ?x (it is the top of its stack)
    (vowel ?x - block)            ; block that vowel agent may move
    (consonant ?x - block)        ; block that consonant agent may move
  )

  ;; Vowel agent actions (prefix with vowel-)
  (:action vowel-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (clear ?x)
      (clear ?to)
      (on ?x ?from)
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
      (clear ?x)
      (on ?x ?from)
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
      (clear ?x)
      (ontable ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (not (ontable ?x))
      (not (clear ?to))
      (clear ?x)
    )
  )

  ;; Consonant agent actions (prefix with consonant-)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)