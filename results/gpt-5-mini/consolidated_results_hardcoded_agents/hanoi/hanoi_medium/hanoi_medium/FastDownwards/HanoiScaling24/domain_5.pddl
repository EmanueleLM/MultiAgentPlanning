(define (domain hanoi-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: 'place' is the supertype of pegs and disks; 'stage' models discrete time steps.
  (:types place stage peg disk - place)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; place (peg or disk) currently has nothing on top
    (clear ?p - place)

    ;; static size ordering: ?x is strictly smaller than ?y
    (smaller ?x - disk ?y - disk)

    ;; current active stage/time marker
    (current ?t - stage)

    ;; successor relation between stages
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk from its current support (?below) onto an empty peg (?to).
  (:action move-to-peg
    :parameters (?d - disk ?below - place ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; disk ?d is directly on ?below and is the top disk there
      (on ?d ?below)
      (clear ?d)

      ;; destination peg has nothing on top
      (clear ?to)

      ;; prevent trivial/self moves (typed objects make many equalities impossible,
      ;; but disallow accidental same-place moves when types allow it)
      (not (= ?below ?to))
    )
    :effect (and
      ;; remove old support relation and place on new peg support
      (not (on ?d ?below))
      (on ?d ?to)

      ;; the object that supported ?d becomes top/clear
      (clear ?below)

      ;; the destination peg now has something on it (not clear)
      (not (clear ?to))

      ;; moved disk is top at its destination
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from its current support (?below) onto another top disk (?top).
  (:action move-onto-disk
    :parameters (?d - disk ?below - place ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; source/top conditions
      (on ?d ?below)
      (clear ?d)

      ;; destination top disk must be top/clear
      (clear ?top)

      ;; size constraint: moving disk must be smaller than destination top
      (smaller ?d ?top)

      ;; prevent moving a disk onto itself or onto its own support
      (not (= ?d ?top))
      (not (= ?below ?top))
    )
    :effect (and
      ;; relocate disk to be directly on the destination disk ?top
      (not (on ?d ?below))
      (on ?d ?top)

      ;; source support becomes the new top
      (clear ?below)

      ;; the former top ?top is no longer clear (it now has ?d on top)
      (not (clear ?top))

      ;; moved disk is top at its destination
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )
)