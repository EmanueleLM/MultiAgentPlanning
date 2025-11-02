(define (domain vowel-consonant-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stack tablepos block vowel consonant - place)
  ;; vowel and consonant are subtypes of block (and block is a place)
  ;; Note: In PDDL typing, we express hierarchy by listing subtypes; here vowel and consonant are declared as place subtypes,
  ;; and we will assign block objects to the appropriate subtype (vowel or consonant).
  (:predicates
    (on ?b - block ?p - place)           ; direct support relation: b is directly on place p (block, stack, or tablepos)
    (clear ?b - block)                   ; block has nothing on top
    (empty ?t - tablepos)                ; table position has no block on it
    (on-stack ?b - block ?s - stack)     ; b is (somewhere) on stack s (i.e., the base under b is stack s)
  )

  ;; Consonant actions (may move only consonant blocks).
  ;; Case: source is a block that is on another block which is on stack ?s_from; target is a block on stack ?s_to (must be different stack).
  (:action move-consonant-block-from-block-to-block
    :parameters (?b - consonant ?under - block ?s_from - stack ?to - block ?s_to - stack)
    :precondition (and
      (on ?b ?under)
      (on-stack ?under ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (clear ?to)
      (on-stack ?to ?s_to)
      (not (on-stack ?b ?s_to))               ; enforce different source/target stacks
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?under)
      (not (on-stack ?b ?s_from))
      (on-stack ?b ?s_to)
    )
  )

  ;; Case: source is directly on stack ?s_from; target is a block on stack ?s_to (must be different stack).
  (:action move-consonant-from-stack-to-block
    :parameters (?b - consonant ?s_from - stack ?to - block ?s_to - stack)
    :precondition (and
      (on ?b ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (clear ?to)
      (on-stack ?to ?s_to)
      (not (on-stack ?b ?s_to))
    )
    :effect (and
      (not (on ?b ?s_from))
      (on ?b ?to)
      (not (clear ?to))
      (not (on-stack ?b ?s_from))
      (on-stack ?b ?s_to)
    )
  )

  ;; Case: source is a block on another block (which is on stack ?s_from); target is an empty table position ?t.
  (:action move-consonant-block-from-block-to-table
    :parameters (?b - consonant ?under - block ?s_from - stack ?t - tablepos)
    :precondition (and
      (on ?b ?under)
      (on-stack ?under ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?t)
      (not (empty ?t))
      (clear ?under)
      (not (on-stack ?b ?s_from))
    )
  )

  ;; Case: source is directly on stack ?s_from; target is an empty table position ?t.
  (:action move-consonant-from-stack-to-table
    :parameters (?b - consonant ?s_from - stack ?t - tablepos)
    :precondition (and
      (on ?b ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?s_from))
      (on ?b ?t)
      (not (empty ?t))
      (not (on-stack ?b ?s_from))
    )
  )

  ;; Vowel actions (may move only vowel blocks).
  ;; Same four structural variants as for consonants, but the moved block is a vowel and the precondition requires it be on a stack (top-of-stack).
  (:action move-vowel-block-from-block-to-block
    :parameters (?b - vowel ?under - block ?s_from - stack ?to - block ?s_to - stack)
    :precondition (and
      (on ?b ?under)
      (on-stack ?under ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (clear ?to)
      (on-stack ?to ?s_to)
      (not (on-stack ?b ?s_to))
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?under)
      (not (on-stack ?b ?s_from))
      (on-stack ?b ?s_to)
    )
  )

  (:action move-vowel-from-stack-to-block
    :parameters (?b - vowel ?s_from - stack ?to - block ?s_to - stack)
    :precondition (and
      (on ?b ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (clear ?to)
      (on-stack ?to ?s_to)
      (not (on-stack ?b ?s_to))
    )
    :effect (and
      (not (on ?b ?s_from))
      (on ?b ?to)
      (not (clear ?to))
      (not (on-stack ?b ?s_from))
      (on-stack ?b ?s_to)
    )
  )

  (:action move-vowel-block-from-block-to-table
    :parameters (?b - vowel ?under - block ?s_from - stack ?t - tablepos)
    :precondition (and
      (on ?b ?under)
      (on-stack ?under ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?t)
      (not (empty ?t))
      (clear ?under)
      (not (on-stack ?b ?s_from))
    )
  )

  (:action move-vowel-from-stack-to-table
    :parameters (?b - vowel ?s_from - stack ?t - tablepos)
    :precondition (and
      (on ?b ?s_from)
      (on-stack ?b ?s_from)
      (clear ?b)
      (empty ?t)
    )
    :effect (and
      (not (on ?b ?s_from))
      (on ?b ?t)
      (not (empty ?t))
      (not (on-stack ?b ?s_from))
    )
  )
)