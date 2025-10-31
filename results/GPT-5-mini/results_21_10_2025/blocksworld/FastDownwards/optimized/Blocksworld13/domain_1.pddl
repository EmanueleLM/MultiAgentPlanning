(define (domain multi_agent_blocks_with_hands)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)
  (:predicates
    ;; location relations: a block is on either another block or the table
    (on ?x - block ?y - (either block table))
    ;; clear: nothing on top of this block and not being held
    (clear ?x - block)
    ;; agent membership
    (vowel ?x - block)
    (consonant ?x - block)
    ;; agent hand states and holdings (one hand per agent)
    (handempty_vowel)
    (handempty_consonant)
    (holding_vowel ?x - block)
    (holding_consonant ?x - block)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Vowel-agent actions (can only move blocks marked (vowel ?b))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; pick up a vowel block from the table
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
      ;; a held block is not considered clear
      (not (clear ?b))
    )
  )

  ;; unstack a vowel block from on top of another block
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
      ;; the block underneath becomes clear when ?b is removed
      (clear ?under)
      ;; held block is not clear
      (not (clear ?b))
    )
  )

  ;; put down a vowel block on the table
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

  ;; stack a vowel block onto another block
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
      ;; the block we stack onto is no longer clear
      (not (clear ?onto))
      ;; the block we just placed is clear (if nothing is above it)
      (clear ?b)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Consonant-agent actions (can only move blocks marked (consonant ?b))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; pick up a consonant block from the table
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

  ;; unstack a consonant block from on top of another block
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

  ;; put down a consonant block on the table
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

  ;; stack a consonant block onto another block
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