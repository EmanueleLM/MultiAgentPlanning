(define (domain multi_agent_blocks_with_hands)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)
  (:predicates
    (on ?x - block ?y - place)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (handempty_vowel)
    (handempty_consonant)
    (holding_vowel ?x - block)
    (holding_consonant ?x - block)
  )

  ;; Vowel-agent actions (can only move blocks marked (vowel ?b))

  (:action vowel_pickup_from_table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (handempty_vowel)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (handempty_vowel))
      (holding_vowel ?b)
      (not (clear ?b))
    )
  )

  (:action vowel_unstack_from_block
    :parameters (?b - block ?under - block)
    :precondition (and
      (vowel ?b)
      (handempty_vowel)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (holding_vowel ?b)
      (not (handempty_vowel))
      (clear ?under)
      (not (clear ?b))
    )
  )

  (:action vowel_putdown_on_table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (holding_vowel ?b)
    )
    :effect (and
      (handempty_vowel)
      (not (holding_vowel ?b))
      (on ?b table)
      (clear ?b)
    )
  )

  (:action vowel_stack_on_block
    :parameters (?b - block ?onto - block)
    :precondition (and
      (vowel ?b)
      (holding_vowel ?b)
      (clear ?onto)
    )
    :effect (and
      (not (holding_vowel ?b))
      (handempty_vowel)
      (on ?b ?onto)
      (not (clear ?onto))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (can only move blocks marked (consonant ?b))

  (:action consonant_pickup_from_table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (handempty_consonant)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (handempty_consonant))
      (holding_consonant ?b)
      (not (clear ?b))
    )
  )

  (:action consonant_unstack_from_block
    :parameters (?b - block ?under - block)
    :precondition (and
      (consonant ?b)
      (handempty_consonant)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (holding_consonant ?b)
      (not (handempty_consonant))
      (clear ?under)
      (not (clear ?b))
    )
  )

  (:action consonant_putdown_on_table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding_consonant ?b)
    )
    :effect (and
      (handempty_consonant)
      (not (holding_consonant ?b))
      (on ?b table)
      (clear ?b)
    )
  )

  (:action consonant_stack_on_block
    :parameters (?b - block ?onto - block)
    :precondition (and
      (consonant ?b)
      (holding_consonant ?b)
      (clear ?onto)
    )
    :effect (and
      (not (holding_consonant ?b))
      (handempty_consonant)
      (on ?b ?onto)
      (not (clear ?onto))
      (clear ?b)
    )
  )
)