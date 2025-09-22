(define (domain multiagent-blocks)
  (:requirements :strips :typing :equality :negative-preconditions :fluents :action-costs)
  (:types block agent)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (agent ?a - agent)
  )

  (:functions (total-cost))

  ;; Vowel-agent actions
  (:action vowel_agent-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action vowel_agent-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action vowel_agent-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  ;; Consonant-agent actions
  (:action consonant_agent-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (agent ?ag)
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
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action consonant_agent-move-from-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (agent ?ag)
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
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action consonant_agent-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (increase (total-cost) 1)
    )
  )
)