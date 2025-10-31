(define (domain integrated-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Actions provided by vowel_agent
  (:action vowel_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action vowel_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Actions provided by consonant_agent
  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)