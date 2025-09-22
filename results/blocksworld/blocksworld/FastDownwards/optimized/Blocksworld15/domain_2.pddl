(define (domain blocks_multi_agent)
  (:requirements :strips :typing :equality :negative-preconditions :action-costs)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )
  (:functions (total-cost))

  (:action vowel-agent-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action vowel-agent-move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (increase (total-cost) 1)
    )
  )

  (:action vowel-agent-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action consonant-agent-move-from-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action consonant-agent-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action consonant-agent-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (increase (total-cost) 1)
    )
  )
)