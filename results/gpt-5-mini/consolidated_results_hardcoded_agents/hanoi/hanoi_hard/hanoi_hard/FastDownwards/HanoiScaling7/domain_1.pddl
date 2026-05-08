(define (domain hanoi-6)
  ;; 6-disk Tower of Hanoi with explicit discrete time steps (t0..t63).
  ;; Actions advance the global time pointer along the successor chain.
  ;; :requirements limited to :strips :typing :negative-preconditions
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are both subtypes of place; time is a separate type.
  (:types disk peg - place time)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; nothing is directly on place ?p (p can be peg or disk)
    (clear ?p - place)
    ;; first disk is strictly larger than second disk
    (larger ?big - disk ?small - disk)
    ;; the current global time pointer
    (now ?t - time)
    ;; successor relation between time steps
    (next ?t1 - time ?t2 - time)
  )

  ;; Move a top disk ?d from support ?from to an empty peg ?to, advancing time by one step.
  (:action orchestrator_move_disk_to_peg
    :parameters (?d - disk ?from - place ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)       ; disk must be directly on its support
      (clear ?d)          ; disk must be the top disk on that support
      (clear ?to)         ; destination peg must be empty (no disk directly on it)
    )
    :effect (and
      ;; update placement
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clearness of source and destination supports
      (clear ?from)
      (not (clear ?to))
      ;; advance global time pointer (enforces contiguous stage progression)
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a top disk ?d from support ?from onto the top of a larger disk ?to, advancing time.
  (:action orchestrator_move_disk_to_disk
    :parameters (?d - disk ?from - place ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)       ; disk must be directly on its support
      (clear ?d)          ; disk must be the top disk on that support
      (clear ?to)         ; destination disk must be top (no disk on it)
      (larger ?to ?d)     ; destination disk must be larger than moved disk
    )
    :effect (and
      ;; update placement
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clearness of source and destination supports
      (clear ?from)
      (not (clear ?to))
      ;; advance global time pointer (enforces contiguous stage progression)
      (not (now ?t))
      (now ?t2)
    )
  )
)