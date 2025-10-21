(define (domain BlocksworldScaling136)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)
  (:predicates
    (on ?b - block ?s - (either block table))
    (clear ?x - (either block table))
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Helper axioms are represented through careful init; actions enforce top-only moves.

  ;; Vowel agent moves a vowel block (top) from one surface (block or table) to another surface (block or table).
  (:action vowel-move
    :parameters (?b - block ?from - (either block table) ?to - (either block table))
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (not (clear ?b))
      (clear ?b) ;; ensures consistency: block ?b will be non-clear then set clear if top; kept for STRIPS compatibility
    )
  )

  ;; Consonant agent moves a consonant block (top) from one surface (block or table) to another surface (block or table).
  (:action consonant-move
    :parameters (?b - block ?from - (either block table) ?to - (either block table))
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
      (not (clear ?b))
      (clear ?b)
    )
  )
)