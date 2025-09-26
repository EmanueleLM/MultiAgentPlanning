(define (domain two-agent-stacking)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; types
    (block ?b)
    (stack ?s)

    ;; block kinds
    (vowel ?b)
    (consonant ?b)

    ;; spatial relations: ?support is either a block or a stack
    (on ?b ?support)

    ;; nothing on top of an object (block or stack)
    (clear ?x)

    ;; whether a stack has no blocks
    (empty ?s)

    ;; holdings and hand states, split per agent
    (holding_v ?b)
    (holding_c ?b)
    (handempty_v)
    (handempty_c)
  )

  ;; --- Agent V (vowel agent) actions ---
  ;; pick top block from a stack (support is a stack)
  (:action pick_v_from_stack
    :parameters (?b ?s)
    :precondition (and (vowel ?b) (handempty_v) (clear ?b) (on ?b ?s) (stack ?s))
    :effect (and
      (not (on ?b ?s))
      (holding_v ?b)
      (not (handempty_v))
      ;; after removing top block directly on stack, the stack becomes empty
      (empty ?s)
      ;; the picked block remains clear while held
      (clear ?b)
    )
  )

  ;; pick top block from another block (support is a block)
  (:action pick_v_from_block
    :parameters (?b ?x)
    :precondition (and (vowel ?b) (handempty_v) (clear ?b) (on ?b ?x) (block ?x))
    :effect (and
      (not (on ?b ?x))
      (holding_v ?b)
      (not (handempty_v))
      ;; the block that was supporting ?b becomes clear
      (clear ?x)
      (clear ?b)
    )
  )

  ;; place held block onto a stack
  (:action place_v_on_stack
    :parameters (?b ?s)
    :precondition (and (vowel ?b) (holding_v ?b) (stack ?s))
    :effect (and
      (not (holding_v ?b))
      (handempty_v)
      (on ?b ?s)
      (clear ?b)
      ;; stack is now non-empty
      (not (empty ?s))
    )
  )

  ;; place held block onto another block
  ;; respects mutual-hold: cannot place onto a block currently held by the other agent
  (:action place_v_on_block
    :parameters (?b ?x)
    :precondition (and (vowel ?b) (holding_v ?b) (clear ?x) (block ?x) (not (holding_c ?x)))
    :effect (and
      (not (holding_v ?b))
      (handempty_v)
      (on ?b ?x)
      (clear ?b)
      ;; the block ?x is no longer clear since ?b is now on it
      (not (clear ?x))
    )
  )

  ;; --- Agent C (consonant agent) actions ---
  (:action pick_c_from_stack
    :parameters (?b ?s)
    :precondition (and (consonant ?b) (handempty_c) (clear ?b) (on ?b ?s) (stack ?s))
    :effect (and
      (not (on ?b ?s))
      (holding_c ?b)
      (not (handempty_c))
      (empty ?s)
      (clear ?b)
    )
  )

  (:action pick_c_from_block
    :parameters (?b ?x)
    :precondition (and (consonant ?b) (handempty_c) (clear ?b) (on ?b ?x) (block ?x))
    :effect (and
      (not (on ?b ?x))
      (holding_c ?b)
      (not (handempty_c))
      (clear ?x)
      (clear ?b)
    )
  )

  (:action place_c_on_stack
    :parameters (?b ?s)
    :precondition (and (consonant ?b) (holding_c ?b) (stack ?s))
    :effect (and
      (not (holding_c ?b))
      (handempty_c)
      (on ?b ?s)
      (clear ?b)
      (not (empty ?s))
    )
  )

  (:action place_c_on_block
    :parameters (?b ?x)
    :precondition (and (consonant ?b) (holding_c ?b) (clear ?x) (block ?x) (not (holding_v ?x)))
    :effect (and
      (not (holding_c ?b))
      (handempty_c)
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
    )
  )

)