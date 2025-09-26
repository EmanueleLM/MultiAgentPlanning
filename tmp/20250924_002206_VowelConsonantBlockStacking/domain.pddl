(define (domain two-agent-stacking)
  (:requirements :strips :typing :negative-preconditions :adl)
  (:types block stack)

  (:predicates
    ;; kinds
    (vowel ?b - block)
    (consonant ?b - block)

    ;; spatial relations: support may be a block or a stack; use untyped variable of root type via object is not declared,
    ;; so allow support as either block or stack using ADL 'either' in parameter declarations below.
    (on ?b - block ?s)  ;; ?s will be declared with either block or stack in actions

    ;; nothing on top of a block
    (clear ?b - block)

    ;; whether a stack has no blocks
    (empty ?s - stack)

    ;; explicit top-of-stack/block marker
    (top ?b - block)

    ;; holdings and hand states, split per agent
    (holding_v ?b - block)
    (holding_c ?b - block)
    (handempty_v)
    (handempty_c)
  )

  ;; --- Agent V (vowel agent) actions ---
  ;; pick top block from a stack (support is a stack)
  (:action pick_v_from_stack
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (handempty_v) (clear ?b) (on ?b ?s) (top ?b))
    :effect (and
      (not (on ?b ?s))
      (holding_v ?b)
      (not (handempty_v))
      (not (top ?b))
      ;; after removing top block directly on stack, the stack becomes empty
      (empty ?s)
      ;; the picked block remains clear while held
      (clear ?b)
    )
  )

  ;; pick top block from another block (support is a block)
  (:action pick_v_from_block
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (handempty_v) (clear ?b) (on ?b ?x) (top ?b))
    :effect (and
      (not (on ?b ?x))
      (holding_v ?b)
      (not (handempty_v))
      ;; the block that was supporting ?b becomes top and clear
      (clear ?x)
      (top ?x)
      (not (top ?b))
      (clear ?b)
    )
  )

  ;; place held block onto an empty stack (to avoid unknown previous top)
  (:action place_v_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (holding_v ?b) (empty ?s))
    :effect (and
      (not (holding_v ?b))
      (handempty_v)
      (on ?b ?s)
      (clear ?b)
      (not (empty ?s))
      (top ?b)
    )
  )

  ;; place held block onto another block
  ;; respects mutual-hold: cannot place onto a block currently held by the other agent
  (:action place_v_on_block
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (holding_v ?b) (clear ?x) (not (holding_c ?x)))
    :effect (and
      (not (holding_v ?b))
      (handempty_v)
      (on ?b ?x)
      (clear ?b)
      ;; the block ?x is no longer clear or top since ?b is now on it
      (not (clear ?x))
      (not (top ?x))
      (top ?b)
    )
  )

  ;; --- Agent C (consonant agent) actions ---
  (:action pick_c_from_stack
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (handempty_c) (clear ?b) (on ?b ?s) (top ?b))
    :effect (and
      (not (on ?b ?s))
      (holding_c ?b)
      (not (handempty_c))
      (not (top ?b))
      (empty ?s)
      (clear ?b)
    )
  )

  (:action pick_c_from_block
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (handempty_c) (clear ?b) (on ?b ?x) (top ?b))
    :effect (and
      (not (on ?b ?x))
      (holding_c ?b)
      (not (handempty_c))
      ;; the block that supported ?b becomes top and clear
      (clear ?x)
      (top ?x)
      (not (top ?b))
      (clear ?b)
    )
  )

  (:action place_c_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (holding_c ?b) (empty ?s))
    :effect (and
      (not (holding_c ?b))
      (handempty_c)
      (on ?b ?s)
      (clear ?b)
      (not (empty ?s))
      (top ?b)
    )
  )

  (:action place_c_on_block
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (holding_c ?b) (clear ?x) (not (holding_v ?x)))
    :effect (and
      (not (holding_c ?b))
      (handempty_c)
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (not (top ?x))
      (top ?b)
    )
  )

)