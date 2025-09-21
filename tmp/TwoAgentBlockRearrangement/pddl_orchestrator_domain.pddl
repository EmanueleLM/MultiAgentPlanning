(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack)
  (:predicates
    (block ?b - block)
    (stack ?s - stack)
    (vowel ?b - block)
    (consonant ?b - block)

    ;; spatial relations: a block is either on a block or on a stack
    (on ?b - block ?x)                ;; ?x is block or stack (no type in predicate)
    (clear ?b - block)                ;; true if nothing on top of this block
    (empty ?s - stack)                ;; true if stack has no blocks

    ;; holdings and hand availability per agent
    (holding-vowel ?b - block)
    (holding-cons ?b - block)
    (hand-free-vowel)
    (hand-free-cons)
  )

  ;; Vowel agent picks up a clear block that it is allowed to handle and is either on top of a block or directly on a stack.
  (:action pick-up-vowel-from-block
    :parameters (?b - block ?below - block)
    :precondition (and
      (vowel ?b)
      (hand-free-vowel)
      (on ?b ?below)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (holding-vowel ?b)
      (not (hand-free-vowel))
      ;; the below block becomes clear (b removed)
      (clear ?below)
      ;; the held block is no longer considered to have something on top
      (clear ?b)
    )
  )

  (:action pick-up-vowel-from-stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (vowel ?b)
      (hand-free-vowel)
      (on ?b ?s)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (holding-vowel ?b)
      (not (hand-free-vowel))
      ;; stack becomes empty when its only block was picked up
      (empty ?s)
      (clear ?b)
    )
  )

  ;; Vowel agent places a held block onto another block (must be clear and not held by the other agent).
  (:action place-vowel-on-block
    :parameters (?b - block ?target - block)
    :precondition (and
      (vowel ?b)
      (holding-vowel ?b)
      (clear ?target)
      (not (holding-cons ?target)) ;; cannot place onto a block held by the other agent
    )
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (not (holding-vowel ?b))
      (hand-free-vowel)
    )
  )

  ;; Vowel agent places a held block onto an empty stack (starts a new/empty table stack).
  (:action place-vowel-on-empty-stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (vowel ?b)
      (holding-vowel ?b)
      (empty ?s)
    )
    :effect (and
      (on ?b ?s)
      (not (empty ?s))
      (clear ?b)
      (not (holding-vowel ?b))
      (hand-free-vowel)
    )
  )

  ;; Consonant agent symmetric actions:
  (:action pick-up-cons-from-block
    :parameters (?b - block ?below - block)
    :precondition (and
      (consonant ?b)
      (hand-free-cons)
      (on ?b ?below)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (holding-cons ?b)
      (not (hand-free-cons))
      (clear ?below)
      (clear ?b)
    )
  )

  (:action pick-up-cons-from-stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (consonant ?b)
      (hand-free-cons)
      (on ?b ?s)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (holding-cons ?b)
      (not (hand-free-cons))
      (empty ?s)
      (clear ?b)
    )
  )

  (:action place-cons-on-block
    :parameters (?b - block ?target - block)
    :precondition (and
      (consonant ?b)
      (holding-cons ?b)
      (clear ?target)
      (not (holding-vowel ?target)) ;; cannot place onto a block held by the other agent
    )
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (not (holding-cons ?b))
      (hand-free-cons)
    )
  )

  (:action place-cons-on-empty-stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (consonant ?b)
      (holding-cons ?b)
      (empty ?s)
    )
    :effect (and
      (on ?b ?s)
      (not (empty ?s))
      (clear ?b)
      (not (holding-cons ?b))
      (hand-free-cons)
    )
  )
)