(define (domain block-stacking-multiagent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?b ?p)         ; block ?b is immediately on place ?p (place can be a block or a table spot)
    (clear ?p)         ; place ?p is clear (no block directly on top)
    (vowel ?b)         ; block is a vowel (A,E,I)
    (consonant ?b)     ; block is a consonant
  )

  ;; Consonant agent: may move any consonant block that is currently clear,
  ;; onto any clear place (another block or an empty table spot).
  (:action consonant-move
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Vowel-specific actions: implement only the moves allowed / promised by the vowel agent.
  ;; 1) The vowel agent's immediate accepted move: move A from its current place to S1 only.
  (:action vowel_move_A_to_s1
    :parameters (?from)
    :precondition (and
      (vowel A)
      (on A ?from)
      (clear A)
      (clear s1)
    )
    :effect (and
      (not (on A ?from))
      (on A s1)
      (not (clear s1))
      (clear ?from)
    )
  )

  ;; 2) The vowel agent will place E on F when E is clear (explicit, only onto F).
  (:action vowel_move_E_to_F
    :parameters (?from)
    :precondition (and
      (vowel E)
      (on E ?from)
      (clear E)
      (clear F)
    )
    :effect (and
      (not (on E ?from))
      (on E F)
      (not (clear F))
      (clear ?from)
    )
  )

  ;; 3) The vowel agent will place I onto J when J is available (clear).
  (:action vowel_move_I_to_J
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear J)
    )
    :effect (and
      (not (on I ?from))
      (on I J)
      (not (clear J))
      (clear ?from)
    )
  )

  ;; 4) The vowel agent also allows I to be moved temporarily to S1 or to newly created/available table spots
  ;;    only when J is NOT clear (i.e., the conditional branch "else (J not yet top) -> place I on S1 or table").
  ;;    We provide explicit actions for each allowed temporary destination (S1, S4, S5, S6, S7).
  (:action vowel_move_I_to_s1_temp
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear s1)
      (not (clear J))     ; conditional branch: J is not available as target now
    )
    :effect (and
      (not (on I ?from))
      (on I s1)
      (not (clear s1))
      (clear ?from)
    )
  )

  (:action vowel_move_I_to_s4_temp
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear s4)
      (not (clear J))
    )
    :effect (and
      (not (on I ?from))
      (on I s4)
      (not (clear s4))
      (clear ?from)
    )
  )

  (:action vowel_move_I_to_s5_temp
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear s5)
      (not (clear J))
    )
    :effect (and
      (not (on I ?from))
      (on I s5)
      (not (clear s5))
      (clear ?from)
    )
  )

  (:action vowel_move_I_to_s6_temp
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear s6)
      (not (clear J))
    )
    :effect (and
      (not (on I ?from))
      (on I s6)
      (not (clear s6))
      (clear ?from)
    )
  )

  (:action vowel_move_I_to_s7_temp
    :parameters (?from)
    :precondition (and
      (vowel I)
      (on I ?from)
      (clear I)
      (clear s7)
      (not (clear J))
    )
    :effect (and
      (not (on I ?from))
      (on I s7)
      (not (clear s7))
      (clear ?from)
    )
  )

)