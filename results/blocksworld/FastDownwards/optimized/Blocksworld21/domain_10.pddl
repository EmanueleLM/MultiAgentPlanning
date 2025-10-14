(define (domain vowel-consonant-blocks)
  (:requirements :typing :negative-preconditions)
  (:types agent place block - object vowel_block cons_block - block)
  (:predicates
    (on ?b - block ?p - object)
    (clear ?p - object)
    (is-vowel-agent ?ag - agent)
    (is-cons-agent ?ag - agent)
  )

  (:action vowel-move-b2b
    :parameters (?ag - agent ?b - vowel_block ?from - object ?to - object)
    :precondition (and (is-vowel-agent ?ag) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action vowel-move-b2table
    :parameters (?ag - agent ?b - vowel_block ?from - object)
    :precondition (and (is-vowel-agent ?ag) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action vowel-move-table2b
    :parameters (?ag - agent ?b - vowel_block ?to - object)
    :precondition (and (is-vowel-agent ?ag) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )

  (:action cons-move-b2b
    :parameters (?ag - agent ?b - cons_block ?from - object ?to - object)
    :precondition (and (is-cons-agent ?ag) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action cons-move-b2table
    :parameters (?ag - agent ?b - cons_block ?from - object)
    :precondition (and (is-cons-agent ?ag) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action cons-move-table2b
    :parameters (?ag - agent ?b - cons_block ?to - object)
    :precondition (and (is-cons-agent ?ag) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )
)