(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - place agent)

  (:predicates
    (on ?b - block ?p - place)          ; block b is directly on place p (block or table)
    (clear ?b - block)                  ; no block on top of block b
    (holding ?a - agent ?b - block)     ; agent a is holding block b
    (handempty ?a - agent)              ; agent a holds nothing
    (vowel ?b - block)                  ; block label is a vowel (A,E,I)
    (consonant ?b - block)              ; block label is a consonant
    (vowel-agent ?a - agent)            ; agent is the vowel agent
    (consonant-agent ?a - agent)        ; agent is the consonant agent
  )

  ;; VOWEL AGENT ACTIONS

  (:action pick-up-vowel-from-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (vowel-agent ?a)
      (vowel ?b)
      (on ?b ?t)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?t))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  (:action pick-up-vowel-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
      (vowel-agent ?a)
      (vowel ?b)
      (on ?b ?p)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?p))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?p)
    )
  )

  (:action put-down-vowel-to-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (vowel-agent ?a)
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handempty ?a)
      (clear ?b)
    )
  )

  (:action put-down-vowel-to-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
      (vowel-agent ?a)
      (holding ?a ?b)
      (clear ?p)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?p)
      (handempty ?a)
      (not (clear ?p))
      (clear ?b)
    )
  )

  ;; CONSONANT AGENT ACTIONS

  (:action pick-up-consonant-from-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (consonant-agent ?a)
      (consonant ?b)
      (on ?b ?t)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?t))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  (:action pick-up-consonant-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
      (consonant-agent ?a)
      (consonant ?b)
      (on ?b ?p)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?p))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?p)
    )
  )

  (:action put-down-consonant-to-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (consonant-agent ?a)
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handempty ?a)
      (clear ?b)
    )
  )

  (:action put-down-consonant-to-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
      (consonant-agent ?a)
      (holding ?a ?b)
      (clear ?p)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?p)
      (handempty ?a)
      (not (clear ?p))
      (clear ?b)
    )
  )

)