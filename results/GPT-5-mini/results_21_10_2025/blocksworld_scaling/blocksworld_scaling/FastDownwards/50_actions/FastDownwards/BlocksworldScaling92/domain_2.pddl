(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block place - object agent)

  (:predicates
    (on ?b - block ?p - object)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (istable ?p - place)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  ;; Vowel-agent: pick up a vowel block that is on another block
  (:action vowel-pickup-from-block
    :parameters (?agent - agent ?b - block ?below - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (clear ?b)
      (on ?b ?below)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Vowel-agent: pick up a vowel block that is on the table
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

  ;; Vowel-agent: place a held vowel block onto a clear block
  (:action vowel-place-on-block
    :parameters (?agent - agent ?b - block ?target - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (holding ?agent ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )

  ;; Vowel-agent: place a held vowel block on the table
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

  ;; Consonant-agent: pick up a consonant block that is on another block
  (:action consonant-pickup-from-block
    :parameters (?agent - agent ?b - block ?below - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (clear ?b)
      (on ?b ?below)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  ;; Consonant-agent: pick up a consonant block that is on the table
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

  ;; Consonant-agent: place a held consonant block onto a clear block
  (:action consonant-place-on-block
    :parameters (?agent - agent ?b - block ?target - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (holding ?agent ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding ?agent ?b))
      (handempty ?agent)
    )
  )

  ;; Consonant-agent: place a held consonant block on the table
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