(define (domain vowel-consonant-blocks)
  (:requirements :typing :negative-preconditions)
  (:types agent place block - place vowel-block cons-block - block)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?p - place)
  )
  (:action vowel-move
    :parameters (?ag - agent ?b - vowel-block ?from - place ?to - place)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )
  (:action cons-move
    :parameters (?ag - agent ?b - cons-block ?from - place ?to - place)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )
)