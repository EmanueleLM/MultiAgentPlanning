(define (domain multi_agent_blocks_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)    ; ?b is on top of block ?s
    (ontable ?b - block)          ; ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b
    (vowel ?b - block)            ; ?b can be moved only by vowel_agent
    (consonant ?b - block)        ; ?b can be moved only by consonant_agent
  )

  ;; Vowel-agent actions (only moves vowel-labeled blocks A, E, I)
  (:action vowel_agent-unstack-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?b)
      (clear ?under)
    )
  )

  (:action vowel_agent-stack-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_agent-unstack-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (only moves consonant-labeled blocks)
  (:action consonant_agent-unstack-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?b)
      (clear ?under)
    )
  )

  (:action consonant_agent-stack-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_agent-unstack-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )
)