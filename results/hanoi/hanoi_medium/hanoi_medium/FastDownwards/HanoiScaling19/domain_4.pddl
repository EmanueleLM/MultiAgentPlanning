(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?support - disk)        ; disk ?d is immediately on disk ?support
    (on-peg ?d - disk ?p - peg)           ; disk ?d is immediately on peg ?p
    (clear-disk ?d - disk)                ; no disk is immediately on ?d (it is top)
    (clear-peg ?p - peg)                  ; peg ?p has no disk on it (empty)
    (smaller ?d1 - disk ?d2 - disk)       ; static size ordering: ?d1 is smaller than ?d2
    (next ?s1 - step ?s2 - step)          ; temporal successor relation between steps
    (current ?s - step)                   ; which step is currently active
  )

  ;; Move a top disk that is on an empty source peg to an empty target peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)    ; ?d is immediately on source peg
      (clear-disk ?d)      ; ?d is the top disk on its peg
      (clear-peg ?to)      ; target peg is empty
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; remove from source peg and place on target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; target peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk is top (remains clear)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on an empty source peg onto a top disk on another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)     ; ?d is immediately on source peg
      (clear-disk ?d)       ; ?d is top on its peg
      (clear-disk ?top)     ; destination top disk has no disk on it
      (smaller ?d ?top)     ; size constraint: moving disk must be smaller than destination top
      (not (= ?from ?top))  ; ensure different support objects/types
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      ;; remove from source peg and place on destination disk
      (not (on-peg ?d ?from))
      (on ?d ?top)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; destination top disk is no longer clear
      (not (clear-disk ?top))

      ;; moved disk becomes top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)         ; ?d is immediately on disk ?from
      (clear-disk ?d)       ; ?d is top
      (clear-peg ?to)       ; target peg empty
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

      ;; moved disk becomes top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)         ; ?d is immediately on disk ?from
      (clear-disk ?d)       ; ?d is top
      (clear-disk ?top)     ; destination top disk has no disk on it
      (smaller ?d ?top)     ; size ordering
      (not (= ?from ?top))
      (not (= ?d ?top))
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

      ;; moved disk becomes top
      (clear-disk ?d)
    )
  )
)