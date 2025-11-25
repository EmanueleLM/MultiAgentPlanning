(define (domain hanoi_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-d ?d - disk ?under - disk)        ; disk ?d is directly on disk ?under
    (on-p ?d - disk ?p - peg)            ; disk ?d is directly on peg ?p
    (clear-d ?d - disk)                  ; nothing is on top of disk ?d
    (clear-p ?p - peg)                   ; peg ?p is empty
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is smaller than ?d2
    (current-stage ?s - stage)           ; current stage identifier
    (succ ?s1 - stage ?s2 - stage)       ; successor relation between stages
  )

  ;; Move a top disk that was directly on another disk onto another disk
  (:action move-disk-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?st - stage ?nst - stage)
    :precondition (and
      (on-d ?d ?from)
      (clear-d ?d)
      (clear-d ?to)
      (smaller ?d ?to)
      (current-stage ?st)
      (succ ?st ?nst)
    )
    :effect (and
      (not (on-d ?d ?from))
      (on-d ?d ?to)
      (not (clear-d ?to))
      (clear-d ?from)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )

  ;; Move a top disk that was directly on another disk onto an empty peg
  (:action move-disk-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?st - stage ?nst - stage)
    :precondition (and
      (on-d ?d ?from)
      (clear-d ?d)
      (clear-p ?to)
      (current-stage ?st)
      (succ ?st ?nst)
    )
    :effect (and
      (not (on-d ?d ?from))
      (on-p ?d ?to)
      (not (clear-p ?to))
      (clear-d ?from)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )

  ;; Move a top disk that was directly on a peg onto another disk
  (:action move-disk-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?st - stage ?nst - stage)
    :precondition (and
      (on-p ?d ?from)
      (clear-d ?d)
      (clear-d ?to)
      (smaller ?d ?to)
      (current-stage ?st)
      (succ ?st ?nst)
    )
    :effect (and
      (not (on-p ?d ?from))
      (on-d ?d ?to)
      (not (clear-d ?to))
      (clear-p ?from)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )

  ;; Move a top disk that was directly on a peg onto another empty peg
  (:action move-disk-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?st - stage ?nst - stage)
    :precondition (and
      (on-p ?d ?from)
      (clear-d ?d)
      (clear-p ?to)
      (current-stage ?st)
      (succ ?st ?nst)
    )
    :effect (and
      (not (on-p ?d ?from))
      (on-p ?d ?to)
      (not (clear-p ?to))
      (clear-p ?from)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )
)