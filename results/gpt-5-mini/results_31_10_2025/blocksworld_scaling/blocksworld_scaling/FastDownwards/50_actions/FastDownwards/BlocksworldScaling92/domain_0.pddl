(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types place agent block - place)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (istable ?p - place)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  ;; Vowel-agent pickup from a block (target is a block underneath)
  (:action vowel-pickup-from-block
    :parameters (?agent - agent ?b - block ?p - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (clear ?b)
      (on ?b ?p)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (clear ?p)
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Vowel-agent pickup from the table
  (:action vowel-pickup-from-table
    :parameters (?agent - agent ?b - block ?p - place)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (clear ?b)
      (on ?b ?p)
      (istable ?p)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Vowel-agent place onto a block; restrict target to vowel blocks only (hard constraint)
  (:action vowel-place-on-block
    :parameters (?agent - agent ?b - block ?p - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (holding ?agent ?b)
      (clear ?p)
      (vowel ?p)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )

  ;; Vowel-agent place on table
  (:action vowel-place-on-table
    :parameters (?agent - agent ?b - block ?p - place)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (holding ?agent ?b)
      (istable ?p)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )

  ;; Consonant-agent pickup from a block
  (:action consonant-pickup-from-block
    :parameters (?agent - agent ?b - block ?p - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (clear ?b)
      (on ?b ?p)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (clear ?p)
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Consonant-agent pickup from the table
  (:action consonant-pickup-from-table
    :parameters (?agent - agent ?b - block ?p - place)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (clear ?b)
      (on ?b ?p)
      (istable ?p)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Consonant-agent place onto a block (no restriction on target type)
  (:action consonant-place-on-block
    :parameters (?agent - agent ?b - block ?p - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (holding ?agent ?b)
      (clear ?p)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )

  ;; Consonant-agent place on table
  (:action consonant-place-on-table
    :parameters (?agent - agent ?b - block ?p - place)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (holding ?agent ?b)
      (istable ?p)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )
)