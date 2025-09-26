(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types block slot agent)
  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (on-block ?b - block ?p - block)
    (on-slot ?b - block ?s - slot)
    (clear ?b - block)
    (hand-empty ?a - agent)
    (holding ?a - agent ?b - block)
    (held ?b - block)
    (slot-empty ?s - slot)
  )

  (:action pick-vowel-from-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (hand-empty ?a)
      (on-slot ?b ?s)
      (clear ?b)
    )
    :effect (and
      (not (on-slot ?b ?s))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (slot-empty ?s)
      (held ?b)
    )
  )

  (:action pick-vowel-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (hand-empty ?a)
      (on-block ?b ?below)
      (clear ?b)
      (not (= ?b ?below))
    )
    :effect (and
      (not (on-block ?b ?below))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (clear ?below)
      (held ?b)
    )
  )

  (:action place-vowel-on-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (holding ?a ?b)
      (slot-empty ?s)
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on-slot ?b ?s)
      (not (slot-empty ?s))
      (clear ?b)
      (not (held ?b))
    )
  )

  (:action place-vowel-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (holding ?a ?b)
      (clear ?target)
      (not (held ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on-block ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (held ?b))
    )
  )

  (:action pick-consonant-from-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (hand-empty ?a)
      (on-slot ?b ?s)
      (clear ?b)
    )
    :effect (and
      (not (on-slot ?b ?s))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (slot-empty ?s)
      (held ?b)
    )
  )

  (:action pick-consonant-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (hand-empty ?a)
      (on-block ?b ?below)
      (clear ?b)
      (not (= ?b ?below))
    )
    :effect (and
      (not (on-block ?b ?below))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (clear ?below)
      (held ?b)
    )
  )

  (:action place-consonant-on-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (holding ?a ?b)
      (slot-empty ?s)
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on-slot ?b ?s)
      (not (slot-empty ?s))
      (clear ?b)
      (not (held ?b))
    )
  )

  (:action place-consonant-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (holding ?a ?b)
      (clear ?target)
      (not (held ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on-block ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (held ?b))
    )
  )
)