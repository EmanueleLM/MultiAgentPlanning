(define (domain blocks-multi-agent)
  (:requirements :strips :typing)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)

    ;; Consonant-agent local state
    (handempty-cons)
    (holding-cons ?x - consonant)
  )

  ;; -----------------------
  ;; Vowel-agent actions
  ;; Vowel agent can only move vowel-typed blocks (A and E)
  ;; -----------------------

  ;; Move a vowel block from one block to another block
  (:action vowel_move_block_to_block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Move a vowel block from the table onto a block
  (:action vowel_move_table_to_block
    :parameters (?b - vowel ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Move a vowel block from a block to the table
  (:action vowel_move_block_to_table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; -----------------------
  ;; Consonant-agent actions (prefixed with cons_)
  ;; Consonant agent can only pick up/move consonant-typed blocks (B, C, D)
  ;; This agent models pickup/holding/putdown semantics
  ;; -----------------------

  ;; Consonant-only pickup from table
  (:action cons_pickup
    :parameters (?x - consonant)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  ;; Consonant-only unstack: take a consonant block from top of another block
  (:action cons_unstack
    :parameters (?x - consonant ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  ;; Put the held consonant block down on the table
  (:action cons_putdown
    :parameters (?x - consonant)
    :precondition (holding-cons ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )

  ;; Stack a held consonant block onto any clear block
  (:action cons_stack
    :parameters (?x - consonant ?y - block)
    :precondition (and
      (holding-cons ?x)
      (clear ?y)
    )
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )
)