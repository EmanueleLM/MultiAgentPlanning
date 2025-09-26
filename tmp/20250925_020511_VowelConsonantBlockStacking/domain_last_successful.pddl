(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :disjunctive-preconditions :quantified-preconditions :equality)
  (:types block slot - place agent)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?x - place)         ; ?b is on ?x (where ?x is a block or a slot)
    (clear ?b - block)                 ; nothing on top of ?b
    (free-slot ?s - slot)              ; slot available to host a bottom block (i.e. a new stack can be created there)
    (holding ?a - agent ?b - block)    ; agent ?a holds block ?b
    (handempty ?a - agent)             ; agent ?a holds nothing
    (vowel-agent ?a - agent)           ; identifies vowel_agent
    (consonant-agent ?a - agent)       ; identifies consonant_agent
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
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (free-slot ?below)
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
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
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
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (free-slot ?below)
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
    )
    :effect (and
      (holding ?a ?b)
      (not (handempty ?a))
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)
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
    )
  )
)