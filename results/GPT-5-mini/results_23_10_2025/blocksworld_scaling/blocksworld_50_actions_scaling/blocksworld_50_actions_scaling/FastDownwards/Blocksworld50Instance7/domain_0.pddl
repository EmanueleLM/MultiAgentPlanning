(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?b - block ?s - block)    ; block ?b is on block ?s
    (ontable ?b - block)          ; block ?b is on the table
    (clear ?b - block)            ; no block on top of ?b
    (agent ?a - agent)            ; identifies agents
  )

  ; Move a block from one block onto another block
  (:action move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and (agent ?ag) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (not (ontable ?b))
      (clear ?b)
    )
  )

  ; Move a block from one block onto the table
  (:action move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and (agent ?ag) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ; Move a block from the table onto another block
  (:action move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and (agent ?ag) (ontable ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ; (Optional) Move a block from the table to the table is a no-op in effect,
  ; we omit it because it is redundant; moves between block and table are covered.
)