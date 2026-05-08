(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)    ; disk ?d is directly on peg ?p (i.e., it is the bottom disk on that peg)
    (on-disk ?d - disk ?b - disk)  ; disk ?d is directly on top of disk ?b
    (clear ?d - disk)              ; no disk is on top of disk ?d
    (empty ?p - peg)               ; peg ?p has no disks
    (smaller ?d - disk ?b - disk)  ; disk ?d is strictly smaller than disk ?b
  )

  ; Move a top disk that is currently on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ; Move a top disk that is currently on a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (clear ?below)
      (not (empty ?to))
    )
  )

  ; Move a top disk that is currently on a peg onto a (strictly) larger top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (not (= ?d ?t))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (clear ?t))
      (empty ?from)
    )
  )

  ; Move a top disk that is currently on a disk onto a (strictly) larger top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (not (= ?d ?t))
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (clear ?below)
      (not (clear ?t))
    )
  )
)