(define (domain multi_agent_blocks)
  (:requirements :strips :equality)
  (:predicates
    (block ?b)
    (agent ?ag)
    (vowel-agent ?ag)
    (consonant-agent ?ag)
    (vowel ?b)
    (consonant ?b)
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
  )

  (:action move-vowel-by-agent-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
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

  (:action move-vowel-by-agent-table-to-block
    :parameters (?ag ?b ?to)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
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
    )
  )

  (:action move-vowel-by-agent-block-to-table
    :parameters (?ag ?b ?from)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action move-consonant-by-agent-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
      (agent ?ag)
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
    )
  )

  (:action move-consonant-by-agent-table-to-block
    :parameters (?ag ?b ?to)
    :precondition (and
      (agent ?ag)
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
    )
  )

  (:action move-consonant-by-agent-block-to-table
    :parameters (?ag ?b ?from)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
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