(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?under - block)    ; b directly on block under
    (ontable ?b - block)              ; b directly on the table
    (clear ?b - block)                ; nothing on b
    (vowel ?b - block)                ; b is a vowel block (vowel_agent can move)
    (consonant ?b - block)            ; b is a consonant block (consonant_agent can move)
  )

  ;; Vowel-agent actions (prefix vowel_)
  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (prefix consonant_)
  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )
)