(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :disjunctive-preconditions :quantified-preconditions :equality)
  (:types block slot - place agent)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?x - place)
    (clear ?b - block)
    (free-slot ?s - slot)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (no-hold) ;; global predicate: no agent currently holds any block (enforces sequentiality)
  )

  ;; Vowel agent picks up a top vowel block from a slot (bottom of a stack)
  (:action pick-vowel-from-slot
    :parameters (?a - agent ?b - block ?below - slot)
    :precondition (and
      (vowel-agent ?a)
      (vowel ?b)
      (handempty ?a)
      (clear ?b)
      (on ?b ?below)
      (no-hold)
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (free-slot ?below)
      (not (no-hold))
    )
  )

  ;; Vowel agent picks up a top vowel block from another block
  (:action pick-vowel-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (vowel-agent ?a)
      (vowel ?b)
      (handempty ?a)
      (clear ?b)
      (on ?b ?below)
      (no-hold)
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
      (not (no-hold))
    )
  )

  ;; Vowel agent places the held vowel block onto a block
  (:action place-vowel-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (vowel-agent ?a)
      (holding ?a ?b)
      ;; cannot place onto a block that any other agent is holding
      (forall (?a2 - agent)
        (or (= ?a2 ?a) (not (holding ?a2 ?target)))
      )
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (clear ?target))
      (no-hold)
    )
  )

  ;; Vowel agent places the held vowel block onto a free slot (table)
  (:action place-vowel-on-slot
    :parameters (?a - agent ?b - block ?target - slot)
    :precondition (and
      (vowel-agent ?a)
      (holding ?a ?b)
      (free-slot ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (free-slot ?target))
      (no-hold)
    )
  )

  ;; Consonant agent picks up a top consonant block from a slot
  (:action pick-consonant-from-slot
    :parameters (?a - agent ?b - block ?below - slot)
    :precondition (and
      (consonant-agent ?a)
      (consonant ?b)
      (handempty ?a)
      (clear ?b)
      (on ?b ?below)
      (no-hold)
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (free-slot ?below)
      (not (no-hold))
    )
  )

  ;; Consonant agent picks up a top consonant block from another block
  (:action pick-consonant-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (consonant-agent ?a)
      (consonant ?b)
      (handempty ?a)
      (clear ?b)
      (on ?b ?below)
      (no-hold)
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
      (not (no-hold))
    )
  )

  ;; Consonant agent places the held consonant block onto a block
  (:action place-consonant-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (consonant-agent ?a)
      (holding ?a ?b)
      ;; cannot place onto a block that any other agent is holding
      (forall (?a2 - agent)
        (or (= ?a2 ?a) (not (holding ?a2 ?target)))
      )
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (clear ?target))
      (no-hold)
    )
  )

  ;; Consonant agent places the held consonant block onto a free slot (table)
  (:action place-consonant-on-slot
    :parameters (?a - agent ?b - block ?target - slot)
    :precondition (and
      (consonant-agent ?a)
      (holding ?a ?b)
      (free-slot ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (free-slot ?target))
      (no-hold)
    )
  )
)