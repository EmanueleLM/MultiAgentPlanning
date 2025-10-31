(define (domain vowel-consonant-blocks)
  (:requirements :typing)
  (:types agent place block - place vowel_block cons_block - block)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?p - place)
    (is-vowel-agent ?ag - agent)
    (is-cons-agent ?ag - agent)
  )

  (:action vowel-move-b2b
    :parameters (?ag - agent ?b - vowel_block ?from - block ?to - block)
    :precondition (and (is-vowel-agent ?ag) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action vowel-move-b2table
    :parameters (?ag - agent ?b - vowel_block ?from - block)
    :precondition (and (is-vowel-agent ?ag) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action vowel-move-table2b
    :parameters (?ag - agent ?b - vowel_block ?to - block)
    :precondition (and (is-vowel-agent ?ag) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )

  (:action cons-move-b2b
    :parameters (?ag - agent ?b - cons_block ?from - block ?to - block)
    :precondition (and (is-cons-agent ?ag) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
  )

  (:action cons-move-b2table
    :parameters (?ag - agent ?b - cons_block ?from - block)
    :precondition (and (is-cons-agent ?ag) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (on ?b table) (clear ?from))
  )

  (:action cons-move-table2b
    :parameters (?ag - agent ?b - cons_block ?to - block)
    :precondition (and (is-cons-agent ?ag) (on ?b table) (clear ?b) (clear ?to))
    :effect (and (not (on ?b table)) (on ?b ?to) (not (clear ?to)))
  )
)