(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; placement relations: disk is directly on a peg or on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?s - disk)

    ;; clear means nothing sits on that peg or disk (i.e., it is available as a destination or movable)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering between disks
    (smaller ?d1 - disk ?d2 - disk)

    ;; step control / sequencing
    (ready ?st - step)
    (step-unmoved ?st - step)
    (verified-step ?st - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?st - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear (disk was directly on that peg)
      (clear-peg ?from)
      ;; destination peg now occupied on top
      (not (clear-peg ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move top disk that is directly on a peg to sit on top of another disk
  (:action move-peg-to-disk
    :parameters (?st - step ?d - disk ?from - peg ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes clear
      (clear-peg ?from)
      ;; destination disk no longer clear (has d on it)
      (not (clear-disk ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?st - step ?d - disk ?from - disk ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below becomes clear
      (clear-disk ?from)
      ;; destination peg now occupied on top
      (not (clear-peg ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )

  ;; Move top disk that is on another disk to sit on top of another disk
  (:action move-disk-to-disk
    :parameters (?st - step ?d - disk ?from - disk ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below becomes clear
      (clear-disk ?from)
      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; step bookkeeping
      (not (step-unmoved ?st))
      (not (ready ?st))
      (verified-step ?st)
      (ready ?next)
    )
  )
)