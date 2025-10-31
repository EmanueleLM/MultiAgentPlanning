(define (domain blocks_vowel_consonant)
  :requirements :strips :typing :negative-preconditions
  :types
    vowel consonant - block
    block stack
  :predicates
    (on ?x - block ?y - block)        ; x is directly on block y
    (on-table ?x - block ?s - stack)  ; x is directly on the table at stack s
    (top ?x - block ?s - stack)       ; x is the top block of stack s
    (stack ?s - stack)                ; stack s is currently an active (non-empty) stack
    (free_stack ?s - stack)           ; stack s is currently free (no block on it)

  ; ----------------------------
  ; Vowel agent atomic moves (A, E, I, O)
  ; four variants: from-block->to-block, from-block->to-table, from-table->to-block, (from-table->to-table not needed)
  ; ----------------------------
  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?sfrom - stack ?under - block ?sd - stack ?dest - block)
    :precondition (and
      (top ?b ?sfrom)
      (on ?b ?under)
      (top ?dest ?sd)
      (stack ?sfrom)
      (stack ?sd)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?dest)
      (not (top ?b ?sfrom))
      (not (top ?dest ?sd))
      (top ?b ?sd)
      (top ?under ?sfrom)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?sfrom - stack ?under - block ?snew - stack)
    :precondition (and
      (top ?b ?sfrom)
      (on ?b ?under)
      (free_stack ?snew)
      (stack ?sfrom)
    )
    :effect (and
      (not (on ?b ?under))
      (on-table ?b ?snew)
      (not (top ?b ?sfrom))
      (top ?b ?snew)
      (not (free_stack ?snew))
      (stack ?snew)
      (top ?under ?sfrom)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?sfrom - stack ?sd - stack ?dest - block)
    :precondition (and
      (top ?b ?sfrom)
      (on-table ?b ?sfrom)
      (top ?dest ?sd)
      (stack ?sd)
      (stack ?sfrom)
    )
    :effect (and
      (not (on-table ?b ?sfrom))
      (not (top ?b ?sfrom))
      (not (stack ?sfrom))
      (free_stack ?sfrom)
      (on ?b ?dest)
      (not (top ?dest ?sd))
      (top ?b ?sd)
    )
  )

  ; ----------------------------
  ; Consonant agent atomic moves (B, C, D, F, G, H, J, K, L, M, N)
  ; identical structure to vowel actions but constrained by type
  ; ----------------------------
  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?sfrom - stack ?under - block ?sd - stack ?dest - block)
    :precondition (and
      (top ?b ?sfrom)
      (on ?b ?under)
      (top ?dest ?sd)
      (stack ?sfrom)
      (stack ?sd)
    )
    :effect (and
      (not (on ?b ?under))
      (on ?b ?dest)
      (not (top ?b ?sfrom))
      (not (top ?dest ?sd))
      (top ?b ?sd)
      (top ?under ?sfrom)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?sfrom - stack ?under - block ?snew - stack)
    :precondition (and
      (top ?b ?sfrom)
      (on ?b ?under)
      (free_stack ?snew)
      (stack ?sfrom)
    )
    :effect (and
      (not (on ?b ?under))
      (on-table ?b ?snew)
      (not (top ?b ?sfrom))
      (top ?b ?snew)
      (not (free_stack ?snew))
      (stack ?snew)
      (top ?under ?sfrom)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - consonant ?sfrom - stack ?sd - stack ?dest - block)
    :precondition (and
      (top ?b ?sfrom)
      (on-table ?b ?sfrom)
      (top ?dest ?sd)
      (stack ?sd)
      (stack ?sfrom)
    )
    :effect (and
      (not (on-table ?b ?sfrom))
      (not (top ?b ?sfrom))
      (not (stack ?sfrom))
      (free_stack ?sfrom)
      (on ?b ?dest)
      (not (top ?dest ?sd))
      (top ?b ?sd)
    )
  )
)