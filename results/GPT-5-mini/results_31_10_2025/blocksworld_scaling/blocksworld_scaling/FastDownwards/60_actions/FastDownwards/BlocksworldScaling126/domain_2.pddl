(define (domain blocks_multiagent)
  (:requirements :strips :typing)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Consonant agent actions (can move only consonant blocks)
  (:action consonant_move_block_onto
    :parameters (?b - consonant ?below - block ?to - block)
    :precondition (and (on ?b ?below) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?below))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (clear ?below)
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - consonant ?below - block)
    :precondition (and (on ?b ?below) (clear ?b))
    :effect (and
      (not (on ?b ?below))
      (ontable ?b)
      (clear ?b)
      (clear ?below)
    )
  )

  (:action consonant_move_table_onto
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )

  ;; Vowel agent actions (can move only vowel blocks A, E, I)
  (:action vowel_move_block_onto
    :parameters (?b - vowel ?below - block ?to - block)
    :precondition (and (on ?b ?below) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?below))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (clear ?below)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - vowel ?below - block)
    :precondition (and (on ?b ?below) (clear ?b))
    :effect (and
      (not (on ?b ?below))
      (ontable ?b)
      (clear ?b)
      (clear ?below)
    )
  )

  (:action vowel_move_table_onto
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )
)