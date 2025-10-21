(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block stack vowel consonant - blocktype   ; blocktype is not used as object type; keep typing simple
  )

  (:predicates
    (on ?b - block ?s - (either block stack))   ; ?b is immediately on ?s (s may be a block or a stack)
    (top ?b - block ?st - stack)                ; ?b is the top block of stack ?st
    (empty ?st - stack)                         ; stack ?st has no blocks
    (is-vowel ?b - block)
    (is-cons ?b - block)
  )

  ;; Move actions for vowel_agent: can move only vowel-labelled blocks (A, E, I).
  ;; There are four schemas covering from-stack/from-block to empty/block destinations.
  (:action move-vowel-from-stack-to-empty
    :parameters (?b - block ?from - stack ?to - stack)
    :precondition (and
      (is-vowel ?b)
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

  (:action move-vowel-from-stack-to-block
    :parameters (?b - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (is-vowel ?b)
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
    :parameters (?b - block ?under - block ?from - stack ?to - stack)
    :precondition (and
      (is-vowel ?b)
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

  (:action move-vowel-from-block-to-block
    :parameters (?b - block ?under - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (is-vowel ?b)
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

  ;; Move actions for consonant_agent: can move only consonant-labelled blocks.
  (:action move-cons-from-stack-to-empty
    :parameters (?b - block ?from - stack ?to - stack)
    :precondition (and
      (is-cons ?b)
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
    :parameters (?b - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (is-cons ?b)
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
    :parameters (?b - block ?under - block ?from - stack ?to - stack)
    :precondition (and
      (is-cons ?b)
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
    :parameters (?b - block ?under - block ?from - stack ?d - block ?to - stack)
    :precondition (and
      (is-cons ?b)
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