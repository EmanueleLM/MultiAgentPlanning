(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?support - disk)        ; disk ?d is immediately on disk ?support
    (on-peg ?d - disk ?p - peg)           ; disk ?d is immediately on peg ?p
    (clear-disk ?d - disk)                ; no disk is immediately on ?d (it is top)
    (clear-peg ?p - peg)                  ; no disk is immediately on peg ?p (peg empty)
    (smaller ?d1 - disk ?d2 - disk)       ; static size ordering: ?d1 smaller than ?d2
    (next ?s1 - step ?s2 - step)          ; temporal successor relation between steps
    (current ?s - step)                   ; which step is currently active
  )

  ;; Move a disk that is directly on an empty source peg to an empty target peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; disk ?d is top (peg had exactly this disk)
      (clear-peg ?to)    ; target peg is empty
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; remove from source peg and place on target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty, target peg not empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; disk remains top after move
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on an empty source peg onto a top disk on another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)     ; disk ?d is top on its peg
      (clear-disk ?top)   ; destination top disk has no disk on it
      (smaller ?d ?top)   ; size constraint: moving disk must be smaller than top
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; remove from source peg and place on destination disk
      (not (on-peg ?d ?from))
      (on ?d ?top)

      ;; source peg becomes empty, destination top is no longer clear
      (clear-peg ?from)
      (not (clear-disk ?top))

      ;; moved disk is now top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)     ; ?d is top
      (clear-peg ?to)     ; target peg empty
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; remove support-from-disk and place on peg
      (not (on ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was supporting ?d becomes top (clear)
      (clear-disk ?from)

      ;; target peg becomes non-empty
      (not (clear-peg ?to))

      ;; moved disk remains top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)     ; ?d is top
      (clear-disk ?top)   ; destination top disk has no disk on it
      (smaller ?d ?top)   ; size ordering
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; re-link supports
      (not (on ?d ?from))
      (on ?d ?top)

      ;; the previous support disk becomes top
      (clear-disk ?from)

      ;; destination top disk no longer clear
      (not (clear-disk ?top))

      ;; moved disk is top
      (clear-disk ?d)
    )
  )
)