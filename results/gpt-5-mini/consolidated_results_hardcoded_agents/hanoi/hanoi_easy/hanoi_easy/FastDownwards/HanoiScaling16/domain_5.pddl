(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; a peg has nothing on it
    (clear-peg ?p - peg)
    ;; a disk has nothing on it (is the top of its stack)
    (clear-disk ?d - disk)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; assign a planned move to a particular step (four typed variants)
    (assign-p-p ?s - step ?d - disk ?from - peg ?to - peg)
    (assign-d-p ?s - step ?d - disk ?fromd - disk ?to - peg)
    (assign-p-d ?s - step ?d - disk ?from - peg ?to-d - disk)
    (assign-d-d ?s - step ?d - disk ?fromd - disk ?to-d - disk)
    ;; current step marker to enforce sequential execution
    (current ?s - step)
    ;; step successor relation to enforce contiguity
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a disk that is directly on a disk to an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?s - step ?d - disk ?fromd - disk ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (assign-d-p ?s ?d ?fromd ?to)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-disk ?d ?fromd))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?fromd)
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (assign-p-p ?s ?d ?from ?to)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-peg ?from)
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a disk that is directly on a peg onto another disk
  (:action move-disk-from-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (assign-p-d ?s ?d ?from ?tod)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?tod)
                    (smaller ?d ?tod)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod))
              (clear-peg ?from)
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a disk that is directly on a disk onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?d - disk ?fromd - disk ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (assign-d-d ?s ?d ?fromd ?tod)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)
                    (clear-disk ?tod)
                    (smaller ?d ?tod)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-disk ?d ?fromd))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod))
              (clear-disk ?fromd)
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )
)