(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :adl)
  (:types block slot agent)

  (:predicates
    (block ?b)                ; identifies block objects
    (slot ?s)                 ; identifies table slot objects (max stacks)
    (vowel ?b)
    (consonant ?b)
    (on ?b ?x)                ; ?b is on ?x (where ?x is a block or a slot)
    (clear ?b)                ; nothing on top of ?b
    (free-slot ?s)            ; slot available to host a bottom block (i.e. a new stack can be created there)
    (holding ?a ?b)           ; agent ?a holds block ?b
    (handempty ?a)           ; agent ?a holds nothing
  )

  ;; Vowel agent picks up a top vowel block
  (:action pick-vowel
    :parameters (?b - block ?below)
    :precondition (and
      (vowel ?b)
      (handempty vowel_agent)
      (clear ?b)
      (on ?b ?below)
    )
    :effect (and
      (holding vowel_agent ?b)
      (not (handempty vowel_agent))
      (not (on ?b ?below))
      (not (clear ?b))
      ;; If the block was on a slot, that slot becomes free (stack removed)
      (when (slot ?below)
        (free-slot ?below)
      )
      ;; If the block was on another block, that below block becomes clear
      (when (block ?below)
        (clear ?below)
      )
    )
  )

  ;; Vowel agent places the held vowel block onto a block or onto a free slot (table)
  (:action place-vowel
    :parameters (?b - block ?target)
    :precondition (and
      (holding vowel_agent ?b)
      ;; cannot place onto a block that the other agent is holding
      (or (slot ?target) (and (block ?target) (not (holding consonant_agent ?target))))
      ;; if target is a block it must be clear; if target is a slot it must be free
      (or (and (block ?target) (clear ?target)) (and (slot ?target) (free-slot ?target)))
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
      ;; If placed on a block, that target loses clear
      (when (block ?target)
        (not (clear ?target))
      )
      ;; If placed on a slot, that slot is no longer free (a new stack created)
      (when (slot ?target)
        (not (free-slot ?target))
      )
    )
  )

  ;; Consonant agent picks up a top consonant block
  (:action pick-consonant
    :parameters (?b - block ?below)
    :precondition (and
      (consonant ?b)
      (handempty consonant_agent)
      (clear ?b)
      (on ?b ?below)
    )
    :effect (and
      (holding consonant_agent ?b)
      (not (handempty consonant_agent))
      (not (on ?b ?below))
      (not (clear ?b))
      (when (slot ?below)
        (free-slot ?below)
      )
      (when (block ?below)
        (clear ?below)
      )
    )
  )

  ;; Consonant agent places the held consonant block onto a block or onto a free slot (table)
  (:action place-consonant
    :parameters (?b - block ?target)
    :precondition (and
      (holding consonant_agent ?b)
      ;; cannot place onto a block that the other agent is holding
      (or (slot ?target) (and (block ?target) (not (holding vowel_agent ?target))))
      ;; if target is a block it must be clear; if target is a slot it must be free
      (or (and (block ?target) (clear ?target)) (and (slot ?target) (free-slot ?target)))
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
      (when (block ?target)
        (not (clear ?target))
      )
      (when (slot ?target)
        (not (free-slot ?target))
      )
    )
  )
)