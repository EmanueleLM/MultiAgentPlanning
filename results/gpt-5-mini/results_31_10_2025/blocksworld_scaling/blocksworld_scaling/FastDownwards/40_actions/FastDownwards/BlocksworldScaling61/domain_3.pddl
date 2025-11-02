(define (domain blocksworld-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types place agent block - place)
  (:constants table - place)

  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (v-agent ?a - agent)
    (c-agent ?a - agent)
  )

  (:action vowel-pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (on ?b table)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b table))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (clear ?b))
            )
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?p - block)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (on ?b ?p)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?p)
              (not (clear ?b))
            )
  )

  (:action vowel-stack
    :parameters (?ag - agent ?b - block ?p - block)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (holding ?ag ?b)
                    (clear ?p)
                  )
    :effect (and
              (on ?b ?p)
              (clear ?b)
              (not (clear ?p))
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (on ?b table)
              (clear ?b)
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )

  (:action consonant-pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (on ?b table)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b table))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (clear ?b))
            )
  )

  (:action consonant-unstack
    :parameters (?ag - agent ?b - block ?p - block)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (on ?b ?p)
                    (clear ?b)
                    (handempty ?ag)
                  )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?p)
              (not (clear ?b))
            )
  )

  (:action consonant-stack
    :parameters (?ag - agent ?b - block ?p - block)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (holding ?ag ?b)
                    (clear ?p)
                  )
    :effect (and
              (on ?b ?p)
              (clear ?b)
              (not (clear ?p))
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )

  (:action consonant-putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (on ?b table)
              (clear ?b)
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )
)