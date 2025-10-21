(define (domain blocks_vowel_consonant)
  :requirements :strips :typing :negative-preconditions
  :types vowel consonant block stack
  :predicates
    ; structural predicates
    (on ?x - block ?y - block)          ; x is directly on block y
    (on-table ?x - block ?s - stack)    ; x is directly on table at stack s
    (top ?x - block ?s - stack)         ; x is the top block of stack s
    (stack ?s - stack)                  ; s is an active stack id on the table
    (free_stack ?s - stack)             ; s is an available (unused) stack slot
    (holding ?b - block)                ; some agent (global) holds block b
    (empty_hand)                        ; no agent holds any block

  ; ACTIONS FOR VOWEL-ONLY AGENT (A, E, I, O)
  (:action pick-vowel-from-block
    :parameters (?b - vowel ?under - block ?s - stack)
    :precondition (and (top ?b ?s) (on ?b ?under) (empty_hand) (stack ?s))
    :effect (and
      (holding ?b)
      (not (empty_hand))
      (not (top ?b ?s))
      (not (on ?b ?under))
      (top ?under ?s)
    )
  )

  (:action pick-vowel-from-table
    :parameters (?b - vowel ?s - stack)
    :precondition (and (top ?b ?s) (on-table ?b ?s) (empty_hand) (stack ?s))
    :effect (and
      (holding ?b)
      (not (empty_hand))
      (not (top ?b ?s))
      (not (on-table ?b ?s))
      (not (stack ?s))
      (free_stack ?s)
    )
  )

  (:action place-vowel-on-block
    :parameters (?b - vowel ?dest - block ?sd - stack)
    :precondition (and (holding ?b) (top ?dest ?sd) (stack ?sd))
    :effect (and
      (not (holding ?b))
      (empty_hand)
      (on ?b ?dest)
      (top ?b ?sd)
      (not (top ?dest ?sd))
    )
  )

  (:action place-vowel-on-table
    :parameters (?b - vowel ?s - stack)
    :precondition (and (holding ?b) (free_stack ?s))
    :effect (and
      (not (holding ?b))
      (empty_hand)
      (on-table ?b ?s)
      (top ?b ?s)
      (stack ?s)
      (not (free_stack ?s))
    )
  )

  ; ACTIONS FOR CONSONANT-ONLY AGENT (B, C, D, F, G, H, J, K, L, M, N)
  (:action pick-consonant-from-block
    :parameters (?b - consonant ?under - block ?s - stack)
    :precondition (and (top ?b ?s) (on ?b ?under) (empty_hand) (stack ?s))
    :effect (and
      (holding ?b)
      (not (empty_hand))
      (not (top ?b ?s))
      (not (on ?b ?under))
      (top ?under ?s)
    )
  )

  (:action pick-consonant-from-table
    :parameters (?b - consonant ?s - stack)
    :precondition (and (top ?b ?s) (on-table ?b ?s) (empty_hand) (stack ?s))
    :effect (and
      (holding ?b)
      (not (empty_hand))
      (not (top ?b ?s))
      (not (on-table ?b ?s))
      (not (stack ?s))
      (free_stack ?s)
    )
  )

  (:action place-consonant-on-block
    :parameters (?b - consonant ?dest - block ?sd - stack)
    :precondition (and (holding ?b) (top ?dest ?sd) (stack ?sd))
    :effect (and
      (not (holding ?b))
      (empty_hand)
      (on ?b ?dest)
      (top ?b ?sd)
      (not (top ?dest ?sd))
    )
  )

  (:action place-consonant-on-table
    :parameters (?b - consonant ?s - stack)
    :precondition (and (holding ?b) (free_stack ?s))
    :effect (and
      (not (holding ?b))
      (empty_hand)
      (on-table ?b ?s)
      (top ?b ?s)
      (stack ?s)
      (not (free_stack ?s))
    )
  )
)