(define (domain orchestrator)
  (:requirements :typing :negative-preconditions)
  (:types place block slot agent)
  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (on ?b - block ?p - place)          ; b is on place p (place = block or slot)
    (clear ?b - block)                  ; no block on b
    (hand-empty ?a - agent)
    (holding ?a - agent ?b - block)
    (slot-empty ?s - slot)
  )

  ;; Vowel agent: picking from a slot (single-block stack)
  (:action pick-vowel-from-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (hand-empty ?a)
      (on ?b ?s)
      (clear ?b)
      (not (slot-empty ?s)) )
    :effect (and
      (not (on ?b ?s))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (slot-empty ?s)
    )
  )

  ;; Vowel agent: picking from on top of another block
  (:action pick-vowel-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (hand-empty ?a)
      (on ?b ?below)
      (clear ?b)
      (not (= ?b ?below)) )
    :effect (and
      (not (on ?b ?below))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (clear ?below)
    )
  )

  ;; Vowel agent: place on an empty slot (create a new stack bottom)
  (:action place-vowel-on-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (holding ?a ?b)
      (slot-empty ?s) )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on ?b ?s)
      (not (slot-empty ?s))
      (clear ?b)
    )
  )

  ;; Vowel agent: place on top of a block
  (:action place-vowel-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?a)
      (holding ?a ?b)
      (clear ?target)
      ;; cannot place on a block that is currently held by either agent
      (not (holding ?a ?target))
      (not (holding vowel_agent ?target))
      (not (holding consonant_agent ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
    )
  )

  ;; Consonant agent: picking from a slot
  (:action pick-consonant-from-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (hand-empty ?a)
      (on ?b ?s)
      (clear ?b)
      (not (slot-empty ?s)) )
    :effect (and
      (not (on ?b ?s))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (slot-empty ?s)
    )
  )

  ;; Consonant agent: picking from on top of another block
  (:action pick-consonant-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (hand-empty ?a)
      (on ?b ?below)
      (clear ?b)
      (not (= ?b ?below)) )
    :effect (and
      (not (on ?b ?below))
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (clear ?b))
      (clear ?below)
    )
  )

  ;; Consonant agent: place on an empty slot (create a new stack bottom)
  (:action place-consonant-on-slot
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (holding ?a ?b)
      (slot-empty ?s) )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on ?b ?s)
      (not (slot-empty ?s))
      (clear ?b)
    )
  )

  ;; Consonant agent: place on top of a block
  (:action place-consonant-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?a)
      (holding ?a ?b)
      (clear ?target)
      ;; cannot place on a block that is currently held by either agent
      (not (holding ?a ?target))
      (not (holding vowel_agent ?target))
      (not (holding consonant_agent ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (hand-empty ?a)
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
    )
  )
)