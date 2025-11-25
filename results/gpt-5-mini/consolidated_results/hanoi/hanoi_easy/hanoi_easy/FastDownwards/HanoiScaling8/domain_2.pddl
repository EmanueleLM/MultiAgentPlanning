(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    disk - object
    peg  - object
    time
  )

  (:predicates
    ;; disk D is directly on object O (peg or disk) at time T
    (on ?d - disk ?o - object ?t - time)
    ;; disk D is top of its stack (nothing directly on D) at time T
    (top ?d - disk ?t - time)
    ;; peg P has nothing on it (top position is empty) at time T
    (empty ?p - peg ?t - time)

    ;; size ordering: (smaller x y) means disk x is strictly smaller than disk y (static)
    (smaller ?x - disk ?y - disk)

    ;; successor relation over discrete time points
    (succ ?t - time ?s - time)

    ;; markers for the t->s transition:
    ;; moved ?t means a single move action was executed during time t (to reach successor s)
    (moved ?t - time)
    ;; moved-disk ?d ?t marks which disk was moved at time t (there will be exactly one per moved t)
    (moved-disk ?d - disk ?t - time)
    ;; moved-to ?p ?t marks that at time t some disk was moved onto peg p
    (moved-to ?p - peg ?t - time)
    ;; freed ?o ?t marks that the object o (peg or disk) had its top freed by the move during t
    (freed ?o - object ?t - time)
  )

  ;; Four move action variants to cover source/target being peg or disk.
  ;; Each move consumes the "not moved" condition for time t and produces markers
  ;; so that copy actions can deterministically copy the remaining facts to the successor time.

  (:action move_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (empty ?to ?t)
      (succ ?t ?s)
      (not (moved ?t))
    )
    :effect (and
      ;; moved disk's new location at successor
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; peg occupancy updates at successor
      (not (empty ?to ?s))
      (empty ?from ?s)
      ;; transition markers for this time step
      (moved ?t)
      (moved-disk ?d ?t)
      (moved-to ?to ?t)
      (freed ?from ?t)
    )
  )

  (:action move_from_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (empty ?to ?t)
      (succ ?t ?s)
      (not (moved ?t))
    )
    :effect (and
      (on ?d ?to ?s)
      (top ?d ?s)
      (not (empty ?to ?s))
      ;; the disk that supported ?d becomes top at successor
      (top ?from ?s)
      (moved ?t)
      (moved-disk ?d ?t)
      (moved-to ?to ?t)
      (freed ?from ?t)
    )
  )

  (:action move_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (top ?to ?t)
      (smaller ?d ?to)
      (succ ?t ?s)
      (not (moved ?t))
    )
    :effect (and
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; the target disk is no longer top at successor
      (not (top ?to ?s))
      ;; the source peg becomes empty at successor
      (empty ?from ?s)
      (moved ?t)
      (moved-disk ?d ?t)
      (moved-to ?from ?t) ;; mark that a peg was involved (useful consistency marker)
      (freed ?from ?t)
      (freed ?to ?t)
    )
  )

  (:action move_from_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (top ?to ?t)
      (smaller ?d ?to)
      (succ ?t ?s)
      (not (moved ?t))
    )
    :effect (and
      (on ?d ?to ?s)
      (top ?d ?s)
      (not (top ?to ?s))
      ;; source disk becomes top at successor
      (top ?from ?s)
      (moved ?t)
      (moved-disk ?d ?t)
      (freed ?from ?t)
      (freed ?to ?t)
    )
  )

  ;; Copy actions: after one move per time t has executed (moved ?t), copy the location
  ;; and top/empty facts of every disk/peg that was not the moved disk and was not affected
  ;; by the move (i.e., its support was not freed by the move). Negative preconditions
  ;; prevent overwriting the explicit effects produced by the single move.

  (:action copy_top_from_peg
    :parameters (?d - disk ?from - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      ;; if the peg was freed by the move this copy must not run (the move sets peg state at successor)
      (not (freed ?from ?t))
    )
    :effect (and
      (on ?d ?from ?s)
      (top ?d ?s)
      (not (empty ?from ?s))
    )
  )

  (:action copy_top_from_disk
    :parameters (?d - disk ?from - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?from ?t))
    )
    :effect (and
      (on ?d ?from ?s)
      (top ?d ?s)
      (not (top ?from ?s))
    )
  )

  (:action copy_not_top_from_peg
    :parameters (?d - disk ?from - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (not (top ?d ?t))
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      ;; only copy the "not top" status if the support was not freed by the move
      (not (freed ?from ?t))
    )
    :effect (and
      (on ?d ?from ?s)
      (not (top ?d ?s))
      (not (empty ?from ?s))
    )
  )

  (:action copy_not_top_from_disk
    :parameters (?d - disk ?from - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (not (top ?d ?t))
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?from ?t))
    )
    :effect (and
      (on ?d ?from ?s)
      (not (top ?d ?s))
      (not (top ?from ?s))
    )
  )

  ;; Copy empty pegs that remained empty (no disk was moved onto them)
  (:action copy_empty_peg
    :parameters (?p - peg ?t - time ?s - time)
    :precondition (and
      (empty ?p ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-to ?p ?t))
    )
    :effect (and
      (empty ?p ?s)
    )
  )
)