(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)            ; disk d is on peg p (somewhere in that peg's stack)
    (top ?d - disk ?p - peg)           ; disk d is the top disk of peg p
    (bottom ?d - disk ?p - peg)        ; disk d is the bottom disk of peg p (no disk below it)
    (empty ?p - peg)                   ; peg p has no disks
    (above ?d1 - disk ?d2 - disk)      ; d1 is immediately above d2 on the same peg
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2
  )

  ;; Move a top disk that has a disk below it (i.e., not bottom) to an empty destination peg.
  (:action move-with-below-to-empty
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)        ; there is a disk immediately below d on source
      (empty ?to)          ; destination is empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; update source: the disk below becomes the new top, remove adjacency between d and b
      (top ?b ?from)
      (not (above ?d ?b))

      ;; destination is no longer empty
      (not (empty ?to))
    )
  )

  ;; Move a top disk that has a disk below it to a non-empty destination peg (stack on top of its top).
  (:action move-with-below-to-nonempty
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)        ; d has a disk b directly below it at source
      (top ?t ?to)         ; t is the current top disk at destination
      (smaller ?d ?t)      ; size constraint: d must be smaller than destination top
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination previous top is no longer the top; it becomes immediately below d
      (not (top ?t ?to))
      (above ?d ?t)

      ;; source: disk below becomes the new top, remove adjacency between d and b
      (top ?b ?from)
      (not (above ?d ?b))
    )
  )

  ;; Move a top disk that is also the bottom disk (the only disk on its peg) to an empty destination peg.
  (:action move-only-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)    ; d has no disk below it (it's bottom)
      (empty ?to)          ; destination is empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; source becomes empty and has no bottom disk
      (empty ?from)
      (not (bottom ?d ?from))

      ;; destination now holds d as both top and bottom
      (not (empty ?to))
      (bottom ?d ?to)
    )
  )

  ;; Move a top disk that is also the bottom disk (only disk on source peg) to a non-empty destination peg.
  (:action move-only-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)    ; d has no disk below it at source (single disk)
      (top ?t ?to)         ; t is the current top at destination
      (smaller ?d ?t)      ; size ordering constraint
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination updates: previous top is no longer top and becomes below d
      (not (top ?t ?to))
      (above ?d ?t)

      ;; source becomes empty and no longer has d as bottom
      (empty ?from)
      (not (bottom ?d ?from))
    )
  )
)