(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate support relations
    (on ?d - disk ?s - disk)         ; disk ?d is directly on disk ?s
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p

    ;; top/emptiness bookkeeping
    (top ?d - disk ?p - peg)         ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p contains no disks

    ;; static size ordering (smaller -> larger)
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage/time bookkeeping (explicit discrete stages)
    (current ?t - stage)             ; current stage/time
    (succ ?t1 - stage ?t2 - stage)   ; successor relation between stages

    ;; static distinctness of pegs (avoid using equality)
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Each move is a single discrete-stage transition: consumes (current ?t) and produces (current ?t2)
  ;; Actions enforce legality: move only top disks, and placing only on empty peg or on larger top disk.

  ;; 1) Move a disk that is directly on a peg to an empty peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?t))
      (current ?t2)

      ;; source updates
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from) ;; source becomes empty because disk was directly on peg

      ;; destination updates
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; 2) Move a disk that is directly on a peg to a peg whose top disk is ?topp (must be larger).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?topp ?to)
      (smaller ?d ?topp)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?t))
      (current ?t2)

      ;; source updates
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from) ;; source becomes empty because disk was directly on peg

      ;; destination updates: place d on topp
      (on ?d ?topp)
      (top ?d ?to)
      (not (top ?topp ?to))
    )
  )

  ;; 3) Move a disk that is directly on another disk ?s to an empty peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (top ?d ?from)
      (on ?d ?s)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?t))
      (current ?t2)

      ;; remove support link and update source top
      (not (on ?d ?s))
      (not (top ?d ?from))
      (top ?s ?from)

      ;; place d on empty destination peg
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; 4) Move a disk that is directly on another disk ?s to a peg whose top disk is ?topp (must be larger).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?topp - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (top ?d ?from)
      (on ?d ?s)
      (top ?topp ?to)
      (smaller ?d ?topp)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?t))
      (current ?t2)

      ;; source updates
      (not (on ?d ?s))
      (not (top ?d ?from))
      (top ?s ?from)

      ;; destination updates: place d on topp
      (on ?d ?topp)
      (top ?d ?to)
      (not (top ?topp ?to))
    )
  )
)