(define (domain blocks_dual_agent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?x - block ?y - block)        ; x is directly on y
    (on-table ?x - block)             ; x is directly on the table (bottom of a stack)
    (clear ?x - block)                ; nothing on x (x is top of its stack)
    (holding ?a - agent ?x - block)   ; agent a holds block x
    (free ?a - agent)                 ; agent a is not holding any block
  )

  ;; ----- Actions for the vowel agent -----
  ;; pick a vowel that is on top of another block
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

  ;; pick a vowel that is on the table (bottom of a stack)
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

  ;; put a held vowel onto another top block (target must be clear/top)
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

  ;; put a held vowel onto the table (create or extend a stack)
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

  ;; ----- Actions for the consonant agent -----
  ;; pick a consonant that is on top of another block
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

  ;; pick a consonant that is on the table (bottom of a stack)
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

  ;; put a held consonant onto another top block (target must be clear/top)
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

  ;; put a held consonant onto the table (create or extend a stack)
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