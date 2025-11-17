(define (domain hanoi_3agents_15disks_fd)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controlled-by ?d - disk ?a - agent)
  )

  (:action move-peg-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (on ?d ?p1)
      (clear ?d)
      (clear ?p2)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  (:action move-peg-disk
    :parameters (?a - agent ?d - disk ?p - peg ?tgt - disk)
    :precondition (and
      (on ?d ?p)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?p))
      (on ?d ?tgt)
      (clear ?p)
      (not (clear ?tgt))
    )
  )

  (:action move-disk-peg
    :parameters (?a - agent ?d - disk ?src - disk ?p - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?p)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?p)
      (clear ?src)
      (not (clear ?p))
    )
  )

  (:action move-disk-disk
    :parameters (?a - agent ?d - disk ?src - disk ?tgt - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (controlled-by ?d ?a)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?tgt)
      (clear ?src)
      (not (clear ?tgt))
    )
  )
)