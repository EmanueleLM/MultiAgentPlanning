(define (domain BlocksworldScaling136)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - surface)
  (:predicates
    (on ?b - block ?s - surface)
    (clear ?s - surface)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel-move
    :parameters (?b - block ?from - surface ?to - surface)
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

  (:action consonant-move
    :parameters (?b - block ?from - surface ?to - surface)
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