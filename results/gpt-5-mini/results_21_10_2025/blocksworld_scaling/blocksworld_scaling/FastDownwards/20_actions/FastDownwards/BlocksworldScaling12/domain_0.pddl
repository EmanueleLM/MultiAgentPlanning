(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent moves a vowel block from one block onto another block
  (:action vowel_agent_move_onto
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      ;; b remains clear (it is top after the move)
      (clear ?b)
      (not (ontable ?b))
    )
  )

  ;; Vowel-agent moves a vowel block from the table onto another block
  (:action vowel_agent_move_table
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      ;; b remains clear
      (clear ?b)
    )
  )

  ;; Vowel-agent moves a vowel block from a block to the table
  (:action vowel_agent_move_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      ;; b remains clear
      (clear ?b)
    )
  )

  ;; Consonant-agent moves a consonant block from one block onto another block
  (:action consonant_agent_move_onto
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      ;; b remains clear
      (clear ?b)
      (not (ontable ?b))
    )
  )

  ;; Consonant-agent moves a consonant block from the table onto another block
  (:action consonant_agent_move_table
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      ;; b remains clear
      (clear ?b)
    )
  )

  ;; Consonant-agent moves a consonant block from a block to the table
  (:action consonant_agent_move_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      ;; b remains clear
      (clear ?b)
    )
  )
)