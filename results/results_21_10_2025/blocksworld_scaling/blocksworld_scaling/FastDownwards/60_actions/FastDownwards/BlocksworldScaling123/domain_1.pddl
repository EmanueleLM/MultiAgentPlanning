(define (domain BlocksworldScaling123)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack agent)

  (:predicates
    ;; classifications
    (vowel ?b - block)
    (consonant ?b - block)

    ;; spatial relations
    (on_block ?b - block ?under - block)   ;; ?b is directly on top of block ?under
    (on_stack ?b - block ?s - stack)       ;; ?b is directly on the table at stack base ?s
    (top ?b - block ?s - stack)            ;; ?b is the current top block of stack ?s

    ;; helpers
    (clear ?b - block)                     ;; ?b has nothing on top of it (is clear / top)
    (empty ?s - stack)                     ;; stack ?s has no blocks
  )

  ;; Vowel-agent actions: only move vowel blocks. Top-only, one block at a time.
  ;; Source: on_block or on_stack. Destination: on_block (onto a top block) or on_stack (onto empty stack).

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

      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

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

      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

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

      (not (top ?dest ?s_dest))
      (on_block ?b ?dest)
      (top ?b ?s_dest)
      (clear ?b)

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

      (not (empty ?s_dest))
      (on_stack ?b ?s_dest)
      (top ?b ?s_dest)
      (clear ?b)

      (empty ?s_from)
    )
  )

  ;; Consonant-agent actions: symmetric structure but restricted to consonant blocks.

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