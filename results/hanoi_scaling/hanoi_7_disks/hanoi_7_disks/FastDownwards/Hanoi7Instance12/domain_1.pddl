(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)
  (:predicates
    ;; disk ?d is directly on place ?p (place = disk or peg)
    (on ?d - disk ?p - object)
    ;; no disk on top of ?d
    (clear ?d - disk)
    ;; peg ?p has no disks on it
    (empty ?p - peg)
    ;; size ordering facts: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a disk that sits on a disk onto another disk (destination disk must be clear and larger)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the former supporting disk (?from) becomes clear (no disk on top)
      (clear ?from)
      ;; the destination disk is no longer clear (has ?d on top)
      (not (clear ?to))
    )
  )

  ;; Move a disk that sits on a peg onto a disk (peg may become empty)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; moving the only/top disk off the peg makes the peg empty
      (empty ?from)
      (not (clear ?to))
    )
  )

  ;; Move a disk that sits on a disk onto an empty peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the former supporting disk (?from) becomes clear
      (clear ?from)
      ;; the peg is no longer empty
      (not (empty ?to))
    )
  )

  ;; Move a disk that sits on a peg onto an empty peg (source peg becomes empty)
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )
)