(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)      ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)             ; nothing on top of place ?p (peg empty or disk top)
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2

    (time-now ?s - step)           ; current stage marker
    (next ?s1 - step ?s2 - step)   ; stage ordering
  )

  ;; Move when the moved disk is directly on a peg and destination is an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)     ; disk is directly on source peg
      (clear ?d)        ; disk is the top disk on that peg (nothing above it)
      (clear ?to)       ; destination peg is empty
      (not (on ?d ?to)) ; avoid no-op (disk already on destination)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; source peg becomes empty (disk was directly on it)
      (not (clear ?to))  ; destination peg becomes occupied

      (clear ?d)         ; moved disk is top at destination

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move when the moved disk is directly on a peg and destination is a top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)     ; disk directly on source peg
      (clear ?d)        ; disk is top
      (clear ?to)       ; destination disk is top (nothing above it)
      (smaller ?d ?to)  ; moved disk must be smaller than destination disk
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; source peg becomes empty
      (not (clear ?to))  ; destination disk no longer top

      (clear ?d)         ; moved disk is top on destination

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move when the moved disk is directly on top of a disk and destination is an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)     ; disk directly on supporting disk
      (clear ?d)        ; disk is top
      (clear ?to)       ; destination peg empty
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)     ; supporting disk becomes top (no longer covered)
      (not (clear ?to)) ; destination peg becomes occupied

      (clear ?d)        ; moved disk is top at destination

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move when the moved disk is directly on top of a disk and destination is a top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)     ; disk directly on supporting disk
      (clear ?d)        ; disk is top
      (clear ?to)       ; destination disk is top
      (smaller ?d ?to)  ; moved disk must be smaller than destination disk
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)     ; supporting disk becomes top
      (not (clear ?to)) ; destination disk no longer top

      (clear ?d)        ; moved disk is top at destination

      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)