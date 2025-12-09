(define (domain hanoi)
  ; Contributions:
  ; mover: defined move actions that enforce top-only moves and size constraints
  ; strategist: specified disk size ordering and goal stack configuration
  ; auditor: enforced strict constraints (no penalty shortcuts) and required explicit predicates and typing
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg)  ; disk and peg are both places (a disk can support another disk)
  (:predicates
    (on ?d - disk ?s - place)        ; disk ?d is immediately on place ?s (s is a disk or a peg)
    (clear ?p - place)              ; nothing is on top of place ?p (true for an empty peg or a disk that has no disk above it)
    (smaller ?d1 - disk ?d2 - disk) ; disk d1 is strictly smaller than disk d2
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (not (clear ?to))   ; the destination peg now has a disk on top
             (clear ?from)       ; the former support (disk or peg) now has nothing on top
            )
  )

  ; Move a top disk onto another disk, only if the moving disk is smaller
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                   )
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (not (clear ?to))   ; the disk receiving ?d is no longer clear (has a disk on top)
             (clear ?from)       ; the former support (disk or peg) now has nothing on top
            )
  )
)