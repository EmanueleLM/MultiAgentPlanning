(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
    (current ?t - time)
    (succ ?t - time ?s - time)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      (not (current ?t))
      (current ?s)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)

      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (current ?t))
      (current ?s)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      (not (clear-peg ?to))
      (clear-disk ?d)

      (not (current ?t))
      (current ?s)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      ;; target disk is no longer clear
      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (current ?t))
      (current ?s)
    )
  )
)