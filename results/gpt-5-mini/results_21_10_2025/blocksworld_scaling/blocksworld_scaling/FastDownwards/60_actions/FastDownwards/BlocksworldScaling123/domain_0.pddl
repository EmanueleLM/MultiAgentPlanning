(define (domain multi-agent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack agent)
  (:predicates
    ;; block classification
    (vowel ?b - block)
    (consonant ?b - block)

    ;; spatial relations
    (on_block ?b - block ?under - block)   ;; ?b is directly on top of block ?under
    (on_stack ?b - block ?s - stack)       ;; ?b is directly on the table at stack base ?s
    (top ?b - block ?s - stack)            ;; ?b is the current top block of stack ?s

    ;; helpers for top-only constraints
    (clear ?b - block)                     ;; ?b has nothing on top of it (is clear/top)
    (empty ?s - stack)                     ;; stack ?s has no blocks (is empty)
  )

  ;; Vowel-agent actions: can only move vowel blocks, top-only, one block at a time.
  ;; Source may be a block (on_block) or a stack base (on_stack).
  ;; Destination may be a block (place on top of an existing top block) or an empty stack (place on table).

  (:action vowel-move-block-to-block
    :parameters (?b - block ?below - block ?s_from - stack ?dest - block ?s_dest - stack)
    :precondition (and
      (vowel ?b)
      (on_block ?b ?below)
      (top ?b ?s_from)
      (top ?dest ?s_dest)
      (clear ?dest)
    )
    :effect (and
      (not (on_block ?b ?below))
      (not (top ?b ?s_from))

      ;; dest ceases to be top; b becomes top of dest's stack
      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

      ;; below becomes top of original stack
      (clear ?below)
      (top ?below ?s_from)
    )
  )

  (:action vowel-move-block-to-stack
    :parameters (?b - block ?below - block ?s_from - stack ?s_dest - stack)
    :precondition (and
      (vowel ?b)
      (on_block ?b ?below)
      (top ?b ?s_from)
      (empty ?s_dest)
    )
    :effect (and
      (not (on_block ?b ?below))
      (not (top ?b ?s_from))

      ;; placing b on empty stack s_dest
      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

      ;; below becomes top of origin stack
      (clear ?below)
      (top ?below ?s_from)
    )
  )

  (:action vowel-move-stack-to-block
    :parameters (?b - block ?s_from - stack ?dest - block ?s_dest - stack)
    :precondition (and
      (vowel ?b)
      (on_stack ?b ?s_from)
      (top ?b ?s_from)
      (top ?dest ?s_dest)
      (clear ?dest)
    )
    :effect (and
      (not (on_stack ?b ?s_from))
      (not (top ?b ?s_from))

      ;; dest ceases to be top; b becomes top of dest's stack
      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

      ;; source stack becomes empty
      (empty ?s_from)
    )
  )

  (:action vowel-move-stack-to-stack
    :parameters (?b - block ?s_from - stack ?s_dest - stack)
    :precondition (and
      (vowel ?b)
      (on_stack ?b ?s_from)
      (top ?b ?s_from)
      (empty ?s_dest)
    )
    :effect (and
      (not (on_stack ?b ?s_from))
      (not (top ?b ?s_from))

      ;; place b on empty stack
      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

      ;; source stack becomes empty
      (empty ?s_from)
    )
  )

  ;; Consonant-agent actions: same movement structure but restricted to consonant blocks.

  (:action consonant-move-block-to-block
    :parameters (?b - block ?below - block ?s_from - stack ?dest - block ?s_dest - stack)
    :precondition (and
      (consonant ?b)
      (on_block ?b ?below)
      (top ?b ?s_from)
      (top ?dest ?s_dest)
      (clear ?dest)
    )
    :effect (and
      (not (on_block ?b ?below))
      (not (top ?b ?s_from))

      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

      (clear ?below)
      (top ?below ?s_from)
    )
  )

  (:action consonant-move-block-to-stack
    :parameters (?b - block ?below - block ?s_from - stack ?s_dest - stack)
    :precondition (and
      (consonant ?b)
      (on_block ?b ?below)
      (top ?b ?s_from)
      (empty ?s_dest)
    )
    :effect (and
      (not (on_block ?b ?below))
      (not (top ?b ?s_from))

      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

      (clear ?below)
      (top ?below ?s_from)
    )
  )

  (:action consonant-move-stack-to-block
    :parameters (?b - block ?s_from - stack ?dest - block ?s_dest - stack)
    :precondition (and
      (consonant ?b)
      (on_stack ?b ?s_from)
      (top ?b ?s_from)
      (top ?dest ?s_dest)
      (clear ?dest)
    )
    :effect (and
      (not (on_stack ?b ?s_from))
      (not (top ?b ?s_from))

      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

      (empty ?s_from)
    )
  )

  (:action consonant-move-stack-to-stack
    :parameters (?b - block ?s_from - stack ?s_dest - stack)
    :precondition (and
      (consonant ?b)
      (on_stack ?b ?s_from)
      (top ?b ?s_from)
      (empty ?s_dest)
    )
    :effect (and
      (not (on_stack ?b ?s_from))
      (not (top ?b ?s_from))

      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

      (empty ?s_from)
    )
  )
)