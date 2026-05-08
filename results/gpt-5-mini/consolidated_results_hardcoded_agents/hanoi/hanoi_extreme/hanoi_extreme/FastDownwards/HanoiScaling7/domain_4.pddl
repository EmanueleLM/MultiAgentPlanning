(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)                 ; disk directly on an empty peg (bottom disk on peg)
    (on-disk ?d - disk ?below - disk ?p - peg) ; disk directly on another disk located on peg
    (top ?p - peg ?d - disk)                   ; top disk of a peg
    (empty ?p - peg)                           ; peg empty
    (smaller ?d1 - disk ?d2 - disk)            ; size ordering: d1 smaller than d2
    (step-ready ?s - step)                     ; which step is ready to execute
    (step-next ?s1 - step ?s2 - step)          ; successor relation for steps
    (done ?s - step)                           ; step executed
  )

  ; Move a top disk that is directly on another disk, to a peg whose top is another disk (non-final step)
  (:action move-disk-disk-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?below - disk ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      ; update source peg: remove top, now top is the disk below
      (not (top ?from ?d))
      (not (on-disk ?d ?below ?from))
      (top ?from ?below)

      ; update destination peg: desttop is no longer top, d becomes directly on desttop and top
      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ; update peg occupancy facts for d (it was on ?from, now on ?to)
      (not (on-peg ?d ?from))
      (not (on-disk ?d ?below ?from)) ; redundant but explicit
      (on-disk ?d ?desttop ?to)

      ; step bookkeeping
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ; Final-step variant of disk->disk (no next)
  (:action move-disk-disk-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?below - disk ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (not (on-disk ?d ?below ?from))
      (on-disk ?d ?desttop ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ; Move a top disk that is directly on another disk, to an empty peg (non-final)
  (:action move-disk-disk-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?below - disk ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-disk ?d ?below ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (not (on-disk ?d ?below ?from))

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ; Final-step variant disk->empty
  (:action move-disk-disk-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-disk ?d ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (not (on-disk ?d ?below ?from))

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ; Move a top disk that is directly on the peg (only disk on that peg), to a peg whose top is another disk (non-final)
  (:action move-disk-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (on-disk ?d ?desttop ?to)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ; Final variant peg->disk
  (:action move-disk-peg-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (on-disk ?d ?desttop ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ; Move a top disk that is directly on the peg, to an empty peg (non-final)
  (:action move-disk-peg-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))
      (not (on-disk ?d ?from ?from)) ; no-op safe explicit cleanup

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ; Final variant peg->empty
  (:action move-disk-peg-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (not (on-peg ?d ?from))

      (done ?s)
      (not (step-ready ?s))
    )
  )
)