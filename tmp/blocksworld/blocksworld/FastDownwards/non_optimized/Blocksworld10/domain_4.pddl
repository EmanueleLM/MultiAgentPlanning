(define (domain combined-blocks)
  (:requirements :strips :typing)
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

  (:action move-vowel-by-agent-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (clear ?from)
      (clear ?b)
      (not (on ?b ?from))
      (not (clear ?to))
      (not (ontable ?b))
    )
  )

  (:action move-vowel-by-agent-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (clear ?b)
      (not (clear ?to))
    )
  )

  (:action move-vowel-by-agent-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (not (on ?b ?from))
    )
  )

  (:action move-consonant-by-agent-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (clear ?from)
      (clear ?b)
      (not (on ?b ?from))
      (not (clear ?to))
      (not (ontable ?b))
    )
  )

  (:action move-consonant-by-agent-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (clear ?b)
      (not (clear ?to))
    )
  )

  (:action move-consonant-by-agent-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (not (on ?b ?from))
    )
  )
)