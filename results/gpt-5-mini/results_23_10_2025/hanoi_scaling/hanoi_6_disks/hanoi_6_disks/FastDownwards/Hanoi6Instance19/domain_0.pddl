(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place)

  (:predicates
    ;; direct placement: a disk is directly on a place (peg or disk)
    (on ?d - disk ?p - place)
    ;; top-of-peg: ?d is the topmost disk on peg ?p (no disk above it on that peg)
    (top ?d - disk ?p - peg)
    ;; peg is empty (no disks on it)
    (empty ?p - peg)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is directly on a peg onto an empty peg
  (:action move-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (not (empty ?to))
      (on ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk ?t of another peg ?to
  (:action move-peg-to-peg-onto-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (not (top ?t ?to))
      (on ?d ?t)
      (top ?d ?to)
    )
  )

  ;; Move a top disk that is on top of another disk (?below) (i.e. not directly on a peg)
  ;; onto an empty peg
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on ?d ?below)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      ;; the disk that supported ?d becomes the new top on the source peg
      (top ?below ?from)
      (not (empty ?to))
      (on ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move a top disk that is on top of another disk (?below)
  ;; onto the top disk ?t of another peg ?to
  (:action move-disk-to-peg-onto-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?below))
      (not (top ?d ?from))
      ;; the disk that supported ?d becomes the new top on the source peg
      (top ?below ?from)
      (not (top ?t ?to))
      (on ?d ?t)
      (top ?d ?to)
    )
  )
)