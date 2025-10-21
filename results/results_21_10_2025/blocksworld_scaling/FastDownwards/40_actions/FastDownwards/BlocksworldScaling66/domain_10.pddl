(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block stack)

  (:predicates
    (on-stack ?b - block ?s - stack)
    (on-block ?b - block ?under - block)
    (top ?b - block ?s - stack)
    (empty ?s - stack)
    (is-vowel ?b - block)
    (is-cons ?b - block)
  )

  (:action move-vowel-from-stack-to-empty
    :parameters (?b - block ?from - stack ?to - stack)
    :precondition (and
      (is-vowel ?b)
      (top ?b ?from)
      (on-stack ?b ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-stack ?b ?from))
      (on-stack ?b ?to)
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
      (on-stack ?b ?from)
      (top ?d ?to)
    )
    :effect (and
      (not (on-stack ?b ?from))
      (on-block ?b ?d)
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
      (on-block ?b ?under)
      (empty ?to)
    )
    :effect (and
      (not (on-block ?b ?under))
      (on-stack ?b ?to)
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
      (on-block ?b ?under)
      (top ?d ?to)
    )
    :effect (and
      (not (on-block ?b ?under))
      (on-block ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (top ?under ?from)
    )
  )

  (:action move-cons-from-stack-to-empty
    :parameters (?b - block ?from - stack ?to - stack)
    :precondition (and
      (is-cons ?b)
      (top ?b ?from)
      (on-stack ?b ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-stack ?b ?from))
      (on-stack ?b ?to)
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
      (on-stack ?b ?from)
      (top ?d ?to)
    )
    :effect (and
      (not (on-stack ?b ?from))
      (on-block ?b ?d)
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
      (on-block ?b ?under)
      (empty ?to)
    )
    :effect (and
      (not (on-block ?b ?under))
      (on-stack ?b ?to)
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
      (on-block ?b ?under)
      (top ?d ?to)
    )
    :effect (and
      (not (on-block ?b ?under))
      (on-block ?b ?d)
      (not (top ?b ?from))
      (top ?b ?to)
      (not (top ?d ?to))
      (top ?under ?from)
    )
  )
)