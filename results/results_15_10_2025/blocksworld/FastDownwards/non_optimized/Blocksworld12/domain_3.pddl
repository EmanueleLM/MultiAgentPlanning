(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (block ?b)
    (vowel ?b)
    (consonant ?b)
    (vowel-agent ?ag)
    (consonant-agent ?ag)
    (orchestrator ?ag)
  )

  (:action move-vowel-block-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
                    (vowel-agent ?ag)
                    (vowel ?b)
                    (on ?b ?from)
                    (block ?from)
                    (block ?to)
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

  (:action move-vowel-table-to-block
    :parameters (?ag ?b ?to)
    :precondition (and
                    (vowel-agent ?ag)
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?b)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action move-vowel-block-to-table
    :parameters (?ag ?b ?from)
    :precondition (and
                    (vowel-agent ?ag)
                    (vowel ?b)
                    (on ?b ?from)
                    (block ?from)
                    (clear ?b)
                   )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action move-consonant-block-to-block
    :parameters (?ag ?x ?from ?to)
    :precondition (and
                    (consonant-agent ?ag)
                    (consonant ?x)
                    (on ?x ?from)
                    (block ?from)
                    (block ?to)
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

  (:action move-consonant-block-to-table
    :parameters (?ag ?x ?from)
    :precondition (and
                    (consonant-agent ?ag)
                    (consonant ?x)
                    (on ?x ?from)
                    (block ?from)
                    (clear ?x)
                   )
    :effect (and
             (not (on ?x ?from))
             (ontable ?x)
             (clear ?from)
             (clear ?x)
            )
  )

  (:action move-consonant-table-to-block
    :parameters (?ag ?x ?to)
    :precondition (and
                    (consonant-agent ?ag)
                    (consonant ?x)
                    (ontable ?x)
                    (clear ?x)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
             (not (ontable ?x))
             (on ?x ?to)
             (not (clear ?to))
             (clear ?x)
            )
  )
)