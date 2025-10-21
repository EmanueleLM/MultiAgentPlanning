(define (domain multiagent-blocksworld22)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (is-agent ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (can-move ?a - agent ?b - block)
  )

  (:action vowel-move-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?a - agent ?x - block ?to - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?x)
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-block
    :parameters (?a - agent ?x - block ?from - block ?to - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?x)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?a - agent ?x - block ?from - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?x)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )
)