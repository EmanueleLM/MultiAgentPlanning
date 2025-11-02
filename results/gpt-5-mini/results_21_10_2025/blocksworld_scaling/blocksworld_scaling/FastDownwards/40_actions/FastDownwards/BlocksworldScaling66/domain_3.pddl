(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block stack - place)

  (:predicates
    (on ?b - block ?p - place)
    (top ?b - block ?st - stack)
    (empty ?st - stack)
    (is-vowel ?b - block)
    (is-cons ?b - block)
  )

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