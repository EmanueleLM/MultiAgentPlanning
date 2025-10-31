(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types object block place agent)

  (:predicates
    ;; block b is directly on object p (p is a block or a place)
    (on ?b - block ?p - object)
    ;; block is clear (no block on top)
    (clear ?b - block)
    ;; agent is holding a block
    (holding ?a - agent ?b - block)
    ;; agent hand is empty
    (handempty ?a - agent)
    ;; membership
    (vowel ?b - block)
    (consonant ?b - block)
    ;; place marker
    (istable ?p - place)
    ;; agent roles
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  ;; VOCABULARY:
  ;; - Agents may only pick up top blocks (clear) and only one block at a time (handempty/holding).
  ;; - Vowel agent may only move blocks marked vowel.
  ;; - Consonant agent may only move blocks marked consonant.
  ;; - Targets for placing may be any clear block or a table place.

  ;; Vowel-agent: pick up a vowel block that is on another block
  (:action vowel-pickup-from-block
    :parameters (?agent - agent ?b - block ?below - object)
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
      ;; if ?below is a block, it becomes clear; if it's a place, no clear predicate applies
      (when (and (not (istable ?below))) (clear ?below))
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
    :parameters (?agent - agent ?b - block ?below - object)
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
      (when (and (not (istable ?below))) (clear ?below))
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