(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block place object)
  (:predicates
    (on ?b - block ?p - object)
    (clear ?x - object)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (v-agent ?a - agent)
    (c-agent ?a - agent)
  )

  (:action vowel-pickup
    :parameters (?ag - agent ?b - block ?t - object)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (handempty ?ag)
                    (on ?b ?t)
                    (clear ?b)
                    (not (holding ?ag ?b))
                  )
    :effect (and
              (not (on ?b ?t))
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
                    (handempty ?ag)
                    (on ?b ?p)
                    (clear ?b)
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
    :parameters (?ag - agent ?b - block ?p - object)
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
    :parameters (?ag - agent ?b - block ?t - object)
    :precondition (and
                    (v-agent ?ag)
                    (vowel ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )

  (:action consonant-pickup
    :parameters (?ag - agent ?b - block ?t - object)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (handempty ?ag)
                    (on ?b ?t)
                    (clear ?b)
                    (not (holding ?ag ?b))
                  )
    :effect (and
              (not (on ?b ?t))
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
                    (handempty ?ag)
                    (on ?b ?p)
                    (clear ?b)
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
    :parameters (?ag - agent ?b - block ?p - object)
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
    :parameters (?ag - agent ?b - block ?t - object)
    :precondition (and
                    (c-agent ?ag)
                    (consonant ?b)
                    (holding ?ag ?b)
                  )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?ag ?b))
              (handempty ?ag)
            )
  )
)