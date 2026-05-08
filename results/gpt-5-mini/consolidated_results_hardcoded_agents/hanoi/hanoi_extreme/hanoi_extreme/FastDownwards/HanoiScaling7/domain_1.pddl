(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; disk d is located on peg p (somewhere in the stack)
    (on ?d - disk ?p - peg)

    ; directly-on-disk u l p: u is directly on top of l on peg p
    (directly-on-disk ?u - disk ?l - disk ?p - peg)

    ; directly-on-peg d p: disk d is directly on the peg p (no disk under it)
    (directly-on-peg ?d - disk ?p - peg)

    ; top p d: disk d is the top disk of peg p
    (top ?p - peg ?d - disk)

    ; empty p: peg p has no disks
    (empty ?p - peg)

    ; size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ; step sequencing and control
    (step-ready ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (done ?s - step)
  )

  ;; Move actions. Four structural cases cover whether the moved disk is directly on a peg
  ;; or on another disk, and whether the destination peg is empty or not.
  ;; For each structural case we provide a variant that names a successor step (?snext)
  ;; and a final variant without a successor (for use at the terminal step).

  ;; 1) moved disk is directly on another disk at source, destination is non-empty (has a top disk).
  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      ; source updates
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      ; destination updates
      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ; location updates
      (not (on ?d ?from))
      (on ?d ?to)

      ; step bookkeeping
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-disk-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; 2) moved disk is directly on another disk at source, destination is empty.
  (:action move-disk-from-disk-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      ; source updates
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      ; destination updates
      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      ; location updates
      (not (on ?d ?from))
      (on ?d ?to)

      ; step bookkeeping
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-disk-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; 3) moved disk is directly on the source peg (it sits on peg), destination is non-empty.
  (:action move-disk-from-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      ; source becomes empty
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      ; destination updates
      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ; location updates
      (not (on ?d ?from))
      (on ?d ?to)

      ; step bookkeeping
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-peg-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; 4) moved disk is directly on the source peg, destination is empty.
  (:action move-disk-from-peg-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      ; source becomes empty
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      ; destination updates
      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      ; location updates
      (not (on ?d ?from))
      (on ?d ?to)

      ; step bookkeeping
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-peg-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

)