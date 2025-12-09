(define (domain hanoi7)
  (:requirements :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate support relations
    (on ?d - disk ?s - disk)         ; disk ?d is directly on disk ?s
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p

    ;; top/emptiness bookkeeping
    (top ?d - disk ?p - peg)         ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p contains no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage/time bookkeeping
    (current ?t - stage)             ; current stage/time
    (succ ?t1 - stage ?t2 - stage)   ; successor relation between stages

    ;; static distinctness of pegs (avoid using equality)
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Action variants include explicit stage progression: require current ?t and succ ?t ?t2
  ;; Each action consumes current ?t and produces current ?t2, enforcing one discrete move per stage.

  ;; 1) Source: disk is directly on a peg. Destination: peg is empty.
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

      ;; remove old support and top mark at source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; destination gets disk as on-peg and top; destination ceases to be empty
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; source peg becomes empty (since ?d was directly on the peg)
      (empty ?from)
    )
  )

  ;; 2) Source: disk is directly on a peg. Destination: peg has a top disk ?topp (must be larger than ?d).
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

      ;; remove old support and top mark at source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; place d on top of topp and update top-mark of destination
      (on ?d ?topp)
      (top ?d ?to)
      (not (top ?topp ?to))

      ;; source peg becomes empty
      (empty ?from)
    )
  )

  ;; 3) Source: disk is directly on another disk ?s. Destination: peg is empty.
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

      ;; remove the support link from d to s and remove d's top-mark at source
      (not (on ?d ?s))
      (not (top ?d ?from))

      ;; place d on the empty destination peg and mark it top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; s becomes the new top on the source peg
      (top ?s ?from)
    )
  )

  ;; 4) Source: disk is directly on another disk ?s. Destination: peg has a top disk ?topp (topp must be larger than d).
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

      ;; remove old support and source top mark
      (not (on ?d ?s))
      (not (top ?d ?from))

      ;; place d on topp and update destination top
      (on ?d ?topp)
      (top ?d ?to)
      (not (top ?topp ?to))

      ;; s becomes new top on the source peg
      (top ?s ?from)
    )
  )

)