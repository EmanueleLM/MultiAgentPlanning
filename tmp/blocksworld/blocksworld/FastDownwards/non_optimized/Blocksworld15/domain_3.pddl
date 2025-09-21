(define (domain multi_agent_blocks)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?p - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (is_vowel_agent ?a - agent)
    (is_consonant_agent ?a - agent)
  )

  (:action vowel-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
                    (is_vowel_agent ?ag)
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

  (:action vowel-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is_vowel_agent ?ag)
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

  (:action vowel-move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is_vowel_agent ?ag)
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

  (:action consonant-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
                    (is_consonant_agent ?ag)
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

  (:action consonant-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is_consonant_agent ?ag)
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
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is_consonant_agent ?ag)
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