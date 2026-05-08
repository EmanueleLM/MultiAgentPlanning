(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (disk or peg)
    (top ?d - disk)                 ; disk ?d has nothing above it
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (peg-empty ?p - peg)            ; peg has no disks on it (directly)
    (at-stage ?s - stage)           ; current discrete stage marker
    (next ?s1 - stage ?s2 - stage)  ; successor relation between stages
  )

  ;; Move a top disk that sits on a disk onto another disk
  (:action move-disk-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?to))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a disk onto an empty peg
  (:action move-disk-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (peg-empty ?p))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a peg onto another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?to))
      (top ?d)
      (peg-empty ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)
      (not (peg-empty ?to))
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )
)