(define (domain BlocksworldScaling123)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on_block ?b - block ?under - block)
    (on_stack ?b - block ?s - stack)
    (top ?b - block ?s - stack)   ; ?b is the top block of stack ?s
    (clear ?b - block)            ; nothing on top of ?b
    (empty ?s - stack)
  )

  ;; Vowel actions
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
      (not (clear ?dest))

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
      (not (clear ?dest))

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

  ;; Consonant actions: identical semantics but restricted to consonant blocks
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
      (not (clear ?dest))

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
      (not (clear ?dest))

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