(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    time
  )

  (:predicates
    ;; dynamic state indexed by time
    (on ?d - disk ?o - place ?t - time)     ;; disk ?d is directly on place ?o at time ?t
    (top ?d - disk ?t - time)               ;; disk ?d is the top disk of its stack at time ?t
    (empty ?p - peg ?t - time)              ;; peg ?p has no disks at time ?t

    ;; static size relation
    (smaller ?x - disk ?y - disk)

    ;; discrete time successor relation
    (succ ?t - time ?s - time)

    ;; time-slot bookkeeping to enforce exactly one move per time point
    (unused ?t - time)                      ;; this time slot has not yet been used for a move
    (moved ?t - time)                       ;; a move was executed at time ?t

    ;; markers set by a move at time ?t to guide copying of unaffected facts
    (moved-disk ?d - disk ?t - time)        ;; disk ?d was the disk moved at time ?t
    (moved-to-peg ?p - peg ?t - time)       ;; the move at time ?t placed some disk onto peg ?p
    (freed ?o - place ?t - time)            ;; the move at time ?t freed the top of place ?o
  )

  ;; Move actions: four variants to cover source/target being peg or disk.
  ;; Each move consumes the (unused ?t) slot and produces moved markers for that time.
  ;; Effects create the successor-time state for the moved disk and for any directly affected supports/pegs.
  ;; Facts for unaffected disks/pegs are copied by separate copy actions (see below).

  (:action move_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (empty ?to ?t)
      (succ ?t ?s)
      (unused ?t)
    )
    :effect (and
      ;; mark time slot used
      (moved ?t)
      (moved-disk ?d ?t)
      (moved-to-peg ?to ?t)
      (freed ?from ?t)
      ;; moved disk at successor
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; source peg is empty at successor
      (empty ?from ?s)
      ;; consume the unused token so no other move can occur at ?t
      (not (unused ?t))
    )
  )

  (:action move_from_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?from ?t)
      (top ?d ?t)
      (empty ?to ?t)
      (succ ?t ?s)
      (unused ?t)
    )
    :effect (and
      (moved ?t)
      (moved-disk ?d ?t)
      (moved-to-peg ?to ?t)
      (freed ?from ?t)
      ;; moved disk at successor
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; the disk that was supporting ?d (i.e., ?from) becomes top at successor
      (top ?from ?s)
      (not (unused ?t))
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
      (unused ?t)
    )
    :effect (and
      (moved ?t)
      (moved-disk ?d ?t)
      (freed ?from ?t)
      (freed ?to ?t)
      ;; place moved disk on top of target disk at successor
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; target is no longer top at successor
      (not (top ?to ?s))
      ;; source peg becomes empty at successor
      (empty ?from ?s)
      (not (unused ?t))
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
      (unused ?t)
    )
    :effect (and
      (moved ?t)
      (moved-disk ?d ?t)
      (freed ?from ?t)
      (freed ?to ?t)
      ;; moved disk at successor
      (on ?d ?to ?s)
      (top ?d ?s)
      ;; source becomes top at successor
      (top ?from ?s)
      ;; target no longer top at successor
      (not (top ?to ?s))
      (not (unused ?t))
    )
  )

  ;; Copy actions: after exactly one move at time ?t has executed (moved ?t),
  ;; copy the on/top/empty facts for every disk/peg that was not the moved disk
  ;; and whose top/support was not freed by the move. Negative preconditions ensure
  ;; we do not overwrite the explicit successor facts created by the move.
  ;; These actions must run for each unaffected disk/peg to build the complete successor state.

  (:action copy_top_from_peg
    :parameters (?d - disk ?p - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?p ?t)
      (top ?d ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?p ?t))
    )
    :effect (and
      (on ?d ?p ?s)
      (top ?d ?s)
      (not (empty ?p ?s))
    )
  )

  (:action copy_top_from_disk
    :parameters (?d - disk ?under - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?under ?t)
      (top ?d ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?under ?t))
    )
    :effect (and
      (on ?d ?under ?s)
      (top ?d ?s)
      (not (top ?under ?s))
    )
  )

  (:action copy_not_top_from_peg
    :parameters (?d - disk ?p - peg ?t - time ?s - time)
    :precondition (and
      (on ?d ?p ?t)
      (not (top ?d ?t))
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?p ?t))
    )
    :effect (and
      (on ?d ?p ?s)
      (not (top ?d ?s))
      (not (empty ?p ?s))
    )
  )

  (:action copy_not_top_from_disk
    :parameters (?d - disk ?under - disk ?t - time ?s - time)
    :precondition (and
      (on ?d ?under ?t)
      (not (top ?d ?t))
      (succ ?t ?s)
      (moved ?t)
      (not (moved-disk ?d ?t))
      (not (freed ?under ?t))
    )
    :effect (and
      (on ?d ?under ?s)
      (not (top ?d ?s))
      (not (top ?under ?s))
    )
  )

  ;; Copy empty pegs that remained empty (no disk was moved onto them)
  (:action copy_empty_peg
    :parameters (?p - peg ?t - time ?s - time)
    :precondition (and
      (empty ?p ?t)
      (succ ?t ?s)
      (moved ?t)
      (not (moved-to-peg ?p ?t))
    )
    :effect (and
      (empty ?p ?s)
    )
  )
)