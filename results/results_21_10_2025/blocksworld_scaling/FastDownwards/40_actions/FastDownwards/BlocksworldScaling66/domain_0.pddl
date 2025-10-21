(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vowel consonant - block
    block stack - support
  )

  (:predicates
    (on ?b - block ?s - support)    ; ?b is immediately on ?s (s may be a block or a stack)
    (top ?b - block ?s - stack)     ; ?b is the top block of stack ?s
    (empty ?s - stack)              ; stack ?s has no blocks
  )

  ;; Vowel-agent actions (may move only vowels A, E, I). These actions require the moved block to be the top
  ;; of some stack. We provide separate schemas depending on whether the block is directly on the stack
  ;; (i.e. no block underneath) or on another block, and whether the destination stack is empty or has a top block.
  (:action move-vowel-from-stack-to-empty
    :parameters (?b - vowel ?from - stack ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?from)    ;; ?b is directly on the stack ?from (i.e., it was the bottom on that stack)
      (empty ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-vowel-from-stack-to-block
    :parameters (?b - vowel ?from - stack ?d - block ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?from)
      (top ?d ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (empty ?from)
    )
  )

  (:action move-vowel-from-block-to-empty
    :parameters (?b - vowel ?under - block ?from - stack ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?under)   ;; ?b is on top of another block ?under in stack ?from
      (empty ?to)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?to)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (empty ?to))
      (top ?under ?from)
    )
  )

  (:action move-vowel-from-block-to-block
    :parameters (?b - vowel ?under - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?under)
      (top ?d ?to)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (top ?under ?from)
    )
  )

  ;; Consonant-agent actions (may move only consonants). Same schema families but restricted to consonant blocks.
  (:action move-cons-from-stack-to-empty
    :parameters (?b - consonant ?from - stack ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-cons-from-stack-to-block
    :parameters (?b - consonant ?from - stack ?d - block ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?from)
      (top ?d ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (empty ?from)
    )
  )

  (:action move-cons-from-block-to-empty
    :parameters (?b - consonant ?under - block ?from - stack ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?under)
      (empty ?to)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?to)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (empty ?to))
      (top ?under ?from)
    )
  )

  (:action move-cons-from-block-to-block
    :parameters (?b - consonant ?under - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (top ?b ?from)
      (on ?b ?under)
      (top ?d ?to)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (top ?under ?from)
    )
  )

)