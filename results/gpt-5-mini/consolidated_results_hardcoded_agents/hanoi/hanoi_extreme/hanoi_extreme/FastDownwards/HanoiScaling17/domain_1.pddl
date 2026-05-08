(define (domain hanoi-seven)
  ;; Tower of Hanoi with explicit ordered stages to enforce temporal/causal sequencing.
  ;; Requirements: STRIPS (no numeric features). Typing is declared for clarity.
  (:requirements :strips :typing)

  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?p - object)    ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - object)          ; place ?p (peg or disk) has nothing directly on it
    (smaller ?x - disk ?y - disk); size ordering: ?x is strictly smaller than ?y
    (current ?s - stage)         ; marker: which stage is currently active
    (next ?s - stage ?s2 - stage); ordered successor relation for stages
  )

  ;; Move a top disk onto an empty peg, advancing from stage ?s to its successor ?s2.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))

      ;; advance stage: consumes current ?s and produces current ?s2
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (destination is a disk), advancing stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)