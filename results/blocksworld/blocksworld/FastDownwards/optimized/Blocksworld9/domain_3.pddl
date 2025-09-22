(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types block)
  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

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

  (:action consonant-move-from-block-to-block
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

  (:action consonant-move-from-table-to-block
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

  (:action consonant-move-from-block-to-table
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
)