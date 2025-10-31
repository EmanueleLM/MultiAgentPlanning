(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)        ; ?d is directly on ?p (p is a disk or a peg)
    (clear ?d - disk)               ; no disk is on ?d
    (empty ?p - peg)                ; peg has no disk
    (can-place ?d - disk ?p - place) ; disk ?d may be placed on place ?p (peg or disk) according to size rules
    (allowed ?a - agent ?d - disk)  ; agent may move disk
  )

  ;; move a disk that is on a disk, onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; move a disk that is on a disk, onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (can-place ?d ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
    )
  )

  ;; move a disk that is on an empty or non-empty peg, onto another disk
  (:action move-disk-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (clear ?to))
    )
  )

  ;; move a disk that is on a peg, onto an empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (can-place ?d ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )
)