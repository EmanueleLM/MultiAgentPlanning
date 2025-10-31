(define (domain blocksworld_scaling148)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Vowel agent actions: can move only vowels (a e i)
  (:action vowel_move_block_block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel_move_block_table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action vowel_move_table_block
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant agent actions: can move only consonants
  (:action consonant_move_block_block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant_move_block_table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant_move_table_block
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)