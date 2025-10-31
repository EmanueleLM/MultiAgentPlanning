(define (domain BlocksworldScaling143)
  (:requirements :typing :negative-preconditions)
  (:types block agent)

  (:constants vowel_agent consonant_agent orchestrator - agent)

  (:predicates
    ;; static type membership
    (vowel ?b - block)
    (consonant ?b - block)

    ;; world state
    (on ?x - block ?y - block)    ; x is directly on y
    (on-table ?x - block)         ; x is directly on the table (bottom of some stack)
    (clear ?x - block)            ; nothing on x (x is top of its stack)

    ;; agent state
    (holding ?a - agent ?x - block) ; agent a currently holds block x
    (free ?a - agent)               ; agent a is free (holding nothing)
  )

  ;; ----- Vowel agent actions (only A, E, I) -----
  (:action vowel_pick_from_block
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?y)
      (clear ?x)
      (free vowel_agent)
    )
    :effect (and
      (holding vowel_agent ?x)
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (free vowel_agent))
    )
  )

  (:action vowel_pick_from_table
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (on-table ?x)
      (clear ?x)
      (free vowel_agent)
    )
    :effect (and
      (holding vowel_agent ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (free vowel_agent))
    )
  )

  (:action vowel_put_on_block
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding vowel_agent ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding vowel_agent ?x))
      (free vowel_agent)
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
    )
  )

  (:action vowel_put_on_table
    :parameters (?x - block)
    :precondition (and
      (holding vowel_agent ?x)
    )
    :effect (and
      (not (holding vowel_agent ?x))
      (free vowel_agent)
      (on-table ?x)
      (clear ?x)
    )
  )

  ;; ----- Consonant agent actions (all non-vowel blocks) -----
  (:action consonant_pick_from_block
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (free consonant_agent)
    )
    :effect (and
      (holding consonant_agent ?x)
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (free consonant_agent))
    )
  )

  (:action consonant_pick_from_table
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (on-table ?x)
      (clear ?x)
      (free consonant_agent)
    )
    :effect (and
      (holding consonant_agent ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (free consonant_agent))
    )
  )

  (:action consonant_put_on_block
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding consonant_agent ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding consonant_agent ?x))
      (free consonant_agent)
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
    )
  )

  (:action consonant_put_on_table
    :parameters (?x - block)
    :precondition (and
      (holding consonant_agent ?x)
    )
    :effect (and
      (not (holding consonant_agent ?x))
      (free consonant_agent)
      (on-table ?x)
      (clear ?x)
    )
  )
)