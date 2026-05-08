(define (domain hanoi-orchestrator)
  (:requirements :strips :negative-preconditions)

  ;; Untyped domain to avoid type-subtyping parsing issues.
  ;; Predicates:
  ;; (on ?d ?p)       - disk ?d is directly on place ?p (peg or disk)
  ;; (clear ?p)       - place ?p (peg or disk) currently has nothing on top
  ;; (smaller ?x ?y)  - x is strictly smaller than y (static invariant)
  ;; (stage ?t)       - the current active stage/time is ?t
  ;; (next ?t1 ?t2)   - successor relation between stages
  (:predicates
    (on ?d ?p)
    (clear ?p)
    (smaller ?x ?y)
    (stage ?t)
    (next ?t1 ?t2)
  )

  ;; Move onto an empty place (peg that is empty).
  (:action move-to-empty
    :parameters (?d ?from ?to ?t ?t2)
    :precondition (and
      (stage ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)        ;; ?d must be top of its source
      (clear ?to)       ;; destination must be empty (a clear peg)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ;; source becomes clear after removing its top
      (not (clear ?to)) ;; destination is no longer clear since ?d sits on it
      (stage ?t2)       ;; advance the global stage
      (not (stage ?t))
    )
  )

  ;; Move onto a disk that is currently the top at its place (must be larger than mover).
  (:action move-onto-disk
    :parameters (?d ?from ?to ?top ?t ?t2)
    :precondition (and
      (stage ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ;; ?d is top at source
      (on ?top ?to)        ;; ?top is the top disk at destination place ?to
      (clear ?top)         ;; ?top must be top at destination
      (smaller ?d ?top)    ;; size constraint: mover must be smaller
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ;; source place becomes clear
      (not (clear ?top))   ;; former top is no longer clear
      (stage ?t2)
      (not (stage ?t))
    )
  )

)