(define (domain blocks-multiagent)
  ; Multi-agent blocks domain for FastDownward
  ; Assumption: initial stacks were not provided in the agent descriptions.
  ; To avoid making unwarranted assumptions about stacked structure, the problem
  ; file will (explicitly) place each block on the table as a singleton stack.
  ; Actions are separated by agent capability: vowel_agent actions and consonant_agent actions.
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?under - block)     ; ?b is directly on ?under
    (ontable ?b - block)               ; ?b is directly on the table
    (clear ?b - block)                 ; nothing on top of ?b
    (vowel ?b - block)                 ; static: block is vowel (A,E,I)
    (consonant ?b - block)             ; static: block is consonant (others)
  )

  ; -----------------------
  ; Vowel agent actions (vowel_agent: can manipulate only A, E, I)
  ; -----------------------

  ; Move a vowel block from another block to a block
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a vowel block from table to a block
  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ; Move a vowel block from a block to table
  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ; -----------------------
  ; Consonant agent actions (consonant_agent: can manipulate only B,C,D,F,G,H,J,K,L)
  ; -----------------------

  ; Move a consonant block from another block to a block
  (:action move-consonant-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a consonant block from table to a block
  (:action move-consonant-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ; Move a consonant block from a block to table
  (:action move-consonant-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

)