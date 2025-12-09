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

  ;; Move top disk from a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))   ; prevent trivial move when ?from = ?to
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; source becomes clear (peg empty)
      (not (clear ?to))  ; destination peg now occupied

      (clear ?d)         ; moved disk is top at destination

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move top disk from a peg onto a top disk on another peg (peg -> disk)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)   ; cannot place larger on smaller
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; source peg becomes clear
      (not (clear ?to))  ; destination disk no longer clear

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move top disk from on top of a disk to an empty peg (disk -> peg)
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)     ; the supporting disk becomes clear
      (not (clear ?to)) ; destination peg becomes occupied

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move top disk from on top of a disk onto a top disk on another peg (disk -> disk)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)