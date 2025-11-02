(define (domain blocksworld-sequence)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?x ?y)            ; block ?x on block ?y
    (ontable ?x)          ; block ?x on table
    (clear ?x)            ; nothing on block ?x
    (holding ?ag ?x)      ; agent ?ag is holding block ?x
    (handempty ?ag)       ; agent ?ag has empty hand
    (stage ?s)            ; current stage marker
    (succ ?s ?s2)         ; successor relation between stages
    (allowed-move ?s ?x ?y) ; at stage ?s the move (?x -> ?y) is allowed (use 'table' for table)
  )

  ;; Unstack: remove a top block ?x from block ?y and hold it.
  (:action unstack
    :parameters (?ag ?x ?y ?s ?s2)
    :precondition (and
      (stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Putdown: put a held block ?x on the table.
  (:action putdown
    :parameters (?ag ?x ?s ?s2)
    :precondition (and
      (stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x table)
      (holding ?ag ?x)
    )
    :effect (and
      (not (holding ?ag ?x))
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Pickup: pick up a block ?x from the table.
  (:action pickup
    :parameters (?ag ?x ?s ?s2)
    :precondition (and
      (stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x table)
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Stack: put a held block ?x onto block ?y.
  (:action stack
    :parameters (?ag ?x ?y ?s ?s2)
    :precondition (and
      (stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (holding ?ag ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding ?ag ?x))
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?ag)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)