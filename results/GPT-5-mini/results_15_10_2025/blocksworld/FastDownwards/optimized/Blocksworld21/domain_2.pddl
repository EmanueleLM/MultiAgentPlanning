(define (domain vowel-consonant-blocks)
  (:requirements :typing :negative-preconditions)
  (:types
    vowel-block cons-block - block
    block loc agent
  )
  (:predicates
    (on ?b - block ?l - loc)
    (clear ?l - loc)
  )
  (:action vowel-move
    :parameters (?ag - agent ?b - vowel-block ?from - loc ?to - loc)
    :precondition (and (on ?b ?from) (clear ?from) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (not (clear ?to)) (clear ?from))
  )
  (:action cons-move
    :parameters (?ag - agent ?b - cons-block ?from - loc ?to - loc)
    :precondition (and (on ?b ?from) (clear ?from) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (not (clear ?to)) (clear ?from))
  )
)