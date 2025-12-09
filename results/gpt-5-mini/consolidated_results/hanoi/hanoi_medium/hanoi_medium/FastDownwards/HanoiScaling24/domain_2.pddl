(define (domain hanoi-orchestrator)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?d ?p)         ;; disk ?d is directly on place ?p (peg or disk)
    (clear ?p)         ;; place ?p (peg or disk) currently has nothing on top
    (smaller ?x ?y)    ;; static: x is strictly smaller than y
    (stage ?t)         ;; current active stage/time is ?t
    (next ?t1 ?t2)     ;; successor relation between stages
  )

  ;; Move a top disk onto an empty peg/place.
  (:action move-to-empty
    :parameters (?d ?from ?to ?t ?t2)
    :precondition (and
      (stage ?t)
      (next ?t ?t2)
      (on ?d ?from)     ;; ?d is directly on ?from (peg or disk)
      (clear ?d)        ;; ?d is top at source
      (clear ?to)       ;; destination is empty/topless
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source place becomes clear (the object that had ?d on it now has nothing on top)
      (clear ?from)

      ;; destination now has something on top, so it is no longer clear
      (not (clear ?to))

      ;; advance the global stage marker
      (stage ?t2)
      (not (stage ?t))
    )
  )

  ;; Move a top disk onto another disk that is currently the top at its place.
  (:action move-onto-disk
    :parameters (?d ?from ?to ?top ?t ?t2)
    :precondition (and
      (stage ?t)
      (next ?t ?t2)
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is top at source
      (on ?top ?to)        ;; ?top is directly on ?to (so ?top is the top element at place ?to)
      (clear ?top)         ;; ?top is top at destination
      (smaller ?d ?top)    ;; size constraint: mover must be smaller than the former top
      (not (= ?from ?to))
      (not (= ?d ?top))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the object that had ?d on it (the source place) becomes clear
      (clear ?from)

      ;; the former top ?top now has ?d on top, so it is not clear
      (not (clear ?top))

      ;; advance the global stage marker
      (stage ?t2)
      (not (stage ?t))
    )
  )
)