(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is directly on ?y
    (ontable ?x - block)           ; ?x is directly on the table
    (clear ?x - block)             ; nothing is on ?x
  )

  ;; Vowel-agent actions: may move only vowels (A, E, I).
  ;; Moves a vowel from a block to the table.
  (:action vowel_move_from_block_to_table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Moves a vowel from one block to another block (both blocks are generic).
  (:action vowel_move_from_block_onto
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Moves a vowel from the table onto a top block.
  (:action vowel_move_from_table_onto
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Consonant-agent actions: may move only consonants (B, C, D, F, G, H, J, K).
  ;; Consonant moves are constrained not to place consonants onto vowels
  ;; (to avoid locking vowels in place). Consonants may be placed only on other consonants
  ;; or on the table (per the agents' strict cooperation constraint).

  (:action consonant_move_from_block_to_table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Move a consonant from a block onto another consonant (not onto vowels).
  (:action consonant_move_from_block_onto
    :parameters (?b - consonant ?from - block ?to - consonant)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move a consonant from the table onto another consonant.
  (:action consonant_move_from_table_onto
    :parameters (?b - consonant ?to - consonant)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )
)