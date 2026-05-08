(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p
    (on-disk ?d - disk ?p - disk)      ; ?d is directly on disk ?p
    (clear-disk ?d - disk)             ; nothing directly on disk ?d
    (clear-peg ?p - peg)               ; nothing directly on peg ?p
    (larger ?x - disk ?y - disk)       ; ?x is larger than ?y
    (current-stage ?s - stage)         ; discrete current stage
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg
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
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; from peg becomes clear (since the moved disk was directly on the peg)
      (clear-peg ?from)
      ;; destination peg is no longer clear
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is on another disk to an empty peg
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

      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was under ?d becomes clear
      (clear-disk ?from)
      ;; destination peg is no longer clear
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto another disk (target must be larger)
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

      ;; from peg becomes clear
      (clear-peg ?from)
      ;; target disk is no longer clear
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another disk (target must be larger)
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

      ;; the disk that was under ?d becomes clear
      (clear-disk ?from)
      ;; target disk is no longer clear
      (not (clear-disk ?to))
    )
  )
)