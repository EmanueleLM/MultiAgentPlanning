(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  ;; types: blocks are also places so blocks can be used as stack locations
  (:types place agent)
  (:types block - place)

  (:predicates
    (on ?b - block ?p - place)        ; block b is directly on place p (block or table)
    (clear ?b - block)               ; block b has nothing on top
    (handempty ?a - agent)           ; agent a has empty hand
    (holding ?a - agent ?b - block)  ; agent a is holding block b
    (vowel ?b - block)               ; block is vowel-labeled
    (consonant ?b - block)           ; block is consonant-labeled
    (v-agent ?a - agent)             ; agent is the vowel-only agent
    (c-agent ?a - agent)             ; agent is the consonant-only agent
  )

  ;; Vowel-agent actions (operate only on vowel blocks A,E,I)
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

  ;; Consonant-agent actions (operate only on consonant blocks)
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