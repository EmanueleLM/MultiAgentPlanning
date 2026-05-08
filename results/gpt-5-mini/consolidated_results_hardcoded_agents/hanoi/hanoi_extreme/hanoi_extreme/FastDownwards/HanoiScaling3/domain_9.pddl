(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk is directly on a peg (immediately supported by the peg)
    (on-disk ?d - disk ?u - disk)    ; disk is directly on another disk (immediately above)
    (clear-disk ?d - disk)           ; nothing on top of this disk (it is the top of its stack)
    (clear-peg ?p - peg)             ; peg has nothing on it
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: d1 is smaller than d2
    (at ?d - disk ?p - peg)          ; disk's current peg (ultimate peg where its stack resides)
    (current ?s - stage)             ; current stage/timepoint
    (next ?s1 - stage ?s2 - stage)   ; successor relation between stages (contiguous progression)
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at ?d ?from)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; source location updates
      (not (on-peg ?d ?from))
      (clear-peg ?from)

      ;; destination location updates
      (on-peg ?d ?to)
      (not (clear-peg ?to))

      ;; update disk's peg
      (not (at ?d ?from))
      (at ?d ?to)

      ;; moved disk remains top at destination
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto another top disk (destination disk must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at ?to ?topeg)
      (at ?d ?from)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; source updates: disk leaves the peg, peg becomes empty
      (not (on-peg ?d ?from))
      (clear-peg ?from)

      ;; destination updates: disk now on top of destination disk
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; update moved disk's peg
      (not (at ?d ?from))
      (at ?d ?topeg)
    )
  )

  ;; Move a top disk that sits on another disk to an empty destination peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?frompeg - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
      (at ?d ?frompeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; remove from on-disk relation; underlying disk becomes top
      (not (on-disk ?d ?under))
      (clear-disk ?under)

      ;; place on destination peg
      (on-peg ?d ?to)
      (not (clear-peg ?to))

      ;; update disk's peg
      (not (at ?d ?frompeg))
      (at ?d ?to)

      ;; moved disk is top on destination
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that sits on another disk onto another top disk (destination must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?frompeg - peg ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at ?d ?frompeg)
      (at ?to ?topeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; remove from its previous support; underlying disk becomes top
      (not (on-disk ?d ?under))
      (clear-disk ?under)

      ;; put on top of destination disk
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; update disk's peg
      (not (at ?d ?frompeg))
      (at ?d ?topeg)
    )
  )
)