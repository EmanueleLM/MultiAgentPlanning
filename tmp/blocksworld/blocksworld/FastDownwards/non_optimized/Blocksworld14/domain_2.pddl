(define (domain stacking-multiagent)
  (:requirements :strips :negative-preconditions :equality :typing)
  (:types block agent)
  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  (:action vowel-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
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
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
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
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?a)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
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
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
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
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?a)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)