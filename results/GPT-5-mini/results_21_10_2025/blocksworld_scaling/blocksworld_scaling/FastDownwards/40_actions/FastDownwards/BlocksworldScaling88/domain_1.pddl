(define (domain blocksworld-scaling88)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block
    vowel_block cons_block - block
  )

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Vowel agent actions (can move only vowel blocks: a e i)
  (:action vowel_agent-move-block-to-block
    :parameters (?b - vowel_block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_agent-move-block-to-table
    :parameters (?b - vowel_block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action vowel_agent-move-table-to-block
    :parameters (?b - vowel_block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant agent actions (can move only consonant blocks: j h k c b d g l f)
  (:action consonant_agent-move-block-to-block
    :parameters (?b - cons_block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_agent-move-block-to-table
    :parameters (?b - cons_block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant_agent-move-table-to-block
    :parameters (?b - cons_block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)