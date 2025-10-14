(define (domain blocks-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block place - loc)
  (:predicates
    (on ?b - block ?p - loc)
    (clear ?p - loc)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel-move
    :parameters (?b - block ?from - loc ?to - loc)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move
    :parameters (?b - block ?from - loc ?to - loc)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)