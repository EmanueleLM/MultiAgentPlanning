(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ; type predicates (convenience)
    (peg ?p - peg)
    (disk ?d - disk)

    ; immediate support relation: a disk is directly on either a peg or another disk (the second arg is typed as object)
    (on ?d - disk ?x - object)

    ; transitive membership: disk is on the stack of a peg (maintained by actions)
    (on-peg ?d - disk ?p - peg)

    ; object (disk or peg) has nothing directly on it
    (clear ?x - object)

    ; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ; peg has no disks at all
    (empty ?p - peg)

    ; disk is the topmost disk of a peg (i.e., directly on the peg or on a disk but is clear)
    (top ?d - disk ?p - peg)
  )

  ;; Move a top disk that sits directly on another disk (?s) to an empty peg (?to).
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?s)
      (on ?s ?from)
      (top ?d ?from)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ; update immediate support
      (not (on ?d ?s))
      (on ?d ?to)

      ; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ; the disk that supported ?d becomes clear and becomes top of source peg
      (clear ?s)
      (top ?s ?from)

      ; destination peg is no longer empty or clear
      (not (empty ?to))
      (not (clear ?to))

      ; update on-peg membership: disk leaves source peg and joins destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
    )
  )

  ;; Move a top disk that sits directly on another disk (?s) onto another disk (?d2) which is the current top of its peg.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?from - peg ?d2 - disk ?to - peg)
    :precondition (and
      (on ?d ?s)
      (on ?s ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (clear ?d)
      (smaller ?d ?d2)
    )
    :effect (and
      ; update immediate support
      (not (on ?d ?s))
      (on ?d ?d2)

      ; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ; previous support disk becomes clear and becomes top of source peg
      (clear ?s)
      (top ?s ?from)

      ; destination top disk now has something on it -> not clear
      (not (clear ?d2))

      ; update on-peg membership
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
    )
  )

  ;; Move a top disk that sits directly on a peg (?from) to an empty peg (?to).
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ; immediate support switches from peg to peg
      (not (on ?d ?from))
      (on ?d ?to)

      ; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ; source peg becomes empty and clear
      (empty ?from)
      (clear ?from)

      ; destination peg ceases to be empty/clear
      (not (empty ?to))
      (not (clear ?to))

      ; update on-peg membership
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
    )
  )

  ;; Move a top disk that sits directly on a peg (?from) onto another disk (?d2) which is top of its peg (?to).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?d2 - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (clear ?d)
      (smaller ?d ?d2)
    )
    :effect (and
      ; immediate support switches from peg to disk
      (not (on ?d ?from))
      (on ?d ?d2)

      ; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ; source peg becomes empty and clear
      (empty ?from)
      (clear ?from)

      ; destination top disk ceases to be clear
      (not (clear ?d2))

      ; update on-peg membership
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
    )
  )
)