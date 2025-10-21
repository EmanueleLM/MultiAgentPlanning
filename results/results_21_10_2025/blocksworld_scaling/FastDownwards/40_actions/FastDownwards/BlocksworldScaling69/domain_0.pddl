(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - place agent)

  (:predicates
    (on ?b - block ?p - place)
    (clear ?p - place)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent pickup from table
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
      ;; table remains conceptually clear; keep clear predicate for table if present
      (clear ?t)
    )
  )

  ;; Vowel-agent pickup from top of another block
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

  ;; Vowel-agent put down onto table
  (:action put-down-vowel-to-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (vowel-agent ?a)
      (holding ?a ?b)
      (clear ?t)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handempty ?a)
      (clear ?b)
      (clear ?t)
    )
  )

  ;; Vowel-agent put down onto another block
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

  ;; Consonant-agent pickup from table
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
      (clear ?t)
    )
  )

  ;; Consonant-agent pickup from top of another block
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

  ;; Consonant-agent put down onto table
  (:action put-down-consonant-to-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (consonant-agent ?a)
      (holding ?a ?b)
      (clear ?t)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handempty ?a)
      (clear ?b)
      (clear ?t)
    )
  )

  ;; Consonant-agent put down onto another block
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