(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)   ; disk ?d is directly on top of disk ?s
    (on-peg  ?d - disk ?p - peg)    ; disk ?d is directly on peg ?p (i.e., it is the bottom disk on that peg)
    (clear-disk ?d - disk)          ; disk ?d has no disk on top (is a top disk)
    (clear-peg  ?p - peg)           ; peg ?p has no disks (is empty)
    (current ?s - stage)            ; current stage/time step
    (succ ?s1 - stage ?s2 - stage)  ; successor relation between stages
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than disk ?d2
  )

  ;; Move a top disk that is the bottom disk on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is the bottom disk on a peg onto a top disk on another peg
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk onto a top disk on another peg
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (not (current ?s))
      (current ?s2)
    )
  )
)