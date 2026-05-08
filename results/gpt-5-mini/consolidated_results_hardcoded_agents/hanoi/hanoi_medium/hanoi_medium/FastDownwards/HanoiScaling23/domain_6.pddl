(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?p - disk)     ; ?d is directly on disk ?p
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg ?p
    (clear-disk ?d - disk)            ; nothing directly on disk ?d
    (clear-peg ?p - peg)              ; nothing directly on peg ?p
    (larger ?x - disk ?y - disk)      ; ?x is larger than ?y
    (current-stage ?s - stage)        ; discrete current stage
    (succ ?s1 - stage ?s2 - stage)    ; successor relation between stages
  )

  ;; Move a top disk from one peg to another peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (on-peg ?d ?to))
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update clear flags
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from one disk to another peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from a peg onto another disk (must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk from one disk onto another disk (must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )
)