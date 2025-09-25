(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions :equality :adl :fluents :action-costs)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:functions (total-cost))

  ;; Vowel agent actions (vowel_agent)
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (increase (total-cost) 1)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
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

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
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

  ;; Consonant agent actions (consonant_agent)
  (:action move-consonant-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?to)
      (on ?x ?from)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-consonant-from-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?to)
      (ontable ?x)
      (not (= ?x ?to))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (increase (total-cost) 1)
    )
  )
)