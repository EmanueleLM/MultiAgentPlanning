(define (domain multiagent_blocks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; World predicates
    (on ?x ?y)         ; ?x is on ?y (both blocks)
    (ontable ?x)       ; ?x is on the table
    (clear ?x)         ; nothing on top of ?x and it is not being held

    ;; Ownership capabilities
    (vowel ?x)         ; block ?x is manipulable by vowel_agent (A, E)
    (consonant ?x)     ; block ?x is manipulable by consonant_agent (B, C, D)

    ;; Vowel agent hand state
    (vowel_holding ?x)
    (vowel_handempty)

    ;; Consonant agent hand state
    (consonant_holding ?x)
    (consonant_handempty)
  )

  ;; --------------------
  ;; Vowel-agent actions
  ;; --------------------

  (:action vowel_pickup_from_table
    :parameters (?b)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (vowel_handempty)
      (not (consonant_holding ?b))
    )
    :effect (and
      (vowel_holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (vowel_handempty))
    )
  )

  (:action vowel_unstack
    :parameters (?b ?under)
    :precondition (and
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (vowel_handempty)
      (not (consonant_holding ?b))
    )
    :effect (and
      (vowel_holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (vowel_handempty))
    )
  )

  (:action vowel_put_down
    :parameters (?b)
    :precondition (and
      (vowel ?b)
      (vowel_holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (vowel_handempty)
      (not (vowel_holding ?b))
    )
  )

  (:action vowel_stack
    :parameters (?b ?target)
    :precondition (and
      (vowel ?b)
      (vowel_holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (vowel_handempty)
      (not (vowel_holding ?b))
    )
  )

  ;; --------------------
  ;; Consonant-agent actions
  ;; --------------------

  (:action consonant_pickup_from_table
    :parameters (?b)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (consonant_handempty)
      (not (vowel_holding ?b))
    )
    :effect (and
      (consonant_holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (consonant_handempty))
    )
  )

  (:action consonant_unstack
    :parameters (?b ?under)
    :precondition (and
      (consonant ?b)
      (on ?b ?under)
      (clear ?b)
      (consonant_handempty)
      (not (vowel_holding ?b))
    )
    :effect (and
      (consonant_holding ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (consonant_handempty))
    )
  )

  (:action consonant_put_down
    :parameters (?b)
    :precondition (and
      (consonant ?b)
      (consonant_holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (consonant_handempty)
      (not (consonant_holding ?b))
    )
  )

  (:action consonant_stack
    :parameters (?b ?target)
    :precondition (and
      (consonant ?b)
      (consonant_holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (consonant_handempty)
      (not (consonant_holding ?b))
    )
  )
)