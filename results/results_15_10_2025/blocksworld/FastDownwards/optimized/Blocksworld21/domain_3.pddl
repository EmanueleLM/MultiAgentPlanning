(define (domain vowel-consonant-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block loc agent
          vowel-block cons-block - block)
  (:predicates
    (on ?b - block ?l - loc)
    (clear ?l - loc)
  )
  (:action vowel-move
    :parameters (?ag - agent ?b - vowel-block ?from - loc ?to - loc)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )
  (:action cons-move
    :parameters (?ag - agent ?b - cons-block ?from - loc ?to - loc)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )
)