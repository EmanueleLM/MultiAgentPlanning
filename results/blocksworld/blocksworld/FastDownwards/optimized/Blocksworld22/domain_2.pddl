(define (domain multiagent-blocks)
  (:requirements :strips)
  (:predicates
    (agent ?a)
    (vowel-agent ?a)
    (consonant-agent ?a)
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (vowel ?b)
    (consonant ?b)
  )

  (:action vowel-move-block-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
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
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?ag ?b ?to)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?ag ?b ?from)
    :precondition (and
      (agent ?ag)
      (vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (not (on ?b ?from))
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?ag ?b ?to)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?ag ?b ?from)
    :precondition (and
      (agent ?ag)
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (not (on ?b ?from))
      (clear ?from)
    )
  )
)