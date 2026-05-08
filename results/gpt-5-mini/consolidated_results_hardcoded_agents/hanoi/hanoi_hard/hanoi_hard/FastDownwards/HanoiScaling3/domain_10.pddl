(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent step)

  (:predicates
    ;; disk location predicates (separate for disk-under-disk vs disk-on-peg)
    (on-disk ?d - disk ?under - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; clear predicates for pegs and disks
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; agent predicate and step control
    (hanoi-player ?a - agent)
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from a peg to another peg (target peg is empty)
  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-step ?s)
      (step-successor ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ;; after removing ?d from ?from, the peg becomes clear
      (clear-peg ?from)
      ;; destination peg is now not clear
      (not (clear-peg ?to))
      ;; advance step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk from a peg onto another disk
  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (smaller ?d ?target)
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?target)
      ;; source peg becomes clear
      (clear-peg ?from)
      ;; target disk now has something on it, so not clear
      (not (clear-disk ?target))
      ;; advance step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; disk that was under ?d becomes clear
      (clear-disk ?from)
      ;; destination peg is no longer clear
      (not (clear-peg ?to))
      ;; advance step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto another disk
  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (smaller ?d ?target)
      (current-step ?s)
      (step-successor ?s ?s2)
      (not (= ?from ?target))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?target)
      ;; disk that was under ?d becomes clear
      (clear-disk ?from)
      ;; target disk now has something on it, so not clear
      (not (clear-disk ?target))
      ;; advance step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)