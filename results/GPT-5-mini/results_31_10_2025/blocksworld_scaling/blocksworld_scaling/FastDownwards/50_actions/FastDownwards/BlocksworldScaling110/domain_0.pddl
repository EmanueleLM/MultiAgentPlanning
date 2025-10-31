(define (domain multiagent-blocks)
  :requirements :typing :strips :negative-preconditions
  :types block

  :predicates
    (on ?x - block ?y - block)        ; x is immediately on block y
    (ontable ?x - block)              ; x is directly on the table
    (clear ?x - block)                ; x has nothing on top (is top-of-stack)
    (vowel ?x - block)                ; x is a vowel (movable by vowel-agent)
    (consonant ?x - block)            ; x is a consonant (movable by consonant-agent)
  )

  ;; Vowel-agent atomic move actions (move a single vowel block from a block or table to a block or to the table)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
        (vowel ?b)
        (on ?b ?from)
        (clear ?b)
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

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
        (vowel ?b)
        (on ?b ?from)
        (clear ?b)
    )
    :effect (and
        (not (on ?b ?from))
        (ontable ?b)
        (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
        (vowel ?b)
        (ontable ?b)
        (clear ?b)
        (clear ?to)
        (not (= ?b ?to))
    )
    :effect (and
        (not (ontable ?b))
        (on ?b ?to)
        (not (clear ?to))
    )
  )

  ;; Consonant-agent atomic move actions (move a single consonant block from a block or table to a block or to the table)
  (:action cons-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
        (consonant ?b)
        (on ?b ?from)
        (clear ?b)
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

  (:action cons-move-block-to-table
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

  (:action cons-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
        (consonant ?b)
        (ontable ?b)
        (clear ?b)
        (clear ?to)
        (not (= ?b ?to))
    )
    :effect (and
        (not (ontable ?b))
        (on ?b ?to)
        (not (clear ?to))
    )
  )
)