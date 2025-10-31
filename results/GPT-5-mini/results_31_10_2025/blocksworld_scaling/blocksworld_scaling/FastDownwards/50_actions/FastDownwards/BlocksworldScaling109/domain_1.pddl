(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; nothing is directly on ?x
  )

  ;; Vowel-agent actions (only vowels A,E,I can be moved)
  (:action vowel_move_from_block_to_table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

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

  (:action vowel_move_from_table_onto
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent actions (only consonants B,C,D,F,G,H,J,K)
  ;; Consonants are allowed to be placed on any block (vowel or consonant) or on the table.
  (:action consonant_move_from_block_to_table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant_move_from_block_onto
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant_move_from_table_onto
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)