(define (domain hanoi-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    stage
    disk peg - place
  )

  (:predicates
    ;; disk d is directly on place p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; place (peg or disk) currently has nothing on top
    (clear ?p - place)

    ;; static size ordering: x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; current active stage/time marker
    (current ?t - stage)

    ;; successor relation between stages
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk onto an empty place (peg or top-level place).
  (:action move-to-empty
    :parameters (?d - disk ?from - place ?to - place ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; disk ?d is directly on ?from and is the top disk there
      (on ?d ?from)
      (clear ?d)

      ;; destination place has nothing on top
      (clear ?to)

      ;; avoid no-op / self-move
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      ;; move d from 'from' to 'to'
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removing ?d, the source place becomes clear (since ?d was top)
      (clear ?from)

      ;; destination now has something on top, so it is not clear
      (not (clear ?to))

      ;; the moved disk is top at its destination (remains clear)
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must respect size ordering).
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - place ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; source/top conditions
      (on ?d ?from)
      (clear ?d)

      ;; destination top disk and that top is on ?to (top may be on a peg or disk)
      (on ?top ?to)
      (clear ?top)

      ;; size constraint: moving disk must be smaller than destination top
      (smaller ?d ?top)

      ;; distinctness constraints
      (not (= ?from ?to))
      (not (= ?d ?top))
      (not (= ?d ?to))
    )
    :effect (and
      ;; move d from 'from' to 'to' (now directly on ?to, above ?top)
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source place becomes clear (since ?d was top there)
      (clear ?from)

      ;; the former top ?top now has ?d on top, so it is not clear
      (not (clear ?top))

      ;; the moved disk is top at its destination (remains clear)
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )
)