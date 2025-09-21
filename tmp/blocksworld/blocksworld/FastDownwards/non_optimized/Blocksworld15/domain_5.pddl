(define (domain multi_agent_blocks)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?b - block ?p - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (is_vowel_agent ?a - agent)
    (is_consonant_agent ?a - agent)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
  )

  (:action vowel-pick-block-from-block
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is_vowel_agent ?ag)
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b ?from))
              (holding ?ag ?b)
              (not (handempty ?ag))
              (clear ?from)
            )
  )

  (:action vowel-pick-block-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (is_vowel_agent ?ag)
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (ontable ?b))
              (holding ?ag ?b)
              (not (handempty ?ag))
            )
  )

  (:action vowel-place-block-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is_vowel_agent ?ag)
                    (vowel ?b)
                    (holding ?ag ?b)
                    (clear ?to)
                    (not (= ?b ?to))
                  )
    :effect (and
              (not (holding ?ag ?b))
              (on ?b ?to)
              (handempty ?ag)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel-place-block-to-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (is_vowel_agent ?ag)
                    (vowel ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (ontable ?b)
              (handempty ?ag)
              (clear ?b)
            )
  )

  (:action consonant-pick-block-from-block
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is_consonant_agent ?ag)
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b ?from))
              (holding ?ag ?b)
              (not (handempty ?ag))
              (clear ?from)
            )
  )

  (:action consonant-pick-block-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (is_consonant_agent ?ag)
                    (consonant ?b)
                    (ontable ?b)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (ontable ?b))
              (holding ?ag ?b)
              (not (handempty ?ag))
            )
  )

  (:action consonant-place-block-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is_consonant_agent ?ag)
                    (consonant ?b)
                    (holding ?ag ?b)
                    (clear ?to)
                    (not (= ?b ?to))
                  )
    :effect (and
              (not (holding ?ag ?b))
              (on ?b ?to)
              (handempty ?ag)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action consonant-place-block-to-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (is_consonant_agent ?ag)
                    (consonant ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (ontable ?b)
              (handempty ?ag)
              (clear ?b)
            )
  )
)