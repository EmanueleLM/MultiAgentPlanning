(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p (i.e., bottom contact with peg)
    (on-disk ?d - disk ?under - disk)  ; ?d is directly on top of disk ?under
    (clear-disk ?d - disk)             ; nothing directly on disk ?d (it is a top disk)
    (clear-peg ?p - peg)               ; nothing directly on peg ?p (peg has no disks)
    (larger ?x - disk ?y - disk)       ; ?x is larger than ?y
    (current-stage ?s - stage)         ; current discrete stage/time
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; advance stage (enforces one move per stage, contiguous)
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg loses that direct contact; if it had no other disks it becomes clear
      (clear-peg ?from)
      ;; destination peg now has a disk directly on it
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?d))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk to peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was under ?d becomes clear (now top)
      (clear-disk ?from)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto another disk (target must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (not (= ?d ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk onto target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes clear (since ?d was directly on the peg)
      (clear-peg ?from)

      ;; target disk no longer clear (now has disk on top)
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another disk (target must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk onto target disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was under ?d becomes clear (now top)
      (clear-disk ?from)

      ;; target disk no longer clear
      (not (clear-disk ?to))
    )
  )
)