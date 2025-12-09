; Domain: Tower of Hanoi (single-agent planning instance)
; Agents and roles (documentary only; this is a single-agent planning problem for FastDownwards):
; - Decomposer: produced a candidate move sequence (integrated implicitly via the domain/problem constraints)
; - Auditor: validated stack and size consistency (encoded as strict constraints below)
; The planning instance below models disks and pegs explicitly and enforces Tower-of-Hanoi rules.
(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place)

  ; Predicates:
  ; (on ?d ?p)    - disk ?d is directly on place ?p (place = peg or disk)
  ; (top ?d ?peg) - disk ?d is the top disk of peg ?peg (i.e., the disk currently accessible on that peg)
  ; (empty ?peg)  - peg ?peg currently has no disks
  ; (smaller ?d1 ?d2) - disk ?d1 is strictly smaller than disk ?d2 (static, used to restrict legal placements)
  (:predicates
    (on ?d - disk ?p - place)
    (top ?d - disk ?peg - peg)
    (empty ?peg - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Action: move top disk which is directly on a peg to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (empty ?to))
      (empty ?from)
    )
  )

  ; Action: move top disk which is directly on a peg to a peg whose top is disk ?t (must be larger than moved disk)
  (:action move-from-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (top ?t ?to))
      (empty ?from)
    )
  )

  ; Action: move top disk which is on top of another disk ?below to an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (on ?d ?below)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?below ?from)

      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ; Action: move top disk which is on top of another disk ?below to a peg whose top is disk ?t (must be larger than moved disk)
  (:action move-from-disk-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (on ?d ?below)
      (top ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?t)

      (not (top ?d ?from))
      (top ?below ?from)

      (not (top ?t ?to))
      (top ?d ?to)
    )
  )

)