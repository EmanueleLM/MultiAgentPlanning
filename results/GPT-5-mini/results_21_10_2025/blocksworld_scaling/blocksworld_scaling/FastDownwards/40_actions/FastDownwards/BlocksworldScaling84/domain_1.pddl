(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on top of block ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; nothing is on ?x (it is a top block)
  )

  ;; Vowel-agent actions: can move only vowel-typed blocks (A E I).
  (:action vowel-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions: can move only consonant-typed blocks.
  (:action consonant-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)