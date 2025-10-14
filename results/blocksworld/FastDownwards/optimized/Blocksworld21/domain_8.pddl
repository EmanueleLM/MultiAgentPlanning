(define (domain vowel-consonant-blocks)
  (:requirements :typing :negative-preconditions)
  (:types agent place block - place vowel-block cons-block - block)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?p - place)
  )

  (:action vowel-move-b2b
    :parameters (?ag - agent ?b - vowel-block ?from - place ?to - place)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action vowel-move-b2table
    :parameters (?ag - agent ?b - vowel-block ?from - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action vowel-move-table2b
    :parameters (?ag - agent ?b - vowel-block ?to - place)
    :precondition (and (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )

  (:action cons-move-b2b
    :parameters (?ag - agent ?b - cons-block ?from - place ?to - place)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action cons-move-b2table
    :parameters (?ag - agent ?b - cons-block ?from - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action cons-move-table2b
    :parameters (?ag - agent ?b - cons-block ?to - place)
    :precondition (and (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )
)