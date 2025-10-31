(define (domain blocksworld-multiagent)
  (:requirements :strips :negative-preconditions :typing)
  (:types block place - obj)

  (:predicates
    (on ?b - block ?p - obj)
    (clear ?o - obj)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action consonant-move
    :parameters (?b - block ?from - obj ?to - obj)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-move
    :parameters (?b - block ?from - obj ?to - obj)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)