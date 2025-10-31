(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)
  (:predicates
    (on ?b - block ?p - (either block table))
    (clear ?p - (either block table))
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent moves a vowel block from one surface (block or table) to another surface.
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
    )
  )

  ;; Consonant agent moves a consonant block from one surface (block or table) to another surface.
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
    )
  )
)