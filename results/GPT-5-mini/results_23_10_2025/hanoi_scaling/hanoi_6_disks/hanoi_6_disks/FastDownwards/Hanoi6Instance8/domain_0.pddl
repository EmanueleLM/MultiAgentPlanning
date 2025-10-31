(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (represents ?a - agent ?p - peg)
  )

  ;; Move a top disk from any place to an empty peg, mediated by source and target agents.
  (:action move-to-peg
    :parameters (?ag-from - agent ?ag-to - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (represents ?ag-from ?from)
      (represents ?ag-to ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
    )
  )

  ;; Move a top disk from any place onto a top disk (must be larger than the moving disk),
  ;; mediated by source and target agents.
  (:action move-to-disk
    :parameters (?ag-from - agent ?ag-to - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (represents ?ag-from ?from)
      (represents ?ag-to ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
    )
  )
)